package xyz.mxue.printing.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    Integer sumPrintNumber( @Param(Constants.WRAPPER) QueryWrapper<TbPrintOrder> queryWrapper);


    BigDecimal getPrintfIncomeByDate(@Param(Constants.WRAPPER) QueryWrapper<TbPrintOrder> queryWrapper);

}
