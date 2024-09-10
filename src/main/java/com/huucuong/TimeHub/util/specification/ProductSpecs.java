package com.huucuong.TimeHub.util.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.huucuong.TimeHub.domain.Category;
import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.Product_;

public class ProductSpecs {

    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> minPrice(Double minPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), minPrice);
    }

    public static Specification<Product> maxPrice(Double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), maxPrice);
    }

    public static Specification<Product> originMatch(String origin) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.ORIGIN), origin);
        // return (root, query, criteriaBuilder) -> criteriaBuilder.disjunction();
    }

    public static Specification<Product> originListMatch(List<String> origin) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.ORIGIN)).value(origin);
    }

    public static Specification<Product> categoryListMatch(List<Category> category) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.CATEGORY)).value(category);
    }

    public static Specification<Product> matchPrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.ge(root.get(Product_.PRICE), min),
                criteriaBuilder.le(root.get(Product_.PRICE), max));
    }

    public static Specification<Product> matchMultiplePrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(
                root.get(Product_.PRICE), min, max);
    }
}
