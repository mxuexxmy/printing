package xyz.mxue.printing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbUser;
import xyz.mxue.printing.entity.dto.PasswordDTO;
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

    private String printfPrefix = "printf";

    private String prefix = "user";

    @Resource
    private TbUserService userService;

    @GetMapping("profile")
    public String profile(ModelMap map, HttpServletRequest request) {
        TbUser tbUser = (TbUser) request.getSession().getAttribute("user");
        map.addAttribute("tbUser", tbUser);
        return prefix + "/profile";
    }

    @GetMapping("profile/info")
    public String profileInfo() {
        return prefix + "/profile";
    }

    @PostMapping("update")
    @ResponseBody
    public Result profileUpdate(@RequestBody TbUser tbUser, HttpServletRequest request) {
        TbUser tbUser1 = (TbUser) request.getSession().getAttribute("user");
        tbUser1.setUserName(tbUser.getUserName());
        tbUser1.setAddress(tbUser.getAddress());
        tbUser1.setUserPhone(tbUser.getUserPhone());
        boolean b = userService.updateById(tbUser1);
        return b == true ? Result.success("基本信息修改成功！") : Result.fail("基本信息修改失败");
    }

    /**
     * 修改个人密码
     *
     * @param passwordDTO
     * @param request
     * @return
     */
    @PostMapping("/password")
    @ResponseBody
    public Result updatePassword(@RequestBody PasswordDTO passwordDTO, HttpServletRequest request) {
        System.out.println(passwordDTO);
        TbUser tbUser = (TbUser) request.getSession().getAttribute("user");
        // 查询原密码是否符合
        if (tbUser.getPassword().equals(DigestUtils.md5DigestAsHex(passwordDTO.getOldPassword().getBytes()))) {
            tbUser.setPassword(DigestUtils.md5DigestAsHex(passwordDTO.getNewPassword().getBytes()));
            userService.updateById(tbUser);
            request.getSession().invalidate();
          return Result.success("密码修改成功，正在退出！");
        }
        return Result.fail("原密码错误，请重新输入");
    }

}

