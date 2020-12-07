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
    @Select("SELECT * FROM tb_print_order  ORDER BY  create_time DESC   LIMIT #{start}, #{length}")
    List<TbPrintOrder> page(Map<String, Object> params);

    /**
     * 查询总笔数
     *
     * @return
     */
    @Select("SELECT COUNT(*) FROM tb_print_order")
    int count(TbPrintOrder tbPrintOrder);

}
