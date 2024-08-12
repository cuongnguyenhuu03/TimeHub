package com.huucuong.TimeHub.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.huucuong.TimeHub.domain.Product;

@Controller
public class ItemController {

    @GetMapping("/product")
    public String getProductPage() {
        return "client/product/detail";
    }
}
