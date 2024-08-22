package com.huucuong.TimeHub.service;

import java.util.List;

import com.huucuong.TimeHub.domain.Product;

import jakarta.servlet.http.HttpSession;

public interface IProductService {
    public List<Product> findAll();

    public Product save(Product product);

    public Product findProductById(Long id);

    public void deleteProduct(Long id);

    public void handleAddProductToCart(String Email, Long productId, HttpSession session);

}
