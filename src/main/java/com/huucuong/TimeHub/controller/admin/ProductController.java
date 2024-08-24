package com.huucuong.TimeHub.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.huucuong.TimeHub.domain.Category;
import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.ProductImage;
import com.huucuong.TimeHub.service.IUploadService;
import com.huucuong.TimeHub.service.impl.CategoryService;
import com.huucuong.TimeHub.service.impl.ProductImageService;
import com.huucuong.TimeHub.service.impl.ProductService;
import com.huucuong.TimeHub.util.message.MessageUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final CategoryService categoryService;
    private final IUploadService uploadService;
    private final ProductImageService productImageService;
    private final ProductService productService;
    private final MessageUtil messageUtil;

    public ProductController(
            CategoryService categoryService,
            IUploadService uploadService,
            ProductImageService productImageService,
            MessageUtil messageUtil,
            ProductService productService) {
        this.categoryService = categoryService;
        this.uploadService = uploadService;
        this.productImageService = productImageService;
        this.productService = productService;
        this.messageUtil = messageUtil;
    }

    @GetMapping("/admin/product")
    public String getProductPage(
            Model model,
            HttpServletRequest request) {

        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("messageResponse", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }

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

        // validate start
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            List<Category> categories = this.categoryService.findAll();
            model.addAttribute("categories", categories);
            return "/admin/product/create";
        }
        // validate end
        List<ProductImage> imageFiles = new ArrayList<>();
        Product newProduct = this.productService.save(product);

        boolean isFirstIteration = true;
        String thumbnail = "";
        for (MultipartFile productFile : productFiles) {
            String fileName = this.uploadService.handleSaveFile(productFile, "product");
            if (fileName == "") {
                continue;
            }
            // Use the first element in productFiles to make the background image
            if (isFirstIteration) {
                thumbnail = fileName;
                isFirstIteration = false;
            }
            ProductImage productImage = new ProductImage();
            productImage.setProduct(newProduct);
            productImage.setImageUrl(fileName);
            productImageService.save(productImage);
            imageFiles.add(productImage);
        }

        newProduct.setThumbnail(thumbnail);
        newProduct.setProductImages(imageFiles);
        productService.save(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getMethodName(
            Model model,
            @PathVariable("id") Long id) {

        Product product = productService.findProductById(id);
        List<ProductImage> productImages = productImageService.findByProductId(id);
        model.addAttribute("product", product);
        model.addAttribute("productImages", productImages);
        return "admin/product/detail";
    }

    @DeleteMapping("/admin/product/delete/{id}")
    public ResponseEntity<String> deleteProduct(
            @PathVariable("id") Long id) {
        this.productService.deleteProduct(id);
        return ResponseEntity.ok("Product was deleted successfully");
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(
            Model model,
            @PathVariable("id") Long id) {
        List<ProductImage> productImages = this.productImageService.findByProductId(id);
        Product product = this.productService.findProductById(id);
        List<Category> categories = this.categoryService.findAll();
        model.addAttribute("product", product);
        model.addAttribute("categories", categories);
        model.addAttribute("productImages", productImages);
        return "admin/product/update";
    }

    @Transactional
    @PostMapping("/admin/product/update")
    public String updateProduct(Model model,
            @ModelAttribute("product") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("productFiles") MultipartFile[] productFiles) {

        // validate start
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            List<Category> categories = this.categoryService.findAll();
            model.addAttribute("categories", categories);
            return "/admin/product/create";
        }
        // validate end

        List<ProductImage> imageFiles = new ArrayList<>();

        Product updateProduct = this.productService.findProductById(product.getId());
        updateProduct.setCategory(product.getCategory());
        updateProduct.setName(product.getName());
        updateProduct.setDescription(product.getDescription());
        updateProduct.setShortDescription(product.getShortDescription());
        updateProduct.setQuantity(product.getQuantity());
        updateProduct.setOrigin(product.getOrigin());
        updateProduct.setPrice(product.getPrice());

        this.productService.save(updateProduct);

        boolean isFirstIteration = true;
        String thumbnail = "";
        for (MultipartFile productFile : productFiles) {
            String fileName = this.uploadService.handleSaveFile(productFile, "product");
            if (fileName == "") {
                continue;
            } else {
                // Use the first element in productFiles to make the background image
                if (isFirstIteration) {
                    thumbnail = fileName;
                    isFirstIteration = false;
                }
                productImageService.deleteByProductId(product.getId());
                ProductImage productImage = new ProductImage();
                productImage.setProduct(updateProduct);
                productImage.setImageUrl(fileName);
                productImageService.save(productImage);
                imageFiles.add(productImage);
            }

        }

        updateProduct.setThumbnail(thumbnail);
        updateProduct.setProductImages(imageFiles);
        productService.save(updateProduct);
        return "redirect:/admin/product";
    }

}
