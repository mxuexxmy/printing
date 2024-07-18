package xyz.mxue.printing;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.DigestUtils;
import xyz.mxue.printing.entity.TbPrintOrder;
import xyz.mxue.printing.service.TbPrintOrderService;
import xyz.mxue.printing.service.TbStatisticsDetailsService;

import javax.annotation.Resource;
import java.util.Date;

@SpringBootTest
class PrintingApplicationTests {

    @Resource
    private TbPrintOrderService orderService;

    @Resource
    private TbStatisticsDetailsService statisticsDetailsService;
//
//    @Test
//    void contextLoads() {
//        System.out.println(DigestUtils.md5DigestAsHex("123456".getBytes()));
//    }
//
//    @Test
//    void testGetDayOfPrintfIncome() {
//        System.out.println(orderService.page(4, 5, 1, new TbPrintOrder()));
//    }





}
