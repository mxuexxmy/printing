package xyz.mxue.printing.service.impl;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.util.DateUtil;
import xyz.mxue.printing.entity.TbOrderDay;
import xyz.mxue.printing.mapper.TbOrderDayMapper;
import xyz.mxue.printing.service.TbOrderDayService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
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
    public String dayRecord(Date date) throws ParseException {
        Map<String, Object> params = new HashMap<>();
        DateUtil dateUtil = new DateUtil();
        // 今日开始时间
        Date startDate = dateUtil.getStartOfDay(date);
        // 今日结束时间
        Date endDate = dateUtil.getEndOfDay(date);

        Date dayDate = dateUtil.getDay(date);

        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("dayDate", dayDate);

        // 计算每一日的份数
        Integer printNumber  = dayMapper.sumPrintNumber(params);
        // 计算每一次的金额
        Double totalAmount = dayMapper.sumAmount(params);
        // 查询是否有记录
        TbOrderDay tbOrderDay = dayMapper.getOrderDay(params);

        if (tbOrderDay != null) {
            tbOrderDay.setTotalAmount(totalAmount);
            tbOrderDay.setPrintNumber(printNumber);
            tbOrderDay.setUpdateTime(date);
            int i = dayMapper.updateById(tbOrderDay);
            if (i > 0) {
                return "日记录更新成功";
            }
            return "日记录更新失败";
        }
        TbOrderDay newOrderDay =  new TbOrderDay();
        newOrderDay.setPrintNumber(printNumber);
        newOrderDay.setTotalAmount(totalAmount);
        newOrderDay.setStatsDay(dayDate);
        newOrderDay.setCreateTime(date);
        newOrderDay.setUpdateTime(date);
        int insert = dayMapper.insert(newOrderDay);
        if (insert > 0) {
            return "日记录插入成功";
        }
        return "日记录插入失败";
    }
}
