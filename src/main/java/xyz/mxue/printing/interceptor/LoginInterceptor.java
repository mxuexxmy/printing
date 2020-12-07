package xyz.mxue.printing.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import xyz.mxue.printing.commons.commonenum.ConstantUtils;
import xyz.mxue.printing.entity.TbUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author mxuexxmy
 * @date 12/8/2020$ 1:48 AM$
 */
public class LoginInterceptor implements HandlerInterceptor {
    private HttpServletRequest httpServletRequest;
    private HttpServletResponse httpServletResponse;
    private Object o;
    private Exception e;

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        TbUser user = (TbUser) httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_USER);

        // 未登录
        if (user == null) {
            httpServletResponse.sendRedirect("/");
        }

        // 放行
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
