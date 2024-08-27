package com.huucuong.TimeHub.service;

import com.huucuong.TimeHub.domain.Order;
import com.huucuong.TimeHub.domain.OrderDetail;
import com.huucuong.TimeHub.domain.User;

import java.util.*;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import jakarta.servlet.http.HttpSession;

public interface IOrderService {
    public Order handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone);

    public Order findById(Long id);

    public Page<Order> findAll(Pageable pageable);

    public List<OrderDetail> findByOrderId(Long id);

    public Order save(Order order);

    public void deleteById(Long id);

    public void deleteOrderDetailByOrderId(Long id);
}
