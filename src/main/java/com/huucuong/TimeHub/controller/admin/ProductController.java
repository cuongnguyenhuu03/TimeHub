package com.huucuong.TimeHub.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.huucuong.TimeHub.domain.Category;
import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.ProductImage;
import com.huucuong.TimeHub.service.ICategoryService;
import com.huucuong.TimeHub.service.IUploadService;
import com.huucuong.TimeHub.service.impl.CategoryService;
import com.huucuong.TimeHub.service.impl.ProductImageService;
import com.huucuong.TimeHub.service.impl.ProductService;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final CategoryService categoryService;
    private final IUploadService uploadService;
    private final ProductImageService productImageService;
    private final ProductService productService;

    public ProductController(
            CategoryService categoryService,
            IUploadService uploadService,
            ProductImageService productImageService,
            ProductService productService) {
        this.categoryService = categoryService;
        this.uploadService = uploadService;
        this.productImageService = productImageService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.findAll();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        List<Category> categories = this.categoryService.findAll();
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categories);
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(
            Model model,
            @ModelAttribute("product") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("productFiles") MultipartFile[] productFiles) {

        // validate
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            List<Category> categories = this.categoryService.findAll();
            model.addAttribute("categories", categories);
            return "/admin/product/create";
        }
        List<ProductImage> imageFiles = new ArrayList<>();
        Product newProduct = this.productService.save(product);
        for (MultipartFile productFile : productFiles) {
            String fileName = this.uploadService.handleSaveFile(productFile, "product");
            if (fileName == "") {
                continue;
            }
            ProductImage productImage = new ProductImage();
            productImage.setProduct(newProduct);
            productImage.setImageUrl(fileName);
            productImageService.save(productImage);
            imageFiles.add(productImage);
        }

        newProduct.setProductImages(imageFiles);
        productService.save(newProduct);
        return "redirect:/admin/product";
    }
}
