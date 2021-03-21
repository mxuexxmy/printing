package xyz.mxue.printing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import xyz.mxue.printing.service.TbStatisticsDetailsService;

import javax.annotation.Resource;
import java.util.Date;

/**
 * <p>
 * 类别消费统计 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-20
 */
@Controller
@RequestMapping("/printing/tb-statistics-details")
public class TbStatisticsDetailsController {

    private String prefix = "book-keeping";

    @Resource
    private TbStatisticsDetailsService statisticsDetailsService;

    @GetMapping("/month")
    private String month(ModelMap map) {
        map.put("statisticsTimes", statisticsDetailsService.statisticsTimeShowOfMonth(new Date()));
        return prefix + "/statistics-month";
    }

    @GetMapping("/year")
    private String year(ModelMap map) {
        map.put("statisticsTimes", statisticsDetailsService.statisticsTimeShowOfYear(new Date()));
        return prefix + "/statistics-year";
    }
}

