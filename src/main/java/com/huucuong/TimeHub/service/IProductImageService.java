package com.huucuong.TimeHub.service;

import java.util.List;

import com.huucuong.TimeHub.domain.ProductImage;

public interface IProductImageService {
    public ProductImage save(ProductImage productImage);

    public List<ProductImage> findByProductId(Long id);
}
