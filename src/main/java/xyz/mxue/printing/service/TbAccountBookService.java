package xyz.mxue.printing.service;

import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbAccountBook;
import com.baomidou.mybatisplus.extension.service.IService;
import xyz.mxue.printing.entity.dto.AccountUpdateDTO;
import xyz.mxue.printing.entity.dto.MoneyAndSpendTypeDTO;
import xyz.mxue.printing.entity.vo.AccountVO;
import xyz.mxue.printing.entity.dto.CategoriesNameDTO;

import java.math.BigDecimal;
import java.util.Date;
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

   PageInfo<AccountVO> page(int start, int length, int draw, TbAccountBook tbAccountBook);

   List<CategoriesNameDTO> categoriesNames();

    AccountUpdateDTO accountUpdate(Long id);

    List<MoneyAndSpendTypeDTO> queryMoneyAndSpendType(Date startTime, Date endTime);

    BigDecimal getDayOfIncome(Date startDate, Date endDate);

    BigDecimal getDayOfPayOut(Date startDate, Date endDate);
}
