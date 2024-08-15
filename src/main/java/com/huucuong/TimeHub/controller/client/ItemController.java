package com.huucuong.TimeHub.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.huucuong.TimeHub.domain.*;
import com.huucuong.TimeHub.service.impl.ProductImageService;
import com.huucuong.TimeHub.service.impl.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;
    private final ProductImageService productImageService;

    public ItemController(
            ProductService productService,
            ProductImageService productImageService) {
        this.productService = productService;
        this.productImageService = productImageService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(
            Model model,
            @PathVariable("id") Long id) {
        List<ProductImage> productImages = this.productImageService.findByProductId(id);
        Product product = this.productService.findProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("productImages", productImages);
        return "client/product/detail";

    }
}
