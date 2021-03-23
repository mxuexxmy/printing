package xyz.mxue.printing.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.transaction.annotation.Transactional;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbPrintOrder;
import xyz.mxue.printing.entity.TbPrintfInfo;
import xyz.mxue.printing.mapper.TbPrintOrderMapper;
import xyz.mxue.printing.service.TbPrintOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xyz.mxue.printing.service.TbPrintfInfoService;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.*;

/**
 * <p>
 * 打印订单 服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-06
 */
@Service
public class TbPrintOrderServiceImpl extends ServiceImpl<TbPrintOrderMapper, TbPrintOrder> implements TbPrintOrderService {

    @Resource
    private TbPrintOrderMapper orderMapper;

    @Resource
    private TbPrintfInfoService printfInfoService;

    /**
     * 分页查询
     *
     * @param start
     * @param length
     * @param draw
     * @param tbPrintOrder
     * @return
     */
    @Override
    public PageInfo<TbPrintOrder> page(int start, int length, int draw, TbPrintOrder tbPrintOrder) {

        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);
        params.put("pageParams", tbPrintOrder);

        int count = orderMapper.count(params);
        PageInfo<TbPrintOrder> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(orderMapper.page(params));

        return pageInfo;
    }

    @Override
    public Integer sumPrintNumber(Map<String, Object> params) {
        return orderMapper.sumPrintNumber(params);
    }

    @Override
    public BigDecimal sumAmount(Map<String, Object> params) {
        return orderMapper.sumAmount(params);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean saveOrderInfoAndPrintfInfo(TbPrintOrder tbPrintOrder, List<TbPrintfInfo> printfInfoList) {
        int insert = orderMapper.insert(tbPrintOrder);

        if (insert > 0) {
            // 添加 打印订单 id
            addPrintfOrderID(printfInfoList, tbPrintOrder.getId());
            boolean b = printfInfoService.saveBatch(printfInfoList);
            return b;
        }

        return false;
    }

    @Override
    public Integer getDayOfPrintfNumber(Date date) {
        Date startDay = DateUtil.beginOfDay(date);
        Date endDay = DateUtil.endOfDay(date);
        QueryWrapper<TbPrintOrder> queryWrapper = new QueryWrapper<>();
        queryWrapper.between(Objects.nonNull(date), "create_time", startDay, endDay);
        Integer queryResult = orderMapper.selectCount(queryWrapper);
        return queryResult != null ? queryResult : 0;
    }

    @Override
    public BigDecimal getDayOfPrintfIncome(Date date) {
        Date startDay = DateUtil.beginOfDay(date);
        Date endDay = DateUtil.endOfDay(date);
        BigDecimal queryResult = orderMapper.getDayOfPrintfIncome(startDay, endDay);
        return queryResult != null ? queryResult : BigDecimal.valueOf(0D);
    }

    private void addPrintfOrderID(List<TbPrintfInfo> printfInfoList, Long orderId) {
        for (TbPrintfInfo info : printfInfoList) {
            info.setOrderId(orderId);
        }
    }

}
