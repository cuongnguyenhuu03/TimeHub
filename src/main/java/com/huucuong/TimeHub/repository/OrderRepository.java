package com.huucuong.TimeHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.huucuong.TimeHub.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    // @Modifying
    // @Query("DELETE FROM Order o WHERE o.id = :id")
    // void deleteById(@Param("id") Long id);
}
