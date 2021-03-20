package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbPrintOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;
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
}
