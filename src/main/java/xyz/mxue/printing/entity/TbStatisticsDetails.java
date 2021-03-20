package xyz.mxue.printing.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 类别消费统计
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TbStatisticsDetails implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 统计ID
     */
    private Long statisticsId;

    /**
     * 类别ID
     */
    private Long categoriesId;

    /**
     * 金额
     */
    private BigDecimal money;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;


}
