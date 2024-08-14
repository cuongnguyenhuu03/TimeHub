package com.huucuong.TimeHub.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.repository.ProductRepository;
import com.huucuong.TimeHub.service.IProductService;

@Service
public class ProductService implements IProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    @Override
    public Product save(Product product) {
        return this.productRepository.save(product);
    }

    @Override
    public Product findProductById(Long id) {
        Optional<Product> product = this.productRepository.findById(id);
        return product.orElse(null);
    }

    @Override
    public void deleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }
}
