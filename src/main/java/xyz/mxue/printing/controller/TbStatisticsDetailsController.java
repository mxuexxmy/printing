package xyz.mxue.printing.controller;


import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import xyz.mxue.printing.service.TbStatisticsDetailsService;

import javax.annotation.Resource;

/**
 * <p>
 * 类别消费统计 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-20
 */
@RestController
@RequestMapping("/printing/tb-statistics-details")
public class TbStatisticsDetailsController {

    private String prefix = "book-keeping";

    @Resource
    private TbStatisticsDetailsService statisticsDetailsService;

    private String index(ModelMap map) {
      return prefix + "/statistics";
    }
}

