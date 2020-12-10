package xyz.mxue.printing.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.entity.TbUser;
import xyz.mxue.printing.service.TbUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-08
 */
@Controller
@RequestMapping("/printing/tb-user")
public class TbUserController {

    @Resource
    private TbUserService userService;

    @GetMapping("profile")
    public String profile(ModelMap map, HttpServletRequest request) {
        TbUser tbUser = (TbUser) request.getSession().getAttribute("user");
        map.addAttribute("tbUser", tbUser);
        return "profile";
    }

    @GetMapping("profile/info")
    public String profileInfo() {
        return "profile";
    }

    @PostMapping("update")
    public String profileUpdate(ModelMap map, @Valid TbUser tbUser, HttpServletRequest request) {
        TbUser tbUser1 = (TbUser) request.getSession().getAttribute("user");
        tbUser1.setUserName(tbUser.getUserName());
        tbUser1.setAddress(tbUser.getAddress());
        tbUser1.setUserPhone(tbUser.getUserPhone());
        boolean b = userService.updateById(tbUser1);
        if (b) {
            return "redirect:/printing/tb-user/profile";
        }
        map.put("msg","基本信息修改失败");
        return "index";
    }

    /**
     * 修改个人密码
     * @param oldPassword
     * @param newPassword
     * @param request
     * @return
     */
    @PostMapping("/password")
    public String updatePassword(@RequestParam("oldPassword") String  oldPassword, @RequestParam("newPassword") String newPassword, HttpServletRequest request, ModelMap map) {
        TbUser tbUser = (TbUser) request.getSession().getAttribute("user");
        // 查询原密码是否符合
        if (tbUser.getPassword().equals(DigestUtils.md5DigestAsHex(oldPassword.getBytes()))) {
            tbUser.setPassword(DigestUtils.md5DigestAsHex(newPassword.getBytes()));
            userService.updateById(tbUser);
            request.getSession().invalidate();
            return "login";
        }
        map.put("msg","原密码错误，请重新输入");
        return "index";
    }

}

