package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbAccountBook;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.vo.AccountUpdateDTO;
import xyz.mxue.printing.entity.vo.AccountVO;
import xyz.mxue.printing.entity.vo.CategoriesNameDTO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
public interface TbAccountBookService extends IService<TbAccountBook> {

   PageInfo<AccountVO> page(int start, int length, int draw);

   List<CategoriesNameDTO> categoriesNames();

    AccountUpdateDTO accountUpdate(Long id);
}
