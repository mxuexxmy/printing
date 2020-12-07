package xyz.mxue.printing.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbPrintOrder;
import xyz.mxue.printing.service.TbPrintOrderService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 打印订单 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-06
 */
@Controller
@RequestMapping("/printing/tb-print-order")
public class TbPrintOrderController {

    @Autowired
    private TbPrintOrderService orderService;

    @RequestMapping(value = "/calculate", method = RequestMethod.POST)
    public String calculate(ModelMap map,
                                   @ModelAttribute @Valid TbPrintOrder tbPrintOrder) {
        tbPrintOrder.setTotalAmount(tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() );
        tbPrintOrder.setCreateTime(new Date());
        tbPrintOrder.setUpdateTime(new Date());
        boolean b = orderService.save(tbPrintOrder);
        if (b) {
            map.put("msg", "添加到打印记录！");
            map.put("totalAmount", "总价格:" + tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() + "元");
        } else {
            map.put("msg", "添加打印记录失败！");
        }
        return "index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPrintingOrder(ModelMap map,
                                   @ModelAttribute @Valid TbPrintOrder tbPrintOrder) {
        tbPrintOrder.setTotalAmount(tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() );
        tbPrintOrder.setCreateTime(new Date());
        tbPrintOrder.setUpdateTime(new Date());
        boolean b = orderService.save(tbPrintOrder);
        if (b) {
            map.put("msg", "添加打印记录成功！");
            map.put("totalAmount", "总价格:" + tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() + "元");
        } else {
            map.put("msg", "添加打印记录失败！");
        }
        return "print-list";
    }


    @GetMapping("/list")
    public String printList() {
        return "print-list";
    }

    @GetMapping("show/{id}")
    public String orderDetail(@PathVariable Long id, ModelMap map) {
        TbPrintOrder order = orderService.getById(id);
        map.put("order", order);
        return "order-detail";
    }

    /**
     * 分页查询
     *
     * @param request
     * @param tbPrintOrder
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public PageInfo<TbPrintOrder> page(HttpServletRequest request, TbPrintOrder tbPrintOrder) {
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        // 封装 Datatables 需要的结果
        PageInfo<TbPrintOrder> pageInfo = orderService.page(start, length, draw, tbPrintOrder);

        return pageInfo;
    }

}

