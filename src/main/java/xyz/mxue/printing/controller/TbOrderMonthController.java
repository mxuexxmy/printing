package xyz.mxue.printing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderDay;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.entity.TbPrintOrder;
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

    @Resource
    private TbOrderMonthService monthService;

    @GetMapping
    public String orderMonth() {
        return "order-month";
    }

    @GetMapping("month-record")
    public String monthRecord(ModelMap map) {
        String message = monthService.monthRecord(new Date());
        map.put("msg", message);
        return "timing-statistics";
    }

    /**
     * 分页查询
     *
     * @param request
     * @param tbOrderMonth
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/page", method = RequestMethod.GET)
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

