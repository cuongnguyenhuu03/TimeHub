package com.huucuong.TimeHub.repository;

import java.util.*;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huucuong.TimeHub.domain.Order;
import com.huucuong.TimeHub.domain.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    public List<OrderDetail> findByOrderId(long id);

    public void deleteByOrder(Order order);
}
