package com.huucuong.TimeHub.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huucuong.TimeHub.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    Page<Order> findAll(Pageable page);

    // @Modifying
    // @Query("DELETE FROM Order o WHERE o.id = :id")
    // void deleteById(@Param("id") Long id);
}
