package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbCategories;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.dto.CategoriesDetailsDTO;
import xyz.mxue.printing.entity.vo.AccountVO;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 账单分类类型 服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
public interface TbCategoriesService extends IService<TbCategories> {

    PageInfo<TbCategories> page(int start, int length, int draw);

    List<CategoriesDetailsDTO> queryMoneyAndCategoriesByTime(Date startTime, Date endTime);
}
