package com.huucuong.TimeHub.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.Cart;
import com.huucuong.TimeHub.domain.CartDetail;
import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.repository.CartDetailRepository;
import com.huucuong.TimeHub.repository.CartRepository;
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

    public ProductService(
            UserService userService,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            ProductRepository productRepository) {
        this.userService = userService;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
    }

    @Override
    // public Page<Product> findAllWithSpec(Pageable pageable, String name) {
    // return this.productRepository.findAll(ProductSpecs.nameLike(name), pageable);
    // }

    // case 1
    // public Page<Product> findAllWithSpec(Pageable pageable, double min) {
    // return this.productRepository.findAll(ProductSpecs.minPrice(min), pageable);
    // }

    // case 2
    // public Page<Product> findAllWithSpec(Pageable pageable, double max) {
    // return this.productRepository.findAll(ProductSpecs.maxPrice(max), pageable);
    // }

    // case 3
    public Page<Product> findAllWithSpec(Pageable pageable, String origin) {
        return this.productRepository.findAll(ProductSpecs.originMatch(origin),
                pageable);
    }

    // case 4
    // public Page<Product> findAllWithSpec(Pageable pageable, List<String> origin)
    // {
    // return this.productRepository.findAll(ProductSpecs.originListMatch(origin),
    // pageable);
    // }

    // case 5
    // public Page<Product> findAllWithSpec(Pageable pageable, String price) {
    // // eg: price 1000-1500-$
    // if (price.equals("1000-1500-$")) {
    // double min = 1000;
    // double max = 1500;
    // return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
    // pageable);
    // } else if (price.equals("1500-2000-$")) {
    // double min = 1500;
    // double max = 2000;
    // return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
    // pageable);
    // } else {
    // return this.productRepository.findAll(pageable);
    // }
    // }

    // Case 6
    // public Page<Product> findAllWithSpec(Pageable page, List<String> price) {
    // Specification<Product> combinedSpec = (root, query, criteriaBuilder) ->
    // criteriaBuilder.disjunction();
    // int count = 0;
    // for (String p : price) {
    // double min = 0;
    // double max = 0;

    // // Set the appropriate min and max based on the price range string
    // switch (p) {
    // case "1000-1500-$":
    // min = 1000;
    // max = 1500;
    // count++;
    // break;
    // case "1500-2000-$":
    // min = 1500;
    // max = 2000;
    // count++;
    // break;
    // case "2000-2500-$":
    // min = 2000;
    // max = 2500;
    // count++;
    // break;
    // case "2500-3000-$":
    // min = 2500;
    // max = 3000;
    // count++;
    // break;
    // // Add more cases as needed
    // }

    // if (min != 0 && max != 0) {
    // Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
    // combinedSpec = combinedSpec.or(rangeSpec);
    // }
    // }

    // // Check if any price ranges were added (combinedSpec is empty)
    // if (count == 0) {
    // return this.productRepository.findAll(page);
    // }

    // return this.productRepository.findAll(combinedSpec, page);
    // }

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
