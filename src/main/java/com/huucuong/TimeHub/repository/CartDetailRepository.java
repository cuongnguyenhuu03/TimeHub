package com.huucuong.TimeHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huucuong.TimeHub.domain.Cart;
import com.huucuong.TimeHub.domain.CartDetail;
import com.huucuong.TimeHub.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
