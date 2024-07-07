package moe.scarlet.library.entity

import com.baomidou.mybatisplus.annotation.IdType
import com.baomidou.mybatisplus.annotation.TableId
import com.baomidou.mybatisplus.annotation.TableName
import java.math.BigDecimal
import java.time.LocalDate
import java.time.LocalDateTime

@TableName("users")
data class User(
    @TableId(type = IdType.AUTO)
    val userId: Long,
    val idNumber: String,
    val studentIdNumber: String,
    val userName: String?,
    val password: String,
    val email: String,
    val roleId: Long,
    val createDate: LocalDate,
    val bookNum: Int,
    val fine: BigDecimal
)

@TableName("roles")
data class Role(@TableId(type = IdType.AUTO) val id: Long, val roleName: String, val permissionId: String)

@TableName("permissions")
data class Permission(@TableId(type = IdType.AUTO) val id: Long, val permissionName: String, val aclValue: String)

@TableName("books")
data class Book(
    @TableId(type = IdType.INPUT)
    val isbn: String,
    val name: String,
    val author: String,
    val press: String,
    val price: BigDecimal,
    val num: Int,
    val position: String,
    val date: LocalDate
)

@TableName("labels")
data class Label(@TableId(type = IdType.AUTO) val id: Long, val name: String, val num: Int)

@TableName("book_label")
data class Book2Label(@TableId(type = IdType.AUTO) val id: Long, val isbn: String, val labelId: Long)

@TableName("notice")
data class Notice(
    @TableId(type = IdType.AUTO)
    val id: Long,
    val title: String,
    val content: String,
    val createTime: LocalDateTime,
    val updateTime: LocalDateTime,
    val viewNum: Int
)

@TableName("borrowInfo")
data class BorrowInfo(
    @TableId(type = IdType.AUTO)
    val id: Long,
    val isbn: String,
    val userId: Long,
    val beginTime: LocalDateTime,
    val returnTime: LocalDateTime,
    val fine: BigDecimal
)
