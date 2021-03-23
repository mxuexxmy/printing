package xyz.mxue.printing.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.entity.TbAccountBook;
import xyz.mxue.printing.entity.TbCategories;
import xyz.mxue.printing.entity.dto.AccountUpdateDTO;
import xyz.mxue.printing.entity.dto.MoneyAndSpendTypeDTO;
import xyz.mxue.printing.entity.vo.AccountVO;
import xyz.mxue.printing.entity.dto.CategoriesNameDTO;
import xyz.mxue.printing.entity.vo.SpendType;
import xyz.mxue.printing.mapper.TbAccountBookMapper;
import xyz.mxue.printing.mapper.TbCategoriesMapper;
import xyz.mxue.printing.service.TbAccountBookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Service
public class TbAccountBookServiceImpl extends ServiceImpl<TbAccountBookMapper, TbAccountBook> implements TbAccountBookService {

    //  收入
    private final int INCOME = 1;

    // 支出
    private final int PAY_OUT = 0;

    @Resource
    private TbAccountBookMapper accountBookMapper;

    @Resource
    private TbCategoriesMapper categoriesMapper;

    @Override
    public PageInfo<AccountVO> page(int start, int length, int draw) {
        int count = accountBookMapper.count();

        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);

        PageInfo<AccountVO> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        List<AccountVO> pages = accountBookMapper.page(params);
        String[] categoriesName = {"支出", "收入"};
        for (AccountVO page : pages) {
             page.setSpendTypeName(categoriesName[page.getSpendType()]);
        }
        pageInfo.setData(pages);

        return pageInfo;
    }

    @Override
    public List<CategoriesNameDTO> categoriesNames() {
        return accountBookMapper.categoriesNames();
    }

    @Override
    public AccountUpdateDTO accountUpdate(Long id) {
        TbAccountBook tbAccountBook = accountBookMapper.selectById(id);
        AccountUpdateDTO accountUpdateDTO = new AccountUpdateDTO();
        accountUpdateDTO.setId(tbAccountBook.getId());
        accountUpdateDTO.setUpdateTime(tbAccountBook.getUpdateTime());
        accountUpdateDTO.setDescription(tbAccountBook.getDescription());
        accountUpdateDTO.setMoney(tbAccountBook.getMoney());
        accountUpdateDTO.setSpendTypes(spendTypeHanding(tbAccountBook.getSpendType()));
        accountUpdateDTO.setCategoriesName(categoriesNameHanding(tbAccountBook.getCategoriesId()));
        return accountUpdateDTO;
    }

    @Override
    public List<MoneyAndSpendTypeDTO> queryMoneyAndSpendType(Date startTime, Date endTime) {
        Map<String ,Object> params = new HashMap<>();
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        return accountBookMapper.queryMoneyAndSpendType(params);
    }

    @Override
    public BigDecimal getDayOfIncome(Date date) {
        Date startDay = DateUtil.beginOfDay(date);
        Date endDay = DateUtil.endOfDay(date);
        BigDecimal queryResult = accountBookMapper.getDayOfIncomeOrPayOut(INCOME, startDay, endDay);
        return queryResult != null ? queryResult : BigDecimal.valueOf(0D);
    }

    @Override
    public BigDecimal getDayOfPayOut(Date date) {
        Date startDay = DateUtil.beginOfDay(date);
        Date endDay = DateUtil.endOfDay(date);
        BigDecimal queryResult = accountBookMapper.getDayOfIncomeOrPayOut(PAY_OUT, startDay, endDay);
        return queryResult != null ? queryResult : BigDecimal.valueOf(0D);
    }

    /**
     * 关于类别处理
     * @param categoriesId 类别ID
     * @return 类别名列表
     */
    private List<CategoriesNameDTO> categoriesNameHanding(Long categoriesId) {
        List<CategoriesNameDTO> categoriesNameDTOS = new ArrayList<>();
        CategoriesNameDTO categoriesNameDTO = new CategoriesNameDTO();
        categoriesNameDTO.setCategoriesId(categoriesId);
        TbCategories categories = categoriesMapper.selectById(categoriesId);
        categoriesNameDTO.setCategoriesName(categories.getName());
        categoriesNameDTOS.add(categoriesNameDTO);
        List<CategoriesNameDTO> categoriesNameDTOS1 = accountBookMapper.categoriesNames();
        for (CategoriesNameDTO categoriesNameDTO1 : categoriesNameDTOS1) {
            if (!categoriesNameDTO.equals(categoriesNameDTO1)) {
                categoriesNameDTOS.add(categoriesNameDTO1);
            }
        }
        return categoriesNameDTOS;
    }

    /**
     * 关于消费类型的处理
     * @param spendType 消费类型ID
     * @return 消费类型列表
     */
    private List<SpendType> spendTypeHanding(Integer spendType) {
        String[] categoriesNames = {"支出", "收入"};
        List<SpendType> spendTypes = new ArrayList<>();
        SpendType spendTypeObject = new SpendType();
        spendTypeObject.setSpendType(spendType);
        spendTypeObject.setSpendTypeName(categoriesNames[spendType]);
        spendTypes.add(spendTypeObject);
        for (int i = 0; i < categoriesNames.length ; i++) {
            if (spendTypeObject.getSpendTypeName() != categoriesNames[i]) {
                SpendType spendTypeTemp = new SpendType();
                spendTypeTemp.setSpendType(i);
                spendTypeTemp.setSpendTypeName(categoriesNames[i]);
                spendTypes.add(spendTypeTemp);
            }
        }
        return spendTypes;
    }
}

