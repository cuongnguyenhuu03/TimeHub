package com.huucuong.TimeHub.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {

    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/show";
    }

    @GetMapping("/cart")
    public String getCartPage() {
        return "client/cart/show";
    }

}
