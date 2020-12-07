package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbOrderDay;
import xyz.mxue.printing.entity.TbOrderMonth;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.mxue.printing.entity.TbPrintOrder;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 月记录 Mapper 接口
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
public interface TbOrderMonthMapper extends BaseMapper<TbOrderMonth> {

    @Select("SELECT COUNT(*) FROM tb_order_month")
    int count(TbOrderMonth tbOrderMonth);

    @Select("SELECT * FROM tb_order_month ORDER BY stats_month DESC limit #{start}, #{length}")
    List<TbOrderMonth> page(Map<String, Object> params);

    @Select("SELECT SUM( prinf_number ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    Integer sumPrintNumber(Map<String, Object> params);

    @Select("SELECT SUM( total_amount ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    Double sumAmount(Map<String, Object> params);

    @Select("SELECT * FROM tb_order_month WHERE stats_month = #{dayDate}")
    TbOrderMonth getOrderMonth(Map<String, Object> params);
}
