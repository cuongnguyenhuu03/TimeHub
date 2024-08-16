package com.huucuong.TimeHub.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.Role;
import com.huucuong.TimeHub.repository.RoleRepository;
import com.huucuong.TimeHub.service.IRoleService;

@Service
public class RoleService implements IRoleService {

    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public List<Role> findAll() {
        return this.roleRepository.findAll();
    }

    @Override
    public Role findRoleByName(String role) {
        return this.roleRepository.findByName(role);
    }

}
