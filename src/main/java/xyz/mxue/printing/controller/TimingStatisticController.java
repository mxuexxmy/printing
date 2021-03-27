package xyz.mxue.printing.controller;

import cn.hutool.core.date.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.mxue.printing.commons.model.Result;
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

    private String prefix = "printf";

    @Resource
    private TbOrderDayService dayService;

    @Resource
    private TbOrderMonthService monthService;

    @Resource
    private TbOrderYearService yearService;

    @GetMapping("day-record")
    @ResponseBody
    public Result dayRecord() {
        Date date = new Date();
        String message = dayService.dayRecord(date);
        return Result.success(DateUtil.format(date, "yyyy-MM-dd") + message);
    }

    @GetMapping("month-record")
    @ResponseBody
    public Result monthRecord() {
        Date date = new Date();
        String message = monthService.monthRecord(date);
        return Result.success(DateUtil.format(date, "yyyy-MM") + message);
    }

    @GetMapping("year-record")
    @ResponseBody
    public Result yearRecord() {
        Date date = new Date();
        String message = yearService.yearRecord(date);
        return Result.success(DateUtil.format(date, "yyyy") + message);
    }
}
