package xyz.mxue.printing.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.StringUtils;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.utils.PageUtils;
import xyz.mxue.printing.entity.TbCategories;
import xyz.mxue.printing.entity.dto.CategoriesDetailsDTO;
import xyz.mxue.printing.entity.vo.AccountVO;
import xyz.mxue.printing.mapper.TbCategoriesMapper;
import xyz.mxue.printing.service.TbCategoriesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

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
    public PageInfo<TbCategories> page(int start, int length, int draw, TbCategories tbCategories) {
        Page<TbCategories> categoriesPage = new Page<>(PageUtils.current(start, length), length);
        QueryWrapper<TbCategories> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(tbCategories.getName()), "name", tbCategories.getName())
                .like(StringUtils.isNotBlank(tbCategories.getFlagPermDate()), "date_format(update_time,'%Y-%m-%d')",
                        tbCategories.getFlagPermDate()).orderByDesc("update_time");

        Page<TbCategories> categoriesPage1 = categoriesMapper.selectPage(categoriesPage, queryWrapper);

        PageInfo<TbCategories> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(categoriesPage1.getTotal());
        pageInfo.setRecordsFiltered(categoriesPage1.getTotal());
        pageInfo.setData(categoriesPage1.getRecords());

        return pageInfo;
    }

    @Override
    public List<CategoriesDetailsDTO> queryMoneyAndCategoriesByTime(Date startTime, Date endTime) {
        Map<String, Object> params = new HashMap<>();
        params.put("startTime",startTime);
        params.put("endTime", endTime);
        return categoriesMapper.queryMoneyAndCategoriesByTime(params);
    }
}
