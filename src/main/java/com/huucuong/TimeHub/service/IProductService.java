package com.huucuong.TimeHub.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.huucuong.TimeHub.domain.Product;

import jakarta.servlet.http.HttpSession;

public interface IProductService {
    public Page<Product> findAll(Pageable pageable);

    public Product save(Product product);

    public Product findProductById(Long id);

    public void deleteProduct(Long id);

    public void handleAddProductToCart(String Email, Long productId, HttpSession session);

}
