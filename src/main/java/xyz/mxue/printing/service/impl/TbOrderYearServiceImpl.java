package xyz.mxue.printing.service.impl;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbOrderYear;
import xyz.mxue.printing.mapper.TbOrderYearMapper;
import xyz.mxue.printing.service.TbOrderYearService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
}
