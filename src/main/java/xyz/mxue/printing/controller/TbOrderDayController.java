package xyz.mxue.printing.controller;


import cn.hutool.core.date.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbOrderDay;
import xyz.mxue.printing.service.TbOrderDayService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * <p>
 * 日记录 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
@Controller
@RequestMapping("/printing/tb-order-day")
public class TbOrderDayController {

    private String prefix = "printf";

    @Resource
    private TbOrderDayService dayService;

    @GetMapping
    public String orderDay() {
        return prefix + "/order-day";
    }

    @GetMapping("update/{id}")
    @ResponseBody
    public Result update(@PathVariable Long id) {
        TbOrderDay orderDay = dayService.getById(id);
        String message = dayService.dayRecord(orderDay.getStatsDay());
        return Result.success(DateUtil.format(orderDay.getStatsDay(), "yyyy-MM-dd") + "的" + message);
    }

    @ResponseBody
    @GetMapping("/page")
    public PageInfo<TbOrderDay> page(@RequestParam(value = "draw", required = false, defaultValue = "0") Integer draw,
                                     @RequestParam(value = "start", required = false, defaultValue = "0")Integer start,
                                     @RequestParam(value = "length", required = false, defaultValue = "10") Integer length,
                                     TbOrderDay tbOrderDay) {

        // 封装 Datatables 需要的结果
        PageInfo<TbOrderDay> pageInfo = dayService.page(start, length, draw, tbOrderDay);

        return pageInfo;
    }

}

