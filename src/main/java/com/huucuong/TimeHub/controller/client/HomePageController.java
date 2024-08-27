package com.huucuong.TimeHub.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.huucuong.TimeHub.domain.Product;
import com.huucuong.TimeHub.domain.Role;
import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.domain.dto.RegisterDTO;
import com.huucuong.TimeHub.service.IProductService;
import com.huucuong.TimeHub.service.IRoleService;
import com.huucuong.TimeHub.service.IUserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {

    private final IProductService productService;
    private final PasswordEncoder passwordEncoder;
    private final IRoleService roleService;
    private final IUserService userService;

    public HomePageController(
            IRoleService roleService,
            IUserService userService,
            IProductService productService,
            PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage(
            Model model,
            @RequestParam(defaultValue = "1", name = "page") int page) {
        Pageable pageable = PageRequest.of(page - 1, 4);
        Page<Product> pageProducts = this.productService.findAll(pageable);
        List<Product> products = pageProducts.getContent();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "auth/login";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        return "auth/register";
    }

    @PostMapping("/register")
    public String register(
            Model model,
            @ModelAttribute("registerDTO") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        // validate start
        if (bindingResult.hasErrors()) {
            return "auth/register";
        }

        User user = RegisterDTO.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        Role role = this.roleService.findRoleByName("USER");
        user.setPassword(hashPassword);
        user.setRole(role);
        this.userService.handleSaveUser(user);

        return "auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage() {
        return "auth/deny";
    }

}
