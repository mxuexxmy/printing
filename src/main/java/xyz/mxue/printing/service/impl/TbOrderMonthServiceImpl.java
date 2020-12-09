package xyz.mxue.printing.service.impl;

import cn.hutool.core.date.DateUtil;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.mapper.TbOrderMonthMapper;
import xyz.mxue.printing.service.TbOrderMonthService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 月记录 服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
@Service
public class TbOrderMonthServiceImpl extends ServiceImpl<TbOrderMonthMapper, TbOrderMonth> implements TbOrderMonthService {

    @Resource
    private TbOrderMonthMapper monthMapper;

    @Override
    public PageInfo<TbOrderMonth> page(int start, int length, int draw, TbOrderMonth tbOrderMonth) {
        int count = monthMapper.count(tbOrderMonth);

        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);
        params.put("pageParams", tbOrderMonth);

        PageInfo<TbOrderMonth> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(monthMapper.page(params));

        return pageInfo;
    }

    @Override
    public String monthRecord(Date date) {
        Map<String, Object> params = new HashMap<>();
        // 这个月开始时间
        Date startDate = DateUtil.beginOfMonth(date);
        // 这个月结束时间
        Date endDate = DateUtil.endOfMonth(date);
        // 这个月
        Date dayDate = DateUtil.beginOfMonth(date);

        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("dayDate", dayDate);

        // 计算每月的份数
        Integer printNumber  = monthMapper.sumPrintNumber(params);
        // 计算每月的金额
        Double totalAmount = monthMapper.sumAmount(params);
        // 查询是否有记录
        TbOrderMonth tbOrderMonth = monthMapper.getOrderMonth(params);

        if (printNumber == null) {
            printNumber = 0;
        }
        if (totalAmount == null) {
            totalAmount = 0D;
        }

        if (tbOrderMonth != null) {
            tbOrderMonth.setTotalAmount(totalAmount);
            tbOrderMonth.setPrintNumber(printNumber);
            tbOrderMonth.setUpdateTime(new Date());
            int i = monthMapper.updateById(tbOrderMonth);
            if (i > 0) {
                return "月记录更新成功";
            }
            return "月记录更新失败";
        }
        TbOrderMonth newOrderMonth =  new TbOrderMonth();
        newOrderMonth.setPrintNumber(printNumber);
        newOrderMonth.setTotalAmount(totalAmount);
        newOrderMonth.setStatsMonth(dayDate);
        newOrderMonth.setCreateTime(new Date());
        newOrderMonth.setUpdateTime(new Date());
        int insert = monthMapper.insert(newOrderMonth);
        if (insert > 0) {
            return "月记录插入成功";
        }
        return "月记录插入失败";
    }
}
