package com.huucuong.TimeHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.huucuong.TimeHub.domain.ProductImage;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {
    public List<ProductImage> findByProductId(Long id);

    @Modifying
    @Query("DELETE FROM ProductImage pi WHERE pi.product.id = :id")
    void deleteByProductId(@Param("id") Long id);
}
