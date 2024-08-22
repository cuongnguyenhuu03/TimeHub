package com.huucuong.TimeHub.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.Cart;
import com.huucuong.TimeHub.domain.CartDetail;
import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.repository.CartDetailRepository;
import com.huucuong.TimeHub.repository.CartRepository;
import com.huucuong.TimeHub.repository.ProductRepository;
import com.huucuong.TimeHub.service.IProductService;

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
    public List<Product> findAll() {
        return this.productRepository.findAll();
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
