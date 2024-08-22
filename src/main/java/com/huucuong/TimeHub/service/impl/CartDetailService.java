package com.huucuong.TimeHub.service.impl;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.CartDetail;
import com.huucuong.TimeHub.repository.CartDetailRepository;
import com.huucuong.TimeHub.service.ICartDetailService;

@Service
public class CartDetailService implements ICartDetailService {

    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    @Override
    public CartDetail findById(Long id) {
        Optional<CartDetail> cartDetail = this.cartDetailRepository.findById(id);
        return cartDetail.get();
    }

    @Override
    public void deleteCartDetail(Long id) {
        this.cartDetailRepository.deleteById(id);
    }

}
