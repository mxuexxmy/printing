package xyz.mxue.printing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import xyz.mxue.printing.commons.commonenum.ConstantUtils;
import xyz.mxue.printing.commons.model.Result;
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

    @PostMapping("/login")
    @ResponseBody
    public Result login(@RequestBody TbUser tbUser, HttpServletRequest httpServletRequest) {
        TbUser user = userService.getByUsername(tbUser.getUserPhone(), tbUser.getPassword());
        if (user == null) {
            return Result.fail("手机号或者密码不正确");
        }
        // 登录成功
        else {
            httpServletRequest.getSession().setAttribute(ConstantUtils.SESSION_USER, user);
            return Result.success("登录成功！");
        }
    }

    @GetMapping("logout")
    @ResponseBody
    public Result logout(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();
        return Result.success("系统退出成功！");
    }

}
