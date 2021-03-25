package xyz.mxue.printing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbAccountBook;
import xyz.mxue.printing.entity.vo.AccountVO;
import xyz.mxue.printing.service.TbAccountBookService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.Objects;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Controller
@RequestMapping("/printing/tb-account-book")
public class TbAccountBookController {

    private String prefix = "book-keeping";

    @Resource
    private TbAccountBookService accountBookService;

    @GetMapping()
    public String index(ModelMap map) {
        map.put("categories", accountBookService.categoriesNames());
        return prefix + "/account";
    }

    @GetMapping("add-account")
    public String addAccount(ModelMap map) {
        map.put("categories", accountBookService.categoriesNames());
        return prefix + "/add-account";
    }

    @PostMapping("save-account")
    @ResponseBody
    public Result saveAccount(@RequestBody TbAccountBook tbAccountBook) {
       tbAccountBook.setCreateTime(new Date());
       tbAccountBook.setUpdateTime(new Date());
       boolean save = accountBookService.save(tbAccountBook);
       return save == true ? Result.success("添加账单成功!") : Result.fail("添加账单失败，请重试！");
    }

    @GetMapping("update/{id}")
    public String update(@PathVariable Long id, ModelMap map) {
        map.put("accountUpdateDTO", accountBookService.accountUpdate(id));
        return prefix + "/update-account";
    }

    @PostMapping("save-update")
    @ResponseBody
    public Result saveUpdate(@RequestBody TbAccountBook tbAccountBook) {
        tbAccountBook.setUpdateTime(new Date());
        boolean b = accountBookService.saveOrUpdate(tbAccountBook);
        return b == true ? Result.success("修改账单消息成功！") : Result.fail("修改账单消息失败！");
    }

    @GetMapping("delete/{id}")
    @ResponseBody
    public Result deleteOrder(@PathVariable Long id, ModelMap map) {
        boolean b = accountBookService.removeById(id);
        if (b) {
            return Result.success("序号" + id + "的账单删除成功!");
        }
        return Result.fail("序号" + id + "的账单删除失败!");
    }

    @GetMapping("page")
    @ResponseBody
    public PageInfo<AccountVO> page(HttpServletRequest request, TbAccountBook tbAccountBook) {
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        // 对输入的值进行处理 spendType
        Integer checkSpendType = 2;
        if (Objects.nonNull(tbAccountBook)) {
            if (tbAccountBook.getSpendType() != null) {
                if (tbAccountBook.getSpendType().equals(checkSpendType)) {
                    tbAccountBook.setSpendType(null);
                }
            }
        }

        // 封装 Datatables 需要的结果
        PageInfo<AccountVO> pageInfo = accountBookService.page(start, length, draw, tbAccountBook);
        return pageInfo;
    }

}

