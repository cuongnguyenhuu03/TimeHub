package com.huucuong.TimeHub.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.huucuong.TimeHub.domain.User;

public interface IUserService {
    User handleSaveUser(User user);

    User findUserById(Long id);

    void deleteUser(Long id);

    boolean checkEmailExist(String email);

    User findUserByEmail(String email);

    Page<User> findAll(Pageable pageable);
}
