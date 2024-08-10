package com.huucuong.TimeHub.controller.admin;

import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.service.UserService;
import com.huucuong.TimeHub.util.MessageUtil;

import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final MessageUtil messageUtil;

    public UserController(UserService userService, MessageUtil messageUtil) {
        this.userService = userService;
        this.messageUtil = messageUtil;
    }

    @GetMapping("/admin/user")
    public String getUserPage(
            Model model,
            HttpServletRequest request) {
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            model.addAttribute("messageResponse", message.get("message"));
            model.addAttribute("alert", message.get("alert"));
        }
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUser(
            Model model,
            @ModelAttribute("newUser") User newUser) {
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(
            Model model,
            @PathVariable("id") Long id) {
        User user = this.userService.findUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(
            Model model,
            @PathVariable("id") long id) {
        User currentUser = this.userService.findUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String UpdateUser(
            Model model,
            @ModelAttribute("currentUser") User user) {
        User updateUser = this.userService.findUserById(user.getId());
        if (updateUser != null) {
            updateUser.setAddress(user.getAddress());
            updateUser.setFullName(user.getFullName());
            updateUser.setPhone(user.getPhone());
            this.userService.handleSaveUser(updateUser);
        }
        return "redirect:/admin/user";
    }

    @DeleteMapping("/admin/user/delete/{userId}")
    public ResponseEntity<String> DeleteUser(@PathVariable("userId") Long id) {
        this.userService.deleteUser(id);
        return ResponseEntity.ok("User deleted successfully");
    }
}
