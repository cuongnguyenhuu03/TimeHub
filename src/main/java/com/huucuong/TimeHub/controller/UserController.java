package com.huucuong.TimeHub.controller;

import org.springframework.web.bind.annotation.RestController;

import com.huucuong.TimeHub.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// @RestController
// public class UserController {

//     private UserService userService;

//     public UserController(UserService userService) {
//         this.userService = userService;
//     }

//     @GetMapping("/")
//     public String requestMethodName() {
//         return this.userService.handleHello();
//     }
// }

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String requestMethodName() {
        String text = this.userService.handleHello();
        return "hello";
    }
}
