package xyz.mxue.printing.controller;


import cn.hutool.core.date.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import xyz.mxue.printing.commons.model.PageInfo;
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
    public String update(@PathVariable Long id, ModelMap map) {
        TbOrderDay orderDay = dayService.getById(id);
        String message = dayService.dayRecord(orderDay.getStatsDay());
        map.put("msg", DateUtil.format(orderDay.getStatsDay(), "yyyy-MM-dd") + "的" + message);
        return prefix + "/order-day";
    }

    /**
     * 分页查询
     *
     * @param request
     * @param tbOrderDay
     * @return
     */
    @ResponseBody
    @GetMapping("/page")
    public PageInfo<TbOrderDay> page(HttpServletRequest request, TbOrderDay tbOrderDay) {
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        // 封装 Datatables 需要的结果
        PageInfo<TbOrderDay> pageInfo = dayService.page(start, length, draw, tbOrderDay);

        return pageInfo;
    }

}

