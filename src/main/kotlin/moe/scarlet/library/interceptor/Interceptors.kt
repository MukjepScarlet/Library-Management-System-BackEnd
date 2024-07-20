package moe.scarlet.library.interceptor

import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import moe.scarlet.library.annotation.RequiresPermission
import moe.scarlet.library.extension.checkLogin
import moe.scarlet.library.extension.clientIp
import moe.scarlet.library.service.impl.PermissionServiceImpl
import moe.scarlet.library.service.impl.RoleServiceImpl
import moe.scarlet.library.service.impl.UserServiceImpl
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component
import org.springframework.web.method.HandlerMethod
import org.springframework.web.servlet.HandlerInterceptor

@Component
class DefaultInterceptor(
    private val userService: UserServiceImpl,
    private val roleService: RoleServiceImpl,
    private val permissionService: PermissionServiceImpl,
) : HandlerInterceptor {

    private val logger = LoggerFactory.getLogger(DefaultInterceptor::class.java)

    override fun preHandle(request: HttpServletRequest, response: HttpServletResponse, handler: Any): Boolean {
        this.logger.info("${request.requestURI}: new ${request.method} request from ${request.clientIp}")

        if (handler !is HandlerMethod) return true

        val requiresPermission = handler.method.getAnnotation(RequiresPermission::class.java) ?: return true

        val user = request.checkLogin()?.let(userService::getByIdNumber) ?: run {
            response.status = HttpServletResponse.SC_UNAUTHORIZED
            response.writer.write("Unauthorized")
            return false
        }

        val role = roleService.getById(user.roleId) ?: run {
            response.status = HttpServletResponse.SC_FORBIDDEN
            response.writer.write("Forbidden")
            return false
        }

        val hasPermission = role.permissionId.split(',').any {
            permissionService.getById(it.toLongOrNull())?.aclValue == requiresPermission.aclValue
        }

        return if (hasPermission) true else {
            response.status = HttpServletResponse.SC_FORBIDDEN
            response.writer.write("Forbidden")
            false
        }
    }
}
