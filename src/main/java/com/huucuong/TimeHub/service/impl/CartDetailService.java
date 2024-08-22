package com.huucuong.TimeHub.service.impl;

import java.util.List;
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

    @Override
    public void handleUpdateBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

}
