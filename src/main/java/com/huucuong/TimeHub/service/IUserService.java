package com.huucuong.TimeHub.service;

import java.util.List;

import com.huucuong.TimeHub.domain.User;

public interface IUserService {
    List<User> getAllUser();

    List<User> getAllUserByEmail(String email);

    User handleSaveUser(User user);

    User findUserById(Long id);

    void deleteUser(Long id);
}
