package xyz.mxue.printing.entity.vo;

import lombok.Data;
import xyz.mxue.printing.entity.dto.CategoriesDetailsDTO;

import java.util.Date;
import java.util.List;

/**
 * @author mxuexxmy
 */
@Data
public class StatisticsDateVO {

    /**
     * 统计时间
     */
    private Date statisticsTime;

    /**
     * 时间展示
     */
    private String timeString;

    /**
     * 类别详情
     */
    private List<CategoriesDetailsDTO> categoriesDetails;

}
