package com.huucuong.TimeHub.domain.dto;

import java.util.List;
import java.util.Optional;

public class ProductCriteriaDTO {

    private Optional<List<String>> origin;
    private Optional<List<String>> category;
    private Optional<List<String>> price;
    private Optional<String> sort;

    public Optional<List<String>> getOrigin() {
        return origin;
    }

    public void setOrigin(Optional<List<String>> origin) {
        this.origin = origin;
    }

    public Optional<List<String>> getCategory() {
        return category;
    }

    public void setCategory(Optional<List<String>> category) {
        this.category = category;
    }

    public Optional<List<String>> getPrice() {
        return price;
    }

    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }
}
