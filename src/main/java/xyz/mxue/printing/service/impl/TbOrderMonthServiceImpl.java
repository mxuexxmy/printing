package xyz.mxue.printing.service.impl;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.mapper.TbOrderMonthMapper;
import xyz.mxue.printing.service.TbOrderMonthService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
}
