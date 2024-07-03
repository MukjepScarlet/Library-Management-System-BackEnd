package moe.scarlet.library.web.controller

import moe.scarlet.library.entity.*
import moe.scarlet.library.service.impl.*
import moe.scarlet.library.web.response.*
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

    @PutMapping("/add/{tableName}")
    fun <T> add(@PathVariable tableName: String, @RequestBody item: T) =
        (this[tableName] as AbstractServiceImpl<T>).save(item).asJsonResult()

    @DeleteMapping("/remove/{tableName}")
    fun <T> remove(@PathVariable tableName: String, @RequestBody items: List<Serializable>) =
        (this[tableName] as AbstractServiceImpl<T>).removeByIds(items).asJsonResult()

    @PutMapping("/modify/{tableName}")
    fun <T> modify(@PathVariable tableName: String, @RequestBody item: T) =
        (this[tableName] as AbstractServiceImpl<T>).updateById(item).asJsonResult()

    @GetMapping("/personal/{userId}")
    fun myBorrow(
        @PathVariable userId: Long,
        @RequestParam searchBy: String = "",
        @RequestParam query: String = "",
        @RequestParam match: String = "eq",
        @RequestParam sortBy: String = "",
        @RequestParam order: String = "asc",
        @RequestParam start: Int = 0,
        @RequestParam count: Int = 1
    ) = JsonResult(
        Status.SUCCESS,
        this.borrowInfoService.myBorrow(userId, searchBy, query, match, sortBy, order, start, count)
    )

    data class RegisterParams(val studentIdNumber: String, val password: String, val email: String)

    @PutMapping("/register/")
    fun register(@RequestBody params: RegisterParams) =
        JsonResult(Status.SUCCESS, this.userService.register(params.studentIdNumber, params.password, params.email))

    data class LoginParams(val idNumber: String, val password: String)

    @PutMapping("/login/")
    fun login(@RequestBody params: LoginParams) = this.userService.login(params.idNumber, params.password)
        .let { JsonResult(if (it == null) Status.WRONG_AUTH else Status.SUCCESS, it) }

}
