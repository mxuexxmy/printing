package xyz.mxue.printing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * <p>
 * 统计盈亏 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Controller
@RequestMapping("/printing/tb-statistics")
public class TbStatisticsController {

    private String prefix = "book-keeping";

    @GetMapping
    public String index() {
        return prefix + "/statistics";
    }


}

