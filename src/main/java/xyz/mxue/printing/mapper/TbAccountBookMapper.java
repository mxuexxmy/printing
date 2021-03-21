package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbAccountBook;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.mxue.printing.entity.dto.MoneyAndSpendTypeDTO;
import xyz.mxue.printing.entity.vo.AccountVO;
import xyz.mxue.printing.entity.dto.CategoriesNameDTO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
public interface TbAccountBookMapper extends BaseMapper<TbAccountBook> {

    @Select("SELECT a.id, a.money, b.`name`  categories_name , a.spend_type ,a.description, a.update_time  FROM tb_account_book a LEFT JOIN tb_categories b on a.categories_id = b.id  ORDER BY a.create_time DESC limit #{start},#{length}")
    List<AccountVO> page(Map<String, Object> params);

    @Select("SELECT COUNT(a.id)  FROM tb_account_book a LEFT JOIN tb_categories b on a.categories_id = b.id")
    int count();

    @Select("SELECT id categoriesId, name categoriesName FROM tb_categories")
    List<CategoriesNameDTO> categoriesNames();

    @Select("SELECT SUM(money) money, spend_type FROM tb_account_book WHERE\n" +
            "\tcreate_time BETWEEN #{startTime} \n" +
            "\tAND #{endTime} GROUP BY spend_type")
    List<MoneyAndSpendTypeDTO> queryMoneyAndSpendType(Map<String, Object> params);
}
