package com.huucuong.TimeHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.huucuong.TimeHub.domain.*;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User newUser);

    List<User> findByEmail(String email);
}
