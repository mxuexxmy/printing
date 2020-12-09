package xyz.mxue.printing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.mxue.printing.commons.commonenum.ConstantUtils;
import xyz.mxue.printing.entity.TbUser;

import javax.servlet.http.HttpServletRequest;

/**
 * @author mxuexxmy
 * @date 12/6/2020$ 8:55 PM$
 */
@Controller
@RequestMapping
public class IndexController {

    @GetMapping()
    public String index() {
        return "login";
    }

    @GetMapping("login")
    public String login() {
        return "login";
    }

    @GetMapping("about")
    public String about() {
        return "about";
    }

    @GetMapping("/index")
    public String indexView() {
        return "index";
    }

    @GetMapping("/order-input")
    public String orderInput() {
        return "order-input";
    }
}
