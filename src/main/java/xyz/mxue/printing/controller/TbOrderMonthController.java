package xyz.mxue.printing.controller;


import cn.hutool.core.date.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.service.TbOrderMonthService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * <p>
 * 月记录 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
@Controller
@RequestMapping("/printing/tb-order-month")
public class TbOrderMonthController {

    private String prefix = "printf";

    @Resource
    private TbOrderMonthService monthService;

    @GetMapping
    public String orderMonth() {
        return prefix + "/order-month";
    }


    @GetMapping("update/{id}")
    @ResponseBody
    public Result update(@PathVariable Long id) {
        TbOrderMonth orderMonth = monthService.getById(id);
        String message = monthService.monthRecord(orderMonth.getStatsMonth());
        return Result.success(DateUtil.format(orderMonth.getStatsMonth(), "yyyy-MM") + message);
    }

    /**
     * 分页查询
     *
     * @param request
     * @param tbOrderMonth
     * @return
     */
    @ResponseBody
    @GetMapping("/page")
    public PageInfo<TbOrderMonth> page(HttpServletRequest request, TbOrderMonth tbOrderMonth) {
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        // 封装 Datatables 需要的结果
        PageInfo<TbOrderMonth> pageInfo = monthService.page(start, length, draw, tbOrderMonth);

        return pageInfo;
    }

}

