package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderDay;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.TbPrintOrder;

import java.text.ParseException;
import java.util.Date;

/**
 * <p>
 * 日记录 服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
public interface TbOrderDayService extends IService<TbOrderDay> {

    PageInfo<TbOrderDay> page(int start, int length, int draw, TbOrderDay tbOrderDay);

    String dayRecord(Date date) throws ParseException;
}
