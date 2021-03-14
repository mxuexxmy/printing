package xyz.mxue.printing.controller;

import cn.hutool.core.date.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.mxue.printing.service.TbOrderDayService;
import xyz.mxue.printing.service.TbOrderMonthService;
import xyz.mxue.printing.service.TbOrderYearService;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author mxuexxmy
 * @date 12/7/2020$ 1:11 AM$
 */
@Controller
@RequestMapping("time")
public class TimingStatisticController {

    private String prefix = "time";

    @Resource
    private TbOrderDayService dayService;

    @Resource
    private TbOrderMonthService monthService;

    @Resource
    private TbOrderYearService yearService;

    @GetMapping
    public String time() {
        return prefix + "/timing-statistics";
    }

    @GetMapping("day-record")
    public String dayRecord(ModelMap map) {
        Date date = new Date();
        String message = dayService.dayRecord(date);
        map.put("msg", DateUtil.format(date, "yyyy-MM-dd") + message);
        return prefix + "/timing-statistics";
    }

    @GetMapping("month-record")
    public String monthRecord(ModelMap map) {
        Date date = new Date();
        String message = monthService.monthRecord(date);
        map.put("msg",DateUtil.format(date, "yyyy-MM") + message);
        return prefix + "/timing-statistics";
    }

    @GetMapping("year-record")
    public String yearRecord(ModelMap map) {
        Date date = new Date();
        String message = yearService.yearRecord(date);
        map.put("msg", DateUtil.format(date, "yyyy") +  message);
        return prefix + "/timing-statistics";
    }
}
