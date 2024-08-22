package com.huucuong.TimeHub.service;

import com.huucuong.TimeHub.domain.CartDetail;

public interface ICartDetailService {
    public CartDetail findById(Long id);

    public void deleteCartDetail(Long id);

}
