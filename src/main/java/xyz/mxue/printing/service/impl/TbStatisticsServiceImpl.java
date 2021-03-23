package xyz.mxue.printing.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import xyz.mxue.printing.entity.TbAccountBook;
import xyz.mxue.printing.entity.TbStatistics;
import xyz.mxue.printing.mapper.TbStatisticsMapper;
import xyz.mxue.printing.service.TbAccountBookService;
import xyz.mxue.printing.service.TbStatisticsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

/**
 * <p>
 * 统计盈亏 服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Service
public class TbStatisticsServiceImpl extends ServiceImpl<TbStatisticsMapper, TbStatistics> implements TbStatisticsService {

    @Resource
    private TbAccountBookService accountBookService;

    @Override
    public BigDecimal getDayOfIncome(Date startDate, Date endDate) {
        return accountBookService.getDayOfIncome(startDate, endDate);
    }

    @Override
    public BigDecimal getDayOfPayOut(Date startDate, Date endDate) {
        return accountBookService.getDayOfPayOut(startDate,  endDate);
    }
}
