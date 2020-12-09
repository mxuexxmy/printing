package xyz.mxue.printing.commons.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import xyz.mxue.printing.interceptor.LoginInterceptor;
import xyz.mxue.printing.interceptor.PermissionInterceptor;

/**
 * @author mxuexxmy
 * @date 12/9/2020$ 11:41 PM$
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {


    /**
     * 添加自定义拦截器
     * .addPathPatterns("/**")  拦截的请求路径
     * .excludePathPatterns("/login"); 排除的请求路径
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/login", "/**", "/about");

        registry.addInterceptor(new PermissionInterceptor())
                .addPathPatterns("/**");
    }

}
