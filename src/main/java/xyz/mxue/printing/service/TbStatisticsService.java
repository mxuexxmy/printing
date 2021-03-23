package xyz.mxue.printing.service;

import xyz.mxue.printing.entity.TbStatistics;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 统计盈亏 服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
public interface TbStatisticsService extends IService<TbStatistics> {

    /**
     * 获取指定天的收入
     * @param date 日期
     * @return BigDecimal
     */
    BigDecimal getDayOfIncome(Date startDate, Date endDate);

    /**
     * 获取指定他的支出
     * @param date
     * @return BigDecimal
     */
    BigDecimal getDayOfPayOut(Date startDate, Date endDate);
}
