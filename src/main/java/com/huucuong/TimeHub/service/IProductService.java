package com.huucuong.TimeHub.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.dto.ProductCriteriaDTO;

import jakarta.servlet.http.HttpSession;

public interface IProductService {
    public Page<Product> findAll(Pageable pageable);

    public Page<Product> findAllWithSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO);

    public Product save(Product product);

    public Product findProductById(Long id);

    public void deleteProduct(Long id);

    public void handleAddProductToCart(String Email, Long productId, HttpSession session);

}
