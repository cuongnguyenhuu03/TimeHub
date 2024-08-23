package com.huucuong.TimeHub.service;

import com.huucuong.TimeHub.domain.User;

import jakarta.servlet.http.HttpSession;

public interface IOrderService {
    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone);
}
