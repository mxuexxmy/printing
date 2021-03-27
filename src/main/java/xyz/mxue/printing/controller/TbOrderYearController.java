package xyz.mxue.printing.controller;


import cn.hutool.core.date.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbOrderYear;
import xyz.mxue.printing.service.TbOrderYearService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 年记录 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
@Controller
@RequestMapping("/printing/tb-order-year")
public class TbOrderYearController {

    private String prefix = "printf";

    @Resource
    private TbOrderYearService yearService;

    @GetMapping
    public String orderYear() {
        return prefix + "/order-year";
    }

    @GetMapping("update/{id}")
    @ResponseBody
    public Result update(@PathVariable Long id) {
        TbOrderYear orderYear = yearService.getById(id);
        String message = yearService.yearRecord(orderYear.getStatsYear());
        return Result.success(DateUtil.format(orderYear.getStatsYear(), "yyyy")  + message);
    }

    @ResponseBody
    @GetMapping("/page")
    public PageInfo<TbOrderYear> page(@RequestParam(value = "draw", required = false, defaultValue = "0") Integer draw,
                                      @RequestParam(value = "start", required = false, defaultValue = "0")Integer start,
                                      @RequestParam(value = "length", required = false, defaultValue = "10") Integer length,
                                      TbOrderYear tbOrderYear) {

        // 封装 Datatables 需要的结果
        PageInfo<TbOrderYear> pageInfo = yearService.page(start, length, draw, tbOrderYear);

        return pageInfo;
    }


}

