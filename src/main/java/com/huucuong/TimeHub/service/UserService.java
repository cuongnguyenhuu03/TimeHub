package com.huucuong.TimeHub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User findUserById(Long id) {
        Optional<User> user = this.userRepository.findById(id);
        return user.orElse(null);
    }

    public void deleteUser(Long id) {
        Optional<User> optionalUser = this.userRepository.findById(id);
        optionalUser.ifPresent(userRepository::delete);
    }
}
