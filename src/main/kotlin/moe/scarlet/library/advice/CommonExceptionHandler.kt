package moe.scarlet.library.advice

import jakarta.servlet.http.HttpServletResponse
import moe.scarlet.library.web.response.JsonResult
import moe.scarlet.library.web.response.Status
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice

@RestControllerAdvice
class CommonExceptionHandler {

    @ExceptionHandler(RuntimeException::class)
    fun runTimeExp(e: RuntimeException, resp: HttpServletResponse): JsonResult {
        e.printStackTrace()
        resp.contentType = "application/json;charset=utf-8"
        return JsonResult(Status.INTERNAL_ERROR, e.localizedMessage)
    }
}