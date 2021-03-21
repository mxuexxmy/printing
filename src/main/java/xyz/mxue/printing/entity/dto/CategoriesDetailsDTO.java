package xyz.mxue.printing.entity.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author mxuexxmy
 */
@Data
public class CategoriesDetailsDTO {

    /**
     * 类别名
     */
    private String categoriesName;

    /**
     * 金额
     */
    private BigDecimal money;

    /**
     * 消费类型
     */
    private Integer spendType;

}
