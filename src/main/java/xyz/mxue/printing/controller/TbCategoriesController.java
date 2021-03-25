package xyz.mxue.printing.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import xyz.mxue.printing.commons.model.PageInfo;
import xyz.mxue.printing.commons.model.Result;
import xyz.mxue.printing.entity.TbAccountBook;
import xyz.mxue.printing.entity.TbCategories;
import xyz.mxue.printing.service.TbAccountBookService;
import xyz.mxue.printing.service.TbCategoriesService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.Objects;


/**
 * <p>
 * 账单分类类型 前端控制器
 * </p>
 *
 * @author mxuexxmy
 * @since 2021-03-14
 */
@Controller
@RequestMapping("/printing/tb-categories")
public class TbCategoriesController {

    private String prefix = "book-keeping";

    @Resource
    private TbCategoriesService categoriesService;

    @Resource
    private TbAccountBookService accountBookService;

    @GetMapping
    public String index() {
        return prefix + "/categories";
    }

    @GetMapping("/add")
    public String addCategories() {
        return prefix + "/add-categories";
    }

    @PostMapping("save")
    @ResponseBody
    public Result saveCategories(@RequestBody TbCategories tbCategories) {

        if (tbCategories.getName().isEmpty()) {
            return Result.fail("类别不能为空！");
        }

        // 查询是否存在相同的类别
        QueryWrapper<TbCategories> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", tbCategories.getName());
        TbCategories tbCategories1 = categoriesService.getOne(queryWrapper);
        // 如果不为空，返回
        if (Objects.nonNull(tbCategories1)) {
            return Result.fail("存在相同的类别，请检查！");
        }

        tbCategories.setCreateTime(new Date());
        tbCategories.setUpdateTime(new Date());
        boolean save = categoriesService.save(tbCategories);
        return save == true ? Result.success("添加类别成功！") : Result.fail("添加类别失败！");
    }

    @GetMapping("update/{id}")
    public String update(@PathVariable Long id, ModelMap map) {
        map.put("categories", categoriesService.getById(id));
        return prefix + "/update-categories";
    }

    @PostMapping("saveUpdate")
    @ResponseBody
    public Result saveUpdate(@RequestBody TbCategories tbCategories) {
        tbCategories.setUpdateTime(new Date());
        boolean b = categoriesService.saveOrUpdate(tbCategories);
        return b == true ? Result.success("修改类别成功！") : Result.fail("修改类别失败，请重修修改！");
    }

    @GetMapping("delete/{id}")
    @ResponseBody
    public Result deleteOrder(@PathVariable Long id, ModelMap map) {
        QueryWrapper<TbAccountBook> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("categories_id", id);
        int count = accountBookService.count(queryWrapper);
        if (count > 0) {
            return Result.fail("序号为" + id + "的类别不能删除," + "如需删除，请删除所有相关的账单记录！");
        }
        boolean b = categoriesService.removeById(id);
        if (b) {
            return Result.success("序号" + id + "的类别删除成功!");
        }
        return Result.fail("序号" + id + "的类别删除失败!");
    }

    @GetMapping("page")
    @ResponseBody
    public PageInfo<TbCategories> page(@RequestParam(value = "draw", required = false, defaultValue = "0") Integer draw,
                                       @RequestParam(value = "start", required = false, defaultValue = "0")Integer start,
                                       @RequestParam(value = "length", required = false, defaultValue = "10") Integer length,
                                       TbCategories tbCategories) {

        // 封装 Datatables 需要的结果
        PageInfo<TbCategories> pageInfo = categoriesService.page(start, length, draw, tbCategories);
        return pageInfo;
    }

}

