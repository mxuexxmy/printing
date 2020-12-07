package xyz.mxue.printing.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.entity.TbOrderYear;
import xyz.mxue.printing.entity.TbPrintOrder;
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

    @Resource
    private TbOrderYearService yearService;

    @GetMapping
    public String orderYear() {
        return "order-year";
    }

    /**
     * 分页查询
     *
     * @param request
     * @param tbOrderYear
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public PageInfo<TbOrderYear> page(HttpServletRequest request, TbOrderYear tbOrderYear) {
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        // 封装 Datatables 需要的结果
        PageInfo<TbOrderYear> pageInfo = yearService.page(start, length, draw, tbOrderYear);

        return pageInfo;
    }


}

