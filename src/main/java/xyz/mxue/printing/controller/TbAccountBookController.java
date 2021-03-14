package xyz.mxue.printing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Controller
@RequestMapping("/printing/tb-account-book")
public class TbAccountBookController {

    private String prefix = "book-keeping";

    @GetMapping()
    private String index() {
        return prefix + "/account";
    }

}

