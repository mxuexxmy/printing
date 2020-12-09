package xyz.mxue.printing.service.impl;

import cn.hutool.core.date.DateUtil;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.entity.TbOrderYear;
import xyz.mxue.printing.mapper.TbOrderYearMapper;
import xyz.mxue.printing.service.TbOrderYearService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 年记录 服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
@Service
public class TbOrderYearServiceImpl extends ServiceImpl<TbOrderYearMapper, TbOrderYear> implements TbOrderYearService {

    @Resource
    private TbOrderYearMapper yearMapper;

    @Override
    public PageInfo<TbOrderYear> page(int start, int length, int draw, TbOrderYear tbOrderYear) {
        int count = yearMapper.count(tbOrderYear);

        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);
        params.put("pageParams", tbOrderYear);

        PageInfo<TbOrderYear> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(yearMapper.page(params));

        return pageInfo;
    }

    @Override
    public String yearRecord(Date date) {
        Map<String, Object> params = new HashMap<>();
        // 这年开始时间
        Date startDate = DateUtil.beginOfYear(date);
        // 这年结束时间
        Date endDate = DateUtil.endOfYear(date);
        // 这年
        Date dayDate = DateUtil.beginOfYear(date);

        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("dayDate", dayDate);

        // 计算每月的份数
        Integer printNumber  = yearMapper.sumPrintNumber(params);
        // 计算每月的金额
        Double totalAmount = yearMapper.sumAmount(params);
        // 查询是否有记录
        TbOrderYear tbOrderYear = yearMapper.getOrderYear(params);

        if (printNumber == null) {
            printNumber = 0;
        }
        if (totalAmount == null) {
            totalAmount = 0D;
        }

        if (tbOrderYear != null) {
            tbOrderYear.setTotalAmount(totalAmount);
            tbOrderYear.setPrintNumber(printNumber);
            tbOrderYear.setUpdateTime(new Date());
            int i = yearMapper.updateById(tbOrderYear);
            if (i > 0) {
                return "年记录更新成功";
            }
            return "年记录更新失败";
        }
        TbOrderYear newTbOrderYear =  new TbOrderYear();
        newTbOrderYear.setPrintNumber(printNumber);
        newTbOrderYear.setTotalAmount(totalAmount);
        newTbOrderYear.setStatsYear(dayDate);
        newTbOrderYear.setCreateTime(new Date());
        newTbOrderYear.setUpdateTime(new Date());
        int insert = yearMapper.insert(newTbOrderYear);
        if (insert > 0) {
            return "年记录插入成功";
        }
        return "年记录插入失败";
    }

}
