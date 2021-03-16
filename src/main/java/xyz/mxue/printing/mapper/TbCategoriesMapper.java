package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbCategories;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.mxue.printing.entity.vo.AccountVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 账单分类类型 Mapper 接口
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
public interface TbCategoriesMapper extends BaseMapper<TbCategories> {

    @Select("SELECT * FROM tb_categories ORDER BY create_time DESC LIMIT #{start}, #{length}")
    List<TbCategories> page(Map<String, Object> params);
}
