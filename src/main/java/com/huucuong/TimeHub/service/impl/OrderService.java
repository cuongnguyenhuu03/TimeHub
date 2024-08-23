package com.huucuong.TimeHub.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.domain.Cart;
import com.huucuong.TimeHub.domain.CartDetail;
import com.huucuong.TimeHub.domain.Order;
import com.huucuong.TimeHub.domain.OrderDetail;
import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.repository.CartDetailRepository;
import com.huucuong.TimeHub.repository.CartRepository;
import com.huucuong.TimeHub.repository.OrderDetailRepository;
import com.huucuong.TimeHub.repository.OrderRepository;
import com.huucuong.TimeHub.service.IOrderService;

import jakarta.servlet.http.HttpSession;

@Service
public class OrderService implements IOrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    public OrderService(OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository,
            CartDetailRepository cartDetailRepository,
            CartRepository cartRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    @Override
    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {

        // order
        Order order = new Order();
        order.setUser(user);
        order.setFullName(receiverName);
        order.setPhoneNumber(receiverPhone);
        order.setAddress(receiverAddress);

        order = this.orderRepository.save(order);

        // order detail
        Cart cart = this.cartRepository.findByUserId(user.getId());
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setNumberOfProducts(cd.getQuantity());
                    orderDetail.setPrice(cd.getProduct().getPrice());
                    orderDetail.setTotalMoney(cd.getPrice());
                    this.orderDetailRepository.save(orderDetail);
                }
                // delete cartdetail
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }
                // delete cart
                cart.setSum(0);
                this.cartRepository.save(cart);
                // update session
                session.setAttribute("sum", 0);
            }
        }
    }
}
