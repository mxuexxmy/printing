package xyz.mxue.printing.controller;

import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import xyz.mxue.printing.commons.commonenum.ConstantUtils;
import xyz.mxue.printing.entity.TbUser;
import xyz.mxue.printing.service.TbUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author mxuexxmy
 * @date 12/8/2020$ 12:47 AM$
 */
@Controller
@RequestMapping
public class LoginController {

    @Resource
    private TbUserService userService;

    @PostMapping("login")
    public String login(@RequestParam(required = true) String userPhone, @RequestParam(required = true) String password,
                        HttpServletRequest httpServletRequest, ModelMap map) {
        System.out.println("userPhone:" + userPhone + " password:" + password);
        TbUser user = userService.getByUsername(userPhone, password);
        if (user == null) {
            map.put("msg", "手机号或者密码不正确");
            return "login";
        }
        // 登录成功
        else {
            httpServletRequest.getSession().setAttribute(ConstantUtils.SESSION_USER, user);
            return "redirect:/index";
        }
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest httpServletRequest, ModelMap map){
        httpServletRequest.getSession().invalidate();
        return "login";
    }

}
