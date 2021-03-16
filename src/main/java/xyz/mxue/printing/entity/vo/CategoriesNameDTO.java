package xyz.mxue.printing.entity.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author mxuexxmy
 * @date 3/15/2021$ 11:53 PM$
 */
@Data
public class CategoriesNameDTO implements Serializable {

    private Long categoriesId;

    private String categoriesName;
}
