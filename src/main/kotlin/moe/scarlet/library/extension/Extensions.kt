package moe.scarlet.library.extension

import jakarta.servlet.http.Cookie
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import moe.scarlet.library.util.Crypto.decrypt
import moe.scarlet.library.util.Crypto.encrypt

private const val EXPIRE_TIME = 60 * 60 * 24 * 3 // 3 day
private const val USER_INFO_KEY = "USER_INFO"

val HttpServletRequest.clientIp: String?
    get() = sequenceOf(
        "X-Forwarded-For",
        "Proxy-Client-IP",
        "WL-Proxy-Client-IP",
        "HTTP_X_FORWARDED_FOR",
        "HTTP_X_FORWARDED",
        "HTTP_X_CLUSTER_CLIENT_IP",
        "HTTP_CLIENT_IP",
        "HTTP_FORWARDED_FOR",
        "HTTP_FORWARDED",
        "HTTP_VIA",
        "REMOTE_ADDR"
    ).mapNotNull(this::getHeader).flatMap {
        it.split(",").map(String::trim)
    }.firstOrNull { it.isNotEmpty() && !"unknown".equals(it, true) } ?: this.remoteAddr

private fun createEncryptedUserInfo(idNumber: String) = "${System.currentTimeMillis()}@$idNumber".encrypt()

/**
 * 通过 cookie 设置
 * @param idNumber null=取消登录
 */
fun HttpServletResponse.setLogin(idNumber: String?) {
    // format: timestamp@idNumber
    with(
        Cookie(
            USER_INFO_KEY,
            idNumber?.let(::createEncryptedUserInfo)
        )
    ) {
        this.path = "/"
        this.maxAge = if (idNumber == null) 0 else EXPIRE_TIME
        this@setLogin.addCookie(this)
    }
}

/**
 * 通过 session 设置
 * @param idNumber null=取消登录
 */
fun HttpServletRequest.setLogin(idNumber: String?) {
    if (idNumber == null) this.getSession(false)?.invalidate()
    else this.session.setAttribute(USER_INFO_KEY, createEncryptedUserInfo(idNumber))
}

/**
 * 检查 session 和 cookie
 * @return 请求登录的 idNumber (若有)
 */
fun HttpServletRequest.checkLogin(): String? {
    val userInfo = this.getSession(false)?.getAttribute(USER_INFO_KEY) as? String
        ?: this.cookies?.firstOrNull { it.name == USER_INFO_KEY }?.value ?: return null // unauthorized
    try {
        val (logTime, idNumber) = userInfo.decrypt().split("@")
        return if (System.currentTimeMillis() - logTime.toLong() > 1000 * EXPIRE_TIME) null else idNumber
    } catch (e: Exception) {
        return null
    }
}
