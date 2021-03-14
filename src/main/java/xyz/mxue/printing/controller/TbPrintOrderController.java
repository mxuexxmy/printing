package xyz.mxue.printing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.commonenum.OrderStatusEnum;
import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbPrintOrder;
import xyz.mxue.printing.service.TbPrintOrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;

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

    private String prefix = "printf";

    @Resource
    private TbPrintOrderService orderService;

    @RequestMapping(value = "/calculate", method = RequestMethod.POST)
    public String calculate(ModelMap map,
                                   @ModelAttribute @Valid TbPrintOrder tbPrintOrder) {
        if (tbPrintOrder.getUserName().isEmpty()) {
            map.put("msg","请输入姓名！");
            return prefix + "/index";
        }
        if (tbPrintOrder.getPrinfNumber() == null) {
            map.put("msg","请输入打印份数！");
            return prefix + "/index";
        }
        if (tbPrintOrder.getPaperNumber() == null) {
            map.put("msg","请输入纸张数！");
            return prefix + "/index";
        }
        if (tbPrintOrder.getAmount() == null) {
            map.put("msg","请输入打印一张纸的金额！");
            return prefix +"/index";
        }
        tbPrintOrder.setTotalAmount(tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() );
        tbPrintOrder.setCreateTime(new Date());
        tbPrintOrder.setUpdateTime(new Date());
        tbPrintOrder.setOrderStatus(OrderStatusEnum.UNDONE.getDesc());
        boolean b = orderService.save(tbPrintOrder);
        if (b) {
            map.put("msg", "添加打印记录成功！" + "总价格:" + tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() + "元");
        } else {
            map.put("msg", "添加打印记录失败！");
        }
        return prefix + "/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPrintingOrder(ModelMap map,
                                   @ModelAttribute @Valid TbPrintOrder tbPrintOrder) {
        if (tbPrintOrder.getUserName().isEmpty()) {
            map.put("msg","请输入姓名！");
            return prefix + "/order-input";
        }
        if (tbPrintOrder.getPrinfNumber() == null) {
            map.put("msg","请输入打印份数！");
            return prefix + "/order-input";
        }
        if (tbPrintOrder.getPaperNumber() == null) {
            map.put("msg","请输入纸张数！");
            return prefix + "/order-input";
        }
        if (tbPrintOrder.getAmount() == null) {
            map.put("msg","请输入打印一张纸的金额！");
            return prefix + "/order-input";
        }
        tbPrintOrder.setTotalAmount(tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() );
        tbPrintOrder.setOrderStatus(OrderStatusEnum.UNDONE.getDesc());
        tbPrintOrder.setCreateTime(new Date());
        tbPrintOrder.setUpdateTime(new Date());
        boolean b = orderService.save(tbPrintOrder);
        if (b) {
            map.put("msg", "添加打印记录成功！" + "总价格:" + tbPrintOrder.getPrinfNumber() * tbPrintOrder.getPaperNumber() * tbPrintOrder.getAmount() + "元");
        } else {
            map.put("msg", "添加打印记录失败！");
        }
        return prefix + "/order-input";
    }


    @GetMapping("/list")
    public String printList() {
        return prefix + "/print-list";
    }

    @GetMapping("show/{id}")
    public String orderDetail(@PathVariable Long id, ModelMap map) {
        TbPrintOrder order = orderService.getById(id);
        map.put("order", order);
        return prefix + "/order-detail";
    }

    @PostMapping("confirm")
    public String confirmOrder(@RequestParam(required = true) Long id, ModelMap map) {

        TbPrintOrder tbPrintOrder = orderService.getById(id);
        if (tbPrintOrder.getOrderStatus().equals(OrderStatusEnum.COMPLETE.getDesc())) {
            map.put("msg",tbPrintOrder.getUserName() + "的订单已确认，无需再更改!");
            return prefix + "/print-list";
        }
        tbPrintOrder.setOrderStatus(OrderStatusEnum.COMPLETE.getDesc());
        boolean b = orderService.saveOrUpdate(tbPrintOrder);
        if (b) {
            if (tbPrintOrder.getUserName().isEmpty()) {
                 map.put("msg", "序号" +tbPrintOrder.getId() + "用户的订单已完成");
                 return prefix + "/print-list";
            }
            map.put("msg", tbPrintOrder.getUserName() + "的订单已完成");
            return prefix + "/print-list";
        }
        map.put("msg", "订单确认失败，请稍后再试！");
        return prefix + "/print-list";
    }

    @GetMapping("delete/{id}")
    @ResponseBody
    public Result deleteOrder(@PathVariable Long id, ModelMap map) {
        boolean b = orderService.removeById(id);
        if (b) {
             return Result.success("序号" + id + "的打印记录删除成功!");
        }
        return Result.fail("序号" + id + "的打印记录删除失败!");
    }


    /**
     * 分页查询
     *
     * @param request
     * @param tbPrintOrder
     * @return
     */
    @ResponseBody
    @GetMapping("/page")
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

