package com.huucuong.TimeHub.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.huucuong.TimeHub.domain.*;
import java.util.List;
import java.util.Map;

import com.huucuong.TimeHub.service.impl.OrderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.huucuong.TimeHub.util.message.MessageUtil;

@Controller
public class OrderController {

    private final OrderService orderService;
    private final MessageUtil messageUtil;

    public OrderController(
            MessageUtil messageUtil,
            OrderService orderService) {
        this.orderService = orderService;
        this.messageUtil = messageUtil;
    }

    @GetMapping("/admin/order")
    public String getOrder(
            Model model,
            @RequestParam(defaultValue = "1", name = "page") int page,
            HttpServletRequest request) {

        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("messageResponse", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }

        Pageable pageable = PageRequest.of(page - 1, 5);

        Page<Order> pageOrders = this.orderService.findAll(pageable);
        List<Order> orders = pageOrders.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageOrders.getTotalPages());
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getDetailPage(
            Model model,
            @PathVariable("id") Long id) {
        Order order = this.orderService.findById(id);
        float totalPrice = order.getTotalMoney();
        List<OrderDetail> orderDetails = this.orderService.findByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdatePage(
            Model model,
            @PathVariable("id") Long id) {
        Order order = this.orderService.findById(id);
        model.addAttribute("order", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateOrder(
            @ModelAttribute("order") Order order) {
        Order updateOrder = this.orderService.findById(order.getId());
        updateOrder.setStatus(order.getStatus());
        this.orderService.save(updateOrder);
        return "redirect:/admin/order";
    }

    @Transactional
    @DeleteMapping("/admin/order/delete/{id}")
    public ResponseEntity<String> deleteOrder(@PathVariable("id") Long id) {
        this.orderService.deleteOrderDetailByOrderId(id);
        this.orderService.deleteById(id);
        return ResponseEntity.ok("delete order successfully");
    }

}
