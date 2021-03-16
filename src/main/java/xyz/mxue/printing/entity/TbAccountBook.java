package xyz.mxue.printing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TbAccountBook implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 金额
     */
    private Double money;

    /**
     * 类别名id
     */
    private Long categoriesId;

    /**
     * 消费类型
     */
    private Integer spendType;

    /**
     * 描述
     */
    private String description;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;


}
