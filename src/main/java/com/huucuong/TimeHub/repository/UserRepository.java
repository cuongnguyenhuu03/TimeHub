package com.huucuong.TimeHub.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.huucuong.TimeHub.domain.*;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User newUser);

    User findByEmail(String email);

    boolean existsByEmail(String email);

    Page<User> findAll(Pageable page);
}
