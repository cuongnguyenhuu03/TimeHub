package com.huucuong.TimeHub.controller.client;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.huucuong.TimeHub.domain.*;
import com.huucuong.TimeHub.domain.dto.ProductCriteriaDTO;
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
            HttpServletRequest request,
            Model model,
            ProductCriteriaDTO productCriteriaDTO,
            @RequestParam(defaultValue = "1", name = "page") int page) {

        Pageable pageable = PageRequest.of(page - 1, 6);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("price-ascending")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("price-descending")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> pageProducts = this.productService.findAllWithSpec(pageable, productCriteriaDTO);
        // Page<Product> pageProducts = this.productService.findAll(pageable);
        List<Product> listProducts = pageProducts.getContent();
        List<Category> categories = this.categoryService.findAll();

        String queryString = request.getQueryString();
        if (queryString != null || queryString.isBlank()) {
            queryString = queryString.replace("page=" + page, "");
        }

        model.addAttribute("products", listProducts);
        model.addAttribute("categories", categories);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageProducts.getTotalPages());
        model.addAttribute("queryString", queryString);
        return "client/homepage/products";
    }
}
