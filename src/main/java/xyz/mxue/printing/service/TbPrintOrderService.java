package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbPrintOrder;
import com.baomidou.mybatisplus.extension.service.IService;

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
}
