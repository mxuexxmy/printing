package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbCategories;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.mxue.printing.entity.dto.CategoriesDetailsDTO;
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

    @Select("SELECT\n" +
            "\tc.`name` categoriesName,\n" +
            "\tSUM( b.money ) money,\n" +
            "\tspend_type \n" +
            "FROM\n" +
            "\t( SELECT a.money, a.categories_id, a.spend_type FROM tb_account_book a WHERE a.create_time BETWEEN #{startTime} AND #{endTime} ) b\n" +
            "\tLEFT JOIN tb_categories c ON b.categories_id = c.id \n" +
            "GROUP BY\n" +
            "\tb.categories_id")
    List<CategoriesDetailsDTO> queryMoneyAndCategoriesByTime(Map<String, Object> params);
}
