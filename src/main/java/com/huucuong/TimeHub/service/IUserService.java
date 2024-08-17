package com.huucuong.TimeHub.service;

import java.util.List;

import com.huucuong.TimeHub.domain.User;

public interface IUserService {
    List<User> getAllUser();

    User handleSaveUser(User user);

    User findUserById(Long id);

    void deleteUser(Long id);

    boolean checkEmailExist(String email);

    User findUserByEmail(String email);
}
