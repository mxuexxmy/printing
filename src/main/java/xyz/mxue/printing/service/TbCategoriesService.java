package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbCategories;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.vo.AccountVO;

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
}
