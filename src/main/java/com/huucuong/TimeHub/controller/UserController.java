package com.huucuong.TimeHub.controller;

import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.repository.UserRepository;
import com.huucuong.TimeHub.service.UserService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> listUser = this.userService.getAllUserByEmail("nguyenhuucuong11112003@gmail.com");
        System.out.println(listUser);
        String text = this.userService.handleHello();
        model.addAttribute("hello", text);
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/list";
    }

    @RequestMapping(value = "/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User newUser) {
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

}
