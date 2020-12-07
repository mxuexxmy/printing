package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbOrderDay;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.mxue.printing.entity.TbPrintOrder;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 日记录 Mapper 接口
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
public interface TbOrderDayMapper extends BaseMapper<TbOrderDay> {

    @Select("SELECT COUNT(*) FROM tb_order_day")
    int count(TbOrderDay tbOrderDay);

    @Select("SELECT * FROM tb_order_day ORDER BY stats_day DESC limit #{start}, #{length}")
    List<TbOrderDay> page(Map<String, Object> params);

    @Select("SELECT SUM( prinf_number ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    Integer sumPrintNumber(Map<String, Object> params);

    @Select("SELECT SUM( total_amount ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    Double sumAmount(Map<String, Object> params);

    @Select("SELECT * FROM tb_order_day WHERE stats_day = #{dayDate}")
    TbOrderDay getOrderDay(Map<String, Object> params);
}
