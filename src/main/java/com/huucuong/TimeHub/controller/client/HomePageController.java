package com.huucuong.TimeHub.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.service.IProductService;

@Controller
public class HomePageController {

    public final IProductService productService;

    public HomePageController(IProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.findAll();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "auth/login";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        return "auth/register";
    }

    @GetMapping("/cart")
    public String getRegisterPage() {
        return "client/cart/show";
    }

}
