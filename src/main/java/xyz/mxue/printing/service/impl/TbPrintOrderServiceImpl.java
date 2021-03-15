package xyz.mxue.printing.service.impl;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbPrintOrder;
import xyz.mxue.printing.mapper.TbPrintOrderMapper;
import xyz.mxue.printing.service.TbPrintOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

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
    public Double sumAmount(Map<String, Object> params) {
        return orderMapper.sumAmount(params);
    }

}
