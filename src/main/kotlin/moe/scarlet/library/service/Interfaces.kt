package moe.scarlet.library.service

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper
import com.baomidou.mybatisplus.extension.service.IService
import moe.scarlet.library.entity.BorrowInfo
import moe.scarlet.library.entity.User
import java.time.LocalDateTime

data class QueryResult<T>(val count: Long, val data: List<T>)

interface ISearchable<T> : IService<T> {
    fun query(
        searchBy: String,
        query: String,
        match: String,
        sortBy: String,
        order: String,
        start: Int,
        count: Int,
        preprocessor: (QueryWrapper<T>) -> Unit = {}
    ): QueryResult<T>
}

interface IBorrowInfoService : ISearchable<BorrowInfo> {
    fun myBorrow(
        userId: Long,
        searchBy: String,
        query: String,
        match: String,
        sortBy: String,
        order: String,
        start: Int,
        count: Int
    ): QueryResult<BorrowInfo>

    fun newBorrow(userId: Long, isbn: String, returnTime: LocalDateTime): Boolean
}

interface IUserService : ISearchable<User> {
    fun register(studentIdNumber: String, password: String, email: String): User
    fun login(idNumber: String, password: String): User?
    fun getByIdNumber(idNumber: String): User?
}
