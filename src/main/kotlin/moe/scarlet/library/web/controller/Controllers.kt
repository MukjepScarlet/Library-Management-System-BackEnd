package moe.scarlet.library.web.controller

import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import moe.scarlet.library.annotation.RequiresPermission
import moe.scarlet.library.entity.User
import moe.scarlet.library.extension.checkLogin
import moe.scarlet.library.extension.setLogin
import moe.scarlet.library.service.impl.*
import moe.scarlet.library.web.response.JsonResult
import moe.scarlet.library.web.response.Status
import org.springframework.web.bind.annotation.*
import java.io.Serializable

@RestController
@RequestMapping("/api")
class DynamicController(
    private val userService: UserServiceImpl,
    private val roleService: RoleServiceImpl,
    private val permissionService: PermissionServiceImpl,
    private val bookService: BookServiceImpl,
    private val labelService: LabelServiceImpl,
    private val book2LabelService: Book2LabelServiceImpl,
    private val noticeService: NoticeServiceImpl,
    private val borrowInfoService: BorrowInfoServiceImpl
) {
    private operator fun get(tableName: String): AbstractServiceImpl<*> = when (tableName.lowercase()) {
        "users" -> userService
        "roles" -> roleService
        "permissions" -> permissionService
        "books" -> bookService
        "labels" -> labelService
        "book_label" -> book2LabelService
        "notice" -> noticeService
        "borrowinfo" -> borrowInfoService
        else -> throw IllegalArgumentException("Unknown table name: $tableName")
    }

    private fun Boolean.asJsonResult() = JsonResult(if (this) Status.SUCCESS else Status.INTERNAL_ERROR)

    private val HttpServletRequest.currentUser: User?
        get() = this.checkLogin()?.let(userService::getByIdNumber)

    @GetMapping
    fun getProfile(request: HttpServletRequest, response: HttpServletResponse): JsonResult {
        val user = request.currentUser ?: return JsonResult(Status.AUTH_EXPIRED)
        response.setLogin(user.idNumber)
        return JsonResult(Status.SUCCESS, user)
    }

    data class RegisterParams(val studentIdNumber: String, val password: String, val email: String)

    @PutMapping("/register")
    fun register(@RequestBody params: RegisterParams, response: HttpServletResponse): JsonResult {
        val user = this.userService.register(params.studentIdNumber, params.password, params.email)
        response.setLogin(user.idNumber)
        return JsonResult(Status.SUCCESS, user)
    }

    data class LoginParams(val idNumber: String, val password: String)

    @PutMapping("/login")
    fun login(@RequestBody params: LoginParams, response: HttpServletResponse): JsonResult {
        val user = this.userService.login(params.idNumber, params.password) ?: return JsonResult(Status.WRONG_AUTH)
        response.setLogin(user.idNumber)
        return JsonResult(Status.SUCCESS, user)
    }

    @PutMapping("/logout")
    fun logout(response: HttpServletResponse): JsonResult {
        response.setLogin(null)
        return JsonResult(Status.SUCCESS)
    }

    @GetMapping("/query/{tableName}")
    fun <T> query(
        @PathVariable tableName: String,
        @RequestParam searchBy: String = "",
        @RequestParam query: String = "",
        @RequestParam match: String = "eq",
        @RequestParam sortBy: String = "",
        @RequestParam order: String = "asc",
        @RequestParam start: Int = 0,
        @RequestParam count: Int = 1
    ) = JsonResult(Status.SUCCESS, this[tableName].query(searchBy, query, match, sortBy, order, start, count))

    @RequiresPermission("view")
    @PutMapping
    fun setProfile(@RequestBody user: User, request: HttpServletRequest) =
        if (request.currentUser?.userId != user.userId) JsonResult(Status.WRONG_AUTH)
        else this.userService.updateById(user).asJsonResult()

    @RequiresPermission("view")
    @DeleteMapping("/return")
    fun returnBorrowed(@RequestBody items: List<Long>, request: HttpServletRequest): JsonResult {
        val userId = request.currentUser?.userId ?: return JsonResult(Status.AUTH_EXPIRED)
        return this.borrowInfoService.returnBorrowed(userId, items).asJsonResult()
    }

    data class BorrowParams(val isbn: String, val borrowDays: Long)

    /**
     * 书不够的情况前端处理
     */
    @RequiresPermission("view")
    @PutMapping("/borrow")
    fun borrow(@RequestBody params: BorrowParams, request: HttpServletRequest): JsonResult {
        val userId = request.currentUser?.userId ?: return JsonResult(Status.AUTH_EXPIRED)
        return this.borrowInfoService.newBorrow(userId, params.isbn, params.borrowDays).asJsonResult()
    }

    @RequiresPermission("view")
    @GetMapping("/personal")
    fun myBorrow(
        @RequestParam searchBy: String = "",
        @RequestParam query: String = "",
        @RequestParam match: String = "eq",
        @RequestParam sortBy: String = "",
        @RequestParam order: String = "asc",
        @RequestParam start: Int = 0,
        @RequestParam count: Int = 1,
        request: HttpServletRequest
    ): JsonResult {
        val userId = request.currentUser?.userId ?: return JsonResult(Status.AUTH_EXPIRED)
        return JsonResult(
            Status.SUCCESS,
            this.borrowInfoService.myBorrow(userId, searchBy, query, match, sortBy, order, start, count)
        )
    }

    @RequiresPermission("manage")
    @PutMapping("/add/{tableName}")
    fun <T> add(@PathVariable tableName: String, @RequestBody item: T) =
        (this[tableName] as AbstractServiceImpl<T>).save(item).asJsonResult()

    @RequiresPermission("manage")
    @DeleteMapping("/remove/{tableName}")
    fun <T> remove(@PathVariable tableName: String, @RequestBody items: List<Serializable>) =
        (this[tableName] as AbstractServiceImpl<T>).removeByIds(items).asJsonResult()

    @RequiresPermission("manage")
    @PutMapping("/modify/{tableName}")
    fun <T> modify(@PathVariable tableName: String, @RequestBody item: T) =
        (this[tableName] as AbstractServiceImpl<T>).updateById(item).asJsonResult()

}
