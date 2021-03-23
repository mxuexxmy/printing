package xyz.mxue.printing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.mxue.printing.entity.vo.IndexInfoVO;
import xyz.mxue.printing.service.TbPrintOrderService;
import xyz.mxue.printing.service.TbStatisticsService;

import javax.annotation.Resource;
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
        // 今日打印单数
        indexInfoVO.setDayPrintfNumber(orderService.getDayOfPrintfNumber(new Date()));
        // 今日打印收入
        indexInfoVO.setDayPrintfIncome(orderService.getDayOfPrintfIncome(new Date()));
        // 今日收入
        indexInfoVO.setDayIncome(statisticsService.getDayOfIncome(new Date()).add(indexInfoVO.getDayPrintfIncome()));
        // 今日支出
         indexInfoVO.setDayPayOut(statisticsService.getDayOfPayOut(new Date()));

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
