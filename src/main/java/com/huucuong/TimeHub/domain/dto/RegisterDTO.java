package com.huucuong.TimeHub.domain.dto;

import com.huucuong.TimeHub.domain.User;
import com.huucuong.TimeHub.util.validator.RegisterChecked;
import com.huucuong.TimeHub.util.validator.StrongPassword;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {

    @Size(min = 3, max = 20, message = "The full name must be between 3 and 20 characters")
    private String firstName;

    @Size(min = 3, max = 20, message = "The last name must be between 3 and 20 characters")
    private String lastName;

    @Email
    private String email;

    @StrongPassword
    private String password;

    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public static User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

}