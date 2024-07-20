package moe.scarlet.library.config

import moe.scarlet.library.interceptor.DefaultInterceptor
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.CorsRegistry
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@Configuration
class WebConfig(
    private val defaultInterceptor: DefaultInterceptor,
) : WebMvcConfigurer {

    override fun addCorsMappings(registry: CorsRegistry) {
        registry.addMapping("/**")
            .allowedOriginPatterns("*")
            .allowedMethods("GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS", "PATCH")
            .allowCredentials(true)
            .allowedHeaders("*")
            .maxAge(30);
    }

    override fun addInterceptors(registry: InterceptorRegistry) {
        registry.addInterceptor(defaultInterceptor).addPathPatterns("/**")
    }

}
