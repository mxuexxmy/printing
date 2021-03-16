package xyz.mxue.printing.service.impl;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbCategories;
import xyz.mxue.printing.entity.vo.AccountVO;
import xyz.mxue.printing.mapper.TbCategoriesMapper;
import xyz.mxue.printing.service.TbCategoriesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 账单分类类型 服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Service
public class TbCategoriesServiceImpl extends ServiceImpl<TbCategoriesMapper, TbCategories> implements TbCategoriesService {

    @Resource
    private TbCategoriesMapper categoriesMapper;

    @Override
    public PageInfo<TbCategories> page(int start, int length, int draw) {
        int count = categoriesMapper.selectCount(null);

        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);

        PageInfo<TbCategories> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(categoriesMapper.page(params));

        return pageInfo;
    }
}
