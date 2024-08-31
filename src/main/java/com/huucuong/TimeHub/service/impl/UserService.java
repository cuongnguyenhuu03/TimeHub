package com.huucuong.TimeHub.service.impl;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.repository.UserRepository;
import com.huucuong.TimeHub.service.IUserService;

@Service
public class UserService implements IUserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public Page<User> findAll(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    @Override
    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    @Override
    public User findUserById(Long id) {
        Optional<User> user = this.userRepository.findById(id);
        return user.orElse(null);
    }

    @Override
    public void deleteUser(Long id) {
        Optional<User> optionalUser = this.userRepository.findById(id);
        optionalUser.ifPresent(userRepository::delete);
    }

    @Override
    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    @Override
    public User findUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
