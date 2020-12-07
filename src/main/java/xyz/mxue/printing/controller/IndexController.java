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

    @GetMapping
    public String index() {
        return "index";
    }

    @GetMapping("/index")
    public String indexView() {
        return "index";
    }

    @GetMapping("order-input")
    public String orderInput() {
        return "order-input";
    }
}
