package com.huucuong.TimeHub.controller.admin;

import com.huucuong.TimeHub.domain.Role;
import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.service.IRoleService;
import com.huucuong.TimeHub.service.IUploadService;
import com.huucuong.TimeHub.service.IUserService;
import com.huucuong.TimeHub.service.impl.RoleService;
import com.huucuong.TimeHub.service.impl.UserService;
import com.huucuong.TimeHub.util.MessageUtil;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    private final IUserService userService;
    private final IRoleService roleService;
    private final MessageUtil messageUtil;
    private final IUploadService uploadService;
    PasswordEncoder passwordEncoder;

    public UserController(
            UserService userService,
            RoleService roleService,
            IUploadService uploadService,
            MessageUtil messageUtil,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.messageUtil = messageUtil;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
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
        List<Role> roles = roleService.findAll();
        model.addAttribute("newUser", new User());
        model.addAttribute("roles", roles);
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUser(
            Model model,
            @ModelAttribute("newUser") User newUser,
            @RequestParam("avatarFile") MultipartFile avatarFile) {
        String avatar = this.uploadService.handleSaveFile(avatarFile, "avatar");
        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());

        newUser.setAvatar(avatar);
        newUser.setPassword(hashPassword);
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
            @ModelAttribute("currentUser") User user,
            @RequestParam("avatarUpdateFile") MultipartFile avatarUpdateFile) {
        User updateUser = this.userService.findUserById(user.getId());
        if (updateUser != null) {
            String avatar = this.uploadService.handleSaveFile(avatarUpdateFile, "avatar");

            updateUser.setAvatar(avatar);
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
