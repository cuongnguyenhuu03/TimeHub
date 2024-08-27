package com.huucuong.TimeHub.controller.client;

import java.util.List;

import org.hibernate.mapping.Map;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.huucuong.TimeHub.domain.*;
import com.huucuong.TimeHub.service.impl.CategoryService;
import com.huucuong.TimeHub.service.impl.ProductImageService;
import com.huucuong.TimeHub.service.impl.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {

    private final ProductService productService;
    private final ProductImageService productImageService;
    private final CategoryService categoryService;

    public ItemController(
            CategoryService categoryService,
            ProductService productService,
            ProductImageService productImageService) {
        this.productService = productService;
        this.productImageService = productImageService;
        this.categoryService = categoryService;
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

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(HttpServletRequest request, @PathVariable("id") Long id) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session);
        return "redirect:/";
    }

    @GetMapping("/products")
    public String getProductPage(
            Model model,
            @RequestParam(defaultValue = "1", name = "page") int page) {

        Pageable pageable = PageRequest.of(page - 1, 6);

        Page<Product> pageProducts = this.productService.findAll(pageable);
        List<Product> listProducts = pageProducts.getContent();
        List<Category> categories = this.categoryService.findAll();
        model.addAttribute("products", listProducts);
        model.addAttribute("categories", categories);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageProducts.getTotalPages());
        return "client/homepage/products";
    }
}
