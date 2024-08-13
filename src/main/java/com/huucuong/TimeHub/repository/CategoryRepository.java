package com.huucuong.TimeHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.huucuong.TimeHub.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    // public Category save(Category category);
}
