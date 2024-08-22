package com.huucuong.TimeHub.service;

import java.util.List;

import com.huucuong.TimeHub.domain.CartDetail;

public interface ICartDetailService {
    public CartDetail findById(Long id);

    public void deleteCartDetail(Long id);

    public void handleUpdateBeforeCheckout(List<CartDetail> cartDetails);

}
