package xyz.mxue.printing.service.impl;

import cn.hutool.core.date.DateUtil;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderDay;
import xyz.mxue.printing.mapper.TbOrderDayMapper;
import xyz.mxue.printing.service.TbOrderDayService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xyz.mxue.printing.service.TbPrintOrderService;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 日记录 服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
@Service
public class TbOrderDayServiceImpl extends ServiceImpl<TbOrderDayMapper, TbOrderDay> implements TbOrderDayService {

    @Resource
    private TbOrderDayMapper dayMapper;

    @Resource
    private TbPrintOrderService orderService;

    @Override
    public PageInfo<TbOrderDay> page(int start, int length, int draw, TbOrderDay tbOrderDay) {
        int count = dayMapper.count(tbOrderDay);

        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);
        params.put("pageParams", tbOrderDay);

        PageInfo<TbOrderDay> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(dayMapper.page(params));

        return pageInfo;
    }

    @Override
    public String dayRecord(Date date)  {
        Map<String, Object> params = new HashMap<>();
        // 今日开始时间
        Date startDate = DateUtil.beginOfDay(date);
        // 今日结束时间
        Date endDate = DateUtil.endOfDay(date);

        Date dayDate = DateUtil.beginOfDay(date);

        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("dayDate", dayDate);

        // 计算每一日的份数
        Integer printNumber  = orderService.sumPrintNumber(params);
        // 计算每一次的金额
        BigDecimal totalAmount = orderService.sumAmount(params);
        // 查询是否有记录
        TbOrderDay tbOrderDay = dayMapper.getOrderDay(params);

        if (printNumber == null) {
            printNumber = 0;
        }
        if (totalAmount == null) {
            totalAmount = BigDecimal.valueOf(0D);
        }

        if (tbOrderDay != null) {
            tbOrderDay.setTotalAmount(totalAmount);
            tbOrderDay.setPrintfNumber(printNumber);
            tbOrderDay.setUpdateTime(new Date());
            int i = dayMapper.updateById(tbOrderDay);
            if (i > 0) {
                return "日记录更新成功";
            }
            return "日记录更新失败";
        }
        TbOrderDay newOrderDay =  new TbOrderDay();
        newOrderDay.setPrintfNumber(printNumber);
        newOrderDay.setTotalAmount(totalAmount);
        newOrderDay.setStatsDay(dayDate);
        newOrderDay.setCreateTime(new Date());
        newOrderDay.setUpdateTime(new Date());
        int insert = dayMapper.insert(newOrderDay);
        if (insert > 0) {
            return "日记录插入成功";
        }
        return "日记录插入失败";
    }
}
