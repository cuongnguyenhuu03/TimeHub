package com.huucuong.TimeHub.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.Cart;
import com.huucuong.TimeHub.domain.CartDetail;
import com.huucuong.TimeHub.domain.Category;
import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.domain.dto.ProductCriteriaDTO;
import com.huucuong.TimeHub.repository.CartDetailRepository;
import com.huucuong.TimeHub.repository.CartRepository;
import com.huucuong.TimeHub.repository.CategoryRepository;
import com.huucuong.TimeHub.repository.ProductRepository;
import com.huucuong.TimeHub.service.IProductService;
import com.huucuong.TimeHub.util.specification.ProductSpecs;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService implements IProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final CategoryRepository categoryRepository;

    public ProductService(
            UserService userService,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            CategoryRepository categoryRepository,
            ProductRepository productRepository) {
        this.userService = userService;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Page<Product> findAllWithSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getOrigin() == null
                && productCriteriaDTO.getCategory() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(pageable);
        }
        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getOrigin() != null && productCriteriaDTO.getOrigin().isPresent()) {
            Specification<Product> currentSpec = ProductSpecs.originListMatch(productCriteriaDTO.getOrigin().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriteriaDTO.getCategory() != null && productCriteriaDTO.getCategory().isPresent()) {
            List<Category> listCategories = new ArrayList<>();
            for (String item : productCriteriaDTO.getCategory().get()) {
                Optional<Category> category = this.categoryRepository.findById(Long.parseLong(item));
                if (category.isPresent()) {
                    listCategories.add(category.get());
                }
            }
            Specification<Product> currentSpec = ProductSpecs.categoryListMatch(listCategories);
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpec = this.findAllWithPriceSpec(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        return this.productRepository.findAll(combinedSpec, pageable);
    }

    public Specification<Product> findAllWithPriceSpec(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : price) {
            double min = 0;
            double max = 0;

            // Set the appropriate min and max based on the price range string
            switch (p) {
                case "under-1000-$":
                    min = 1;
                    max = 1000;
                    break;
                case "1000-1500-$":
                    min = 1000;
                    max = 1500;
                    break;
                case "1500-2000-$":
                    min = 1500;
                    max = 2000;
                    break;
                case "2000-2500-$":
                    min = 2000;
                    max = 2500;
                    break;
                case "2500-3000-$":
                    min = 2500;
                    max = 3000;
                    break;
                case "over-3000-$":
                    min = 3000;
                    max = 30000;
                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

    @Override
    public Page<Product> findAll(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    @Override
    public Product save(Product product) {
        return this.productRepository.save(product);
    }

    @Override
    public Product findProductById(Long id) {
        Optional<Product> product = this.productRepository.findById(id);
        return product.orElse(null);
    }

    @Override
    public void deleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }

    @Override
    public void handleAddProductToCart(String email, Long productId, HttpSession session) {
        User user = this.userService.findUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUserId(user.getId());
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = this.cartRepository.save(newCart);
            }
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();
                CartDetail oldCartDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (oldCartDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(realProduct);
                    cartDetail.setPrice(realProduct.getPrice());
                    cartDetail.setQuantity(1);
                    this.cartDetailRepository.save(cartDetail);
                    // update cart
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    oldCartDetail.setQuantity(oldCartDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldCartDetail);
                }
            }
        }
    }

}
