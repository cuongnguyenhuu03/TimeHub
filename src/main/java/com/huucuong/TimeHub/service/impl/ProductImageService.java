package com.huucuong.TimeHub.service.impl;

import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.ProductImage;
import com.huucuong.TimeHub.repository.ProductImageRepository;
import com.huucuong.TimeHub.service.IProductImageService;

@Service
public class ProductImageService implements IProductImageService {

    private final ProductImageRepository productImageRepository;

    public ProductImageService(ProductImageRepository productImageRepository) {
        this.productImageRepository = productImageRepository;
    }

    @Override
    public ProductImage save(ProductImage productImage) {
        return this.productImageRepository.save(productImage);
    }

}
