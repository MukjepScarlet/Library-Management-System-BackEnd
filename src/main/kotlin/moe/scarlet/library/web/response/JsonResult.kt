package moe.scarlet.library.web.response

data class JsonResult(val status: Status, val data: Any? = null) {
    val code: Int
        get() = status.code

    val message: String
        get() = status.message
}

enum class Status(val code: Int, val message: String) {
    SUCCESS(200, "操作成功"),
    WRONG_AUTH(401, "账号或密码错误"),
    NO_LOGIN_ERROR(411, "未检测到登录状态"),
    NO_AUTH_ERROR(413, "操作权限不足"),
    INTERNAL_ERROR(500, "服务器内部出错, 请联系管理员"),
}
