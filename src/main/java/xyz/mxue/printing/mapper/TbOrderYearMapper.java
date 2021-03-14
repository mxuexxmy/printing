package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbOrderMonth;
import xyz.mxue.printing.entity.TbOrderYear;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.mxue.printing.entity.TbPrintOrder;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 年记录 Mapper 接口
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
public interface TbOrderYearMapper extends BaseMapper<TbOrderYear> {

    @Select("SELECT COUNT(*) FROM tb_order_year")
    int count(TbOrderYear tbOrderYear);

    @Select("SELECT * FROM tb_order_year ORDER BY stats_year DESC limit #{start}, #{length}")
    List<TbOrderYear> page(Map<String, Object> params);

    @Select("SELECT * FROM tb_order_year WHERE stats_year = #{dayDate}")
    TbOrderYear getOrderYear(Map<String, Object> params);
}
