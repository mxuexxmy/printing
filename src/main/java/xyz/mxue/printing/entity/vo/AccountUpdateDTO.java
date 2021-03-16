package xyz.mxue.printing.entity.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author mxuexxmy
 * @date 3/16/2021$ 11:27 AM$
 */
@Data
public class AccountUpdateDTO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 金额
     */
    private Double money;

    /**
     * 类别列表
     */
    private List<CategoriesNameDTO> categoriesName;

    /**
     * 消费类型列表
     */
    private List<SpendType> spendTypes;

    /**
     * 描述-说明
     */
    private String description;

    /**
     * 更新时间
     */
    private Date updateTime;

}
