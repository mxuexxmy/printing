package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.entity.TbOrderYear;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.TbPrintOrder;

import java.util.Date;

/**
 * <p>
 * 年记录 服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
public interface TbOrderYearService extends IService<TbOrderYear> {

    PageInfo<TbOrderYear> page(int start, int length, int draw, TbOrderYear tbOrderYear);

    String yearRecord(Date date);
}
