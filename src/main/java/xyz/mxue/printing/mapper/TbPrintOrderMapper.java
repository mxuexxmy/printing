package xyz.mxue.printing.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbPrintOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 打印订单 Mapper 接口
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-06
 */
public interface TbPrintOrderMapper extends BaseMapper<TbPrintOrder> {
    /**
     * 分页查询
     *
     * @param params，需要两个参数，start/记录开始的位置 length/每页记录数
     * @return
     */
    @Select({"<script>" +
            "select * from tb_print_order" +
            "<if test='pageParams.userName != null'>where user_name like concat('%',#{pageParams.userName},'%') </if>" +
            "<if test='pageParams.userName != null and pageParams.orderStatus != null'>and</if>" +
            "<if test='pageParams.userName == null and pageParams.orderStatus != null'>where</if>" +
            "<if test='pageParams.orderStatus != null'> order_status = #{pageParams.orderStatus} </if>" +
            "ORDER BY create_time DESC limit #{start},#{length}" +
            "</script>"})
    List<TbPrintOrder> page(Map<String, Object> params);

    /**
     * 查询总笔数
     *
     * @return
     */
    @Select({"<script>" +
            "select count(*) from tb_print_order" +
            "<if test='pageParams.userName != null'>where user_name like concat('%',#{pageParams.userName},'%') </if>" +
            "<if test='pageParams.userName != null and pageParams.orderStatus != null'>and</if>" +
            "<if test='pageParams.userName == null and pageParams.orderStatus != null'>where</if>" +
            "<if test='pageParams.orderStatus != null'> order_status = #{pageParams.orderStatus} </if>"  +
            "</script>"})
    int count(Map<String, Object> params);

    @Select("SELECT SUM( printf_number ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    Integer sumPrintNumber(Map<String, Object> params);

    @Select("SELECT SUM( total_amount ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    BigDecimal sumAmount(Map<String, Object> params);

    @Select(" SELECT\n" +
            "            sum( total_amount ) total_amount\n" +
            "        FROM\n" +
            "            tb_print_order\n" +
            "        WHERE\n" +
            "            create_time BETWEEN #{startDate}\n" +
            "                AND #{endDate}")
    BigDecimal getDayOfPrintfIncome(@Param(value = "startDate") Date startDate,@Param(value = "endDate") Date endDate);
}
