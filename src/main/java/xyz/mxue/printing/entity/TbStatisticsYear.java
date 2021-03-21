package xyz.mxue.printing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 统计盈亏每年
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TbStatisticsYear implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 统计时间
     */
    private Date statisticsTime;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;


}
