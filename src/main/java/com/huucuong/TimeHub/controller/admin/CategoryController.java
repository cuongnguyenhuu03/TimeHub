package com.huucuong.TimeHub.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.huucuong.TimeHub.domain.Category;
import com.huucuong.TimeHub.service.ICategoryService;
import com.huucuong.TimeHub.service.impl.CategoryService;

@Controller
public class CategoryController {

    private final ICategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @PostMapping("admin/category/create")
    public String postMethodName(
            @ModelAttribute Category category) {
        this.categoryService.save(category);
        return "admin/dashboard/show";
    }
}
