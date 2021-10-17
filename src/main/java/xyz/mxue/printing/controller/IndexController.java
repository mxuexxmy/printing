package xyz.mxue.printing.controller;

import cn.hutool.core.date.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.mxue.printing.entity.vo.IndexInfoVO;
import xyz.mxue.printing.service.TbPrintOrderService;
import xyz.mxue.printing.service.TbStatisticsService;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author mxuexxmy
 * @date 12/6/2020$ 8:55 PM$
 */
@Controller
@RequestMapping
public class IndexController {

    @Resource
    private TbPrintOrderService orderService;

    @Resource
    private TbStatisticsService statisticsService;

    private String prefix = "printf";

    @GetMapping()
    public String index() {
        return "login";
    }

    @GetMapping("login")
    public String login() {
        return "login";
    }

    @GetMapping("about")
    public String about() {
        return "about";
    }

    @GetMapping("/index")
    public String indexView(ModelMap map) {
        IndexInfoVO indexInfoVO = new IndexInfoVO();
        Date nowDate = new Date();
        Date startDate = DateUtil.beginOfDay(nowDate);
        Date endDate = DateUtil.endOfDay(nowDate);
        // 今日打印单数
        indexInfoVO.setDayPrintfNumber(orderService.getDayOfPrintfNumber(startDate, endDate));
        // 今日打印收入
        indexInfoVO.setDayPrintfIncome(orderService.getPrintfIncomeByDate(startDate, endDate));
        // 今日收入
        BigDecimal dayIncome = statisticsService.getDayOfIncome(startDate, endDate);
        indexInfoVO.setDayIncome(dayIncome.add(indexInfoVO.getDayPrintfIncome()));
        // 今日支出
         indexInfoVO.setDayPayOut(statisticsService.getDayOfPayOut(startDate, endDate));

        map.put("indexInfo", indexInfoVO);

        return "index";
    }

    @GetMapping("/input-printf")
    public String inputPrintf() {
        return prefix + "/input-printf";
    }

    @GetMapping("/order-input")
    public String orderInput() {
        return prefix + "/order-input";
    }
}
