package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Select;
import xyz.mxue.printing.entity.TbPrintOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

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
            "</script>"})
    int count(Map<String, Object> params);

    @Select("SELECT SUM( prinf_number ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    Integer sumPrintNumber(Map<String, Object> params);

    @Select("SELECT SUM( total_amount ) FROM tb_print_order WHERE create_time BETWEEN #{startDate} AND #{endDate}")
    Double sumAmount(Map<String, Object> params);
}
