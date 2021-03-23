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
    public String saveCategories(ModelMap map, @ModelAttribute @Valid TbCategories tbCategories) {

        if (tbCategories.getName().isEmpty()) {
            map.put("msg", "类别不能为空！");
            return prefix + "/add-categories";
        }

        // 查询是否存在相同的类别
        QueryWrapper<TbCategories> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", tbCategories.getName());
        TbCategories tbCategories1 = categoriesService.getOne(queryWrapper);
        // 如果不为空，返回
        if (Objects.nonNull(tbCategories1)) {
            map.put("msg", "存在相同的类别，请检查！");
            return prefix + "/add-categories";
        }


        tbCategories.setCreateTime(new Date());
        tbCategories.setUpdateTime(new Date());
        boolean save = categoriesService.save(tbCategories);
        if (save) {
            map.put("msg", "添加类别成功！");
        } else {
            map.put("msg", "添加类别失败！");
        }
        return prefix + "/categories";
    }

    @GetMapping("update/{id}")
    public String update(@PathVariable Long id, ModelMap map) {
        map.put("categories", categoriesService.getById(id));
        return prefix + "/update-categories";
    }

    @PostMapping("saveUpdate")
    public String saveUpdate(ModelMap map, @ModelAttribute @Valid TbCategories tbCategories) {
        tbCategories.setUpdateTime(new Date());

        boolean b = categoriesService.saveOrUpdate(tbCategories);
        if (b) {
            map.put("msg","修改类别成功！");
        } else {
            map.put("msg", "修改类别失败，请重修修改！");
        }

        return b == true ? prefix + "/categories" : prefix + "/update-categories";
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
    public PageInfo<TbCategories> page(HttpServletRequest request) {
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        // 封装 Datatables 需要的结果
        PageInfo<TbCategories> pageInfo = categoriesService.page(start, length, draw);
        return pageInfo;
    }

}

