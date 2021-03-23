package xyz.mxue.printing.mapper;

import org.apache.ibatis.annotations.Param;
import xyz.mxue.printing.entity.TbPrintfInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 打印信息 Mapper 接口
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-23
 */
public interface TbPrintfInfoMapper extends BaseMapper<TbPrintfInfo> {

    List<TbPrintfInfo> queryPrintfInfos(@Param(value = "orderId") Long orderId);
}
