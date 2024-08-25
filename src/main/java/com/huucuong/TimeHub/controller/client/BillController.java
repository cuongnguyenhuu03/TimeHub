package com.huucuong.TimeHub.controller.client;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.huucuong.TimeHub.domain.Order;
import com.huucuong.TimeHub.service.impl.BillService;
import com.huucuong.TimeHub.service.impl.OrderService;
import com.itextpdf.text.DocumentException;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BillController {

    private final OrderService orderService;
    private final BillService billService;

    public BillController(
            BillService billService,
            OrderService orderService) {
        this.orderService = orderService;
        this.billService = billService;
    }

    @GetMapping("/generate-bill/{id}")
    public String generateBill(
            @PathVariable("id") Long id) {
        try {
            this.billService.generatePdf(id);
        } catch (DocumentException | IOException e) {
            e.printStackTrace();
        }
        return "redirect:/thank-you";
    }
}
