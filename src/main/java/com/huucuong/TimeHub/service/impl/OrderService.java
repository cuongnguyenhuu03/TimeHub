package com.huucuong.TimeHub.service.impl;

import java.util.List;

import java.util.Optional;
import org.springframework.stereotype.Service;

import com.huucuong.TimeHub.constant.OrderStatus;
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
        order.setStatus(OrderStatus.PENDING);
        order.setPaymentMethod("COD");

        order = this.orderRepository.save(order);

        // order detail
        Cart cart = this.cartRepository.findByUserId(user.getId());
        float totalMoney = 0;
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    totalMoney += cd.getPrice();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setNumberOfProducts(cd.getQuantity());
                    orderDetail.setPrice(cd.getProduct().getPrice());
                    orderDetail.setTotalMoney(cd.getPrice());
                    this.orderDetailRepository.save(orderDetail);
                }

                order.setTotalMoney(totalMoney);
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

    @Override
    public Order findById(Long id) {
        Optional<Order> order = this.orderRepository.findById(id);
        return order.get();
    }

    @Override
    public List<Order> findAll() {
        return this.orderRepository.findAll();
    }

    @Override
    public List<OrderDetail> findByOrderId(Long id) {
        return this.orderDetailRepository.findByOrderId(id);
    }

    @Override
    public Order save(Order order) {
        return this.orderRepository.save(order);
    }

    @Override
    public void deleteById(Long id) {
        this.orderRepository.deleteById(id);
    }

    @Override
    public void deleteOrderDetailByOrderId(Long id) {
        Order order = new Order();
        order.setId(id);
        this.orderDetailRepository.deleteByOrder(order);
    }
}
