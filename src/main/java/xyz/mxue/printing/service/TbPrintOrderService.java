package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbPrintOrder;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.TbPrintfInfo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 打印订单 服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-06
 */
public interface TbPrintOrderService extends IService<TbPrintOrder> {

    PageInfo<TbPrintOrder> page(int start, int length, int draw, TbPrintOrder tbPrintOrder);

    /**
     * 统计份数
     * @param params 查询参数
     * @return Integer
     */
    Integer sumPrintNumber(Map<String, Object> params);

    /**
     * 统计金额
     * @param params 查询参数
     * @return Double
     */
    BigDecimal sumAmount(Map<String, Object> params);

    /**
     * 保持打印订单信息和订单信息
     * @param tbPrintOrder 订单信息
     * @param printfInfoList 打印信息
     * @return boolean
     */
    boolean saveOrderInfoAndPrintfInfo(TbPrintOrder tbPrintOrder, List<TbPrintfInfo> printfInfoList);

    /**
     * 指定天的打印单数
     * @param date 日期
     * @return 打印单数
     */
    Integer getDayOfPrintfNumber(Date date);

    /**
     * 指定天的打印收入
     * @param date 日期
     * @return 打印收入
     */
    BigDecimal getDayOfPrintfIncome(Date date);
}
