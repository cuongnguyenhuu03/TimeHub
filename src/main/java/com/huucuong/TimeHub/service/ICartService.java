package com.huucuong.TimeHub.service;

import com.huucuong.TimeHub.domain.Cart;

public interface ICartService {
    public Cart findByUserId(Long id);

    public void deleteById(Long id);
}
