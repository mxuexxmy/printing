package xyz.mxue.printing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * <p>
 * 年记录
 * </p>
 *
 * @author mxuexxmy
 * @since 2020-12-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TbOrderYear implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 统计年
     */
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy")
    private Date statsYear;

    /**
     * 统计年打印的份数
     */
    private Integer printNumber;

    /**
     * 统计年费用
     */
    private Double totalAmount;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;


}