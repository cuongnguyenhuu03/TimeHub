package com.huucuong.TimeHub.service;

import java.util.List;

import com.huucuong.TimeHub.domain.Category;

public interface ICategoryService {
    public Category save(Category category);

    public List<Category> findAll();
}
