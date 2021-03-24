package xyz.mxue.printing.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.commonenum.OrderStatusEnum;
import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbPrintOrder;
import xyz.mxue.printing.entity.TbPrintfInfo;
import xyz.mxue.printing.entity.dto.PrintfInfoDTO;
import xyz.mxue.printing.entity.dto.PrintfOrderInfoDTO;
import xyz.mxue.printing.entity.vo.PrintfNumberInfoVO;
import xyz.mxue.printing.service.TbPrintOrderService;
import xyz.mxue.printing.service.TbPrintfInfoService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.*;

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

    // 双面
    private final Integer DOUBLE = 2;

    private String prefix = "printf";

    @Resource
    private TbPrintOrderService orderService;

    @Resource
    private TbPrintfInfoService printfInfoService;

    @PostMapping(value = "/calculate")
    public String calculate(ModelMap map,
                            @ModelAttribute @Valid PrintfOrderInfoDTO printfOrderInfoDTO) {

        if (printfOrderInfoDTO.getUserName().isEmpty()) {
            map.put("msg", "请输入姓名！");
            return prefix + "/input-printf";
        }

        // 分离订单
        TbPrintOrder tbPrintOrder = getPrintfOrderInfo(printfOrderInfoDTO);
        // 订单详细信息
        List<TbPrintfInfo> printfInfoList = getPrintfInfoList(printfOrderInfoDTO.getPrintfInfos());

        // 检查订单详细信息是否有为空
        String printfInfoTips = checkPrintfInfo(printfInfoList);

        if (!printfInfoTips.isEmpty()) {
            map.put("msg", printfInfoTips);
            return prefix + "/input-printf";
        }
        // 计算价格
        tbPrintOrder.setTotalAmount(calculationTotalAmount(printfInfoList));

        boolean save = orderService.saveOrderInfoAndPrintfInfo(tbPrintOrder, printfInfoList);

        if (save) {
            map.put("msg", "添加打印录入成功， 总价格为：" + tbPrintOrder.getTotalAmount() + "元!");
        } else {
            map.put("msg", "添加打印录入失败，请重新录入！");
        }

        return prefix + "/input-printf";
    }

    // 计算总价格
    private BigDecimal calculationTotalAmount(List<TbPrintfInfo> printfInfoList) {
        BigDecimal totalAmount = BigDecimal.valueOf(0D);
        for (TbPrintfInfo info : printfInfoList) {
            // 打印双面，判断页数是都是奇数，奇数加 1， 变成 偶数
            if (info.getSingleDoubleSided().equals(DOUBLE)) {
                if (info.getPagesNumber() % 2 == 1) {
                    info.setPagesNumber(info.getPagesNumber() + 1);
                }
            }
            BigDecimal papers = BigDecimal.valueOf(Integer.toUnsignedLong(info.getPagesNumber() / info.getSingleDoubleSided()));
            BigDecimal totalPapers = papers.multiply(BigDecimal.valueOf(Integer.toUnsignedLong(info.getPrintfNumber())));
            BigDecimal printfMoney = totalPapers.multiply(info.getAmount());
            info.setPrintfMoney(printfMoney);
            totalAmount = totalAmount.add(printfMoney);
        }
        return totalAmount;
    }

    private String checkPrintfInfo(List<TbPrintfInfo> printfInfoList) {
        String tips = new String();
        for (TbPrintfInfo printfInfo : printfInfoList) {
            if (printfInfo.getPagesNumber() == null) {
                tips = "打印页数不能为空！";
            }
            if (printfInfo.getPrintfNumber() == null) {
                tips = "打印份数不能为空！";
            }
            if (printfInfo.getAmount() == null) {
                tips = "价格不能为空！";
            }
        }
        return tips;
    }

    // 订单详细信息
    private List<TbPrintfInfo> getPrintfInfoList(List<PrintfInfoDTO> printfInfoDTOs) {
        List<TbPrintfInfo> printfInfoList = new ArrayList<>();

        for (PrintfInfoDTO printfInfoDTO : printfInfoDTOs) {
            TbPrintfInfo printfInfo = new TbPrintfInfo();
            printfInfo.setSingleDoubleSided(printfInfoDTO.getSingleDoubleSided());
            printfInfo.setPagesNumber(printfInfoDTO.getPagesNumber());
            printfInfo.setPrintfNumber(printfInfoDTO.getPrintfNumber());
            printfInfo.setAmount(printfInfoDTO.getAmount());
            printfInfo.setFileName(printfInfoDTO.getFileName());
            printfInfoList.add(printfInfo);
        }

        return printfInfoList;
    }

    // 分离订单
    private TbPrintOrder getPrintfOrderInfo(PrintfOrderInfoDTO printfOrderInfoDTO) {
        TbPrintOrder tbPrintOrder = new TbPrintOrder();
        tbPrintOrder.setUserName(printfOrderInfoDTO.getUserName());
        tbPrintOrder.setUserPhone(printfOrderInfoDTO.getUserPhone());
        tbPrintOrder.setUserQq(printfOrderInfoDTO.getUserQq());
        tbPrintOrder.setUserWxchat(printfOrderInfoDTO.getUserWxchat());
        tbPrintOrder.setAddress(printfOrderInfoDTO.getAddress());
        tbPrintOrder.setNote(printfOrderInfoDTO.getNote());
        tbPrintOrder.setOrderStatus(OrderStatusEnum.UNDONE.getDesc());
        tbPrintOrder.setCreateTime(new Date());
        tbPrintOrder.setUpdateTime(new Date());
        return tbPrintOrder;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPrintingOrder(ModelMap map,
                                   @ModelAttribute @Valid PrintfOrderInfoDTO printfOrderInfoDTO) {
        if (printfOrderInfoDTO.getUserName().isEmpty()) {
            map.put("msg", "请输入姓名！");
            return prefix + "/order-input";
        }

        // 分离订单
        TbPrintOrder tbPrintOrder = getPrintfOrderInfo(printfOrderInfoDTO);
        // 订单详细信息
        List<TbPrintfInfo> printfInfoList = getPrintfInfoList(printfOrderInfoDTO.getPrintfInfos());

        // 检查订单详细信息是否有为空
        String printfInfoTips = checkPrintfInfo(printfInfoList);

        if (!printfInfoTips.isEmpty()) {
            map.put("msg", printfInfoTips);
            return prefix + "/order-input";
        }
        // 计算价格
        tbPrintOrder.setTotalAmount(calculationTotalAmount(printfInfoList));

        boolean save = orderService.saveOrderInfoAndPrintfInfo(tbPrintOrder, printfInfoList);

        if (save) {
            map.put("msg", "添加打印详细录入成功， 总价格为：" + tbPrintOrder.getTotalAmount() + "元!");
        } else {
            map.put("msg", "添加打印详细录入失败，请重新录入！");
        }

        return prefix + "/order-input";

    }


    @GetMapping("/list")
    public String printList() {
        return prefix + "/print-list";
    }

    @GetMapping("show/{id}")
    public String orderDetail(@PathVariable Long id, ModelMap map) {
        // 订单
        TbPrintOrder order = orderService.getById(id);
        // 份数详情
        List<TbPrintfInfo> printfInfoList = printfInfoService.queryPrintfInfos(order.getId());
        System.out.println("printfInfoList:" + printfInfoList);
        map.put("order", order);
        map.put("printfInfos", convertSingleAndDoubleSidedName(printfInfoList));
        return prefix + "/order-detail";
    }

    // 转换单双面名称
    private List<PrintfNumberInfoVO> convertSingleAndDoubleSidedName(List<TbPrintfInfo> printfInfoList) {
        List<PrintfNumberInfoVO> printfNumberInfoVOS = new ArrayList<>();
        // 1是单面。2是双面
        String[] str = {"单面", "双面"};
        for (TbPrintfInfo info : printfInfoList) {
            PrintfNumberInfoVO infoVO = new PrintfNumberInfoVO();
            infoVO.setAmount(info.getAmount());
            infoVO.setPrintfMoney(info.getPrintfMoney());
            infoVO.setPagesNumber(info.getPagesNumber());
            infoVO.setPrintfNumber(info.getPrintfNumber());
            infoVO.setSingleDoubleSided(str[info.getSingleDoubleSided() - 1]);
            infoVO.setFileName(info.getFileName());
            printfNumberInfoVOS.add(infoVO);
        }
        return printfNumberInfoVOS;
    }

    @PostMapping("confirm")
    public String confirmOrder(@RequestParam(required = true) Long id, ModelMap map) {

        TbPrintOrder tbPrintOrder = orderService.getById(id);
        if (tbPrintOrder.getOrderStatus().equals(OrderStatusEnum.COMPLETE.getDesc())) {
            map.put("msg", tbPrintOrder.getUserName() + "的订单已确认，无需再更改!");
            return prefix + "/print-list";
        }
        tbPrintOrder.setOrderStatus(OrderStatusEnum.COMPLETE.getDesc());
        boolean b = orderService.saveOrUpdate(tbPrintOrder);
        if (b) {
            if (tbPrintOrder.getUserName().isEmpty()) {
                map.put("msg", "序号" + tbPrintOrder.getId() + "用户的订单已完成");
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
        // 先删除打印详情
        QueryWrapper<TbPrintfInfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("order_id", id);
        boolean remove = printfInfoService.remove(queryWrapper);

        if (remove) {
            boolean b = orderService.removeById(id);
            if (b) {
                return Result.success("序号" + id + "的打印记录删除成功!");
            }
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

        // 对输入的值进行处理 orderStatus
        if (Objects.nonNull(tbPrintOrder)) {
            if (tbPrintOrder.getUserName() != null) {
                if (tbPrintOrder.getOrderStatus().equals("请选择"))
                    tbPrintOrder.setOrderStatus(null);
            }
        }

        // 封装 Datatables 需要的结果
        PageInfo<TbPrintOrder> pageInfo = orderService.page(start, length, draw, tbPrintOrder);

        return pageInfo;
    }


}

