package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderDay;
import xyz.mxue.printing.entity.TbOrderMonth;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.TbPrintOrder;

import java.util.Date;

/**
 * <p>
 * 月记录 服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
public interface TbOrderMonthService extends IService<TbOrderMonth> {

    PageInfo<TbOrderMonth> page(int start, int length, int draw, TbOrderMonth tbOrderMonth);

    String monthRecord(Date date);
}
