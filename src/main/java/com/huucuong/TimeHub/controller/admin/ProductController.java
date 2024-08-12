package com.huucuong.TimeHub.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.huucuong.TimeHub.domain.Product;

@Controller
public class ProductController {

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {

        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct() {
        return "admin/product/show";
    }
}
