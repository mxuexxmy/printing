package xyz.mxue.printing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author mxuexxmy
 * @date 12/6/2020$ 8:55 PM$
 */
@Controller
@RequestMapping
public class IndexController {

    private String prefix = "printf";

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
        return "/index";
    }

    @GetMapping("/input-printf")
    public String inputPrintf() {
        return prefix + "/input-printf";
    }

    @GetMapping("/order-input")
    public String orderInput() {
        return prefix + "/order-input";
    }
}
