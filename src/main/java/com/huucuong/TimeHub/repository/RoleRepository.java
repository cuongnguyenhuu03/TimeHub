package com.huucuong.TimeHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huucuong.TimeHub.domain.*;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String role);
}
