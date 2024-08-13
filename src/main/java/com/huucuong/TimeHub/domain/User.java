package com.huucuong.TimeHub.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "user")
public class User extends Base {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Email(message = "Email is not valid")
    private String email;

    @Size(min = 3, max = 250, message = "The password must be between 3 and 250 characters")
    private String password;

    @Size(min = 3, max = 50, message = "The full name must be between 3 and 50 characters")
    @Column(name = "full_name")
    private String fullName;

    @Size(min = 10, max = 20, message = "The phone number must be between 10 and 20 characters")
    private String phone;

    @Size(min = 3, max = 50, message = "The address must be between 3 and 50 characters")
    private String address;

    @Column(name = "facebook_account_id")
    private long facebookAccountId;

    @Column(name = "gmail_account_id")
    private long gmailAccountId;

    private String avatar;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    public void setId(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public long getFacebookAccountId() {
        return facebookAccountId;
    }

    public void setFacebookAccountId(long facebookAccountId) {
        this.facebookAccountId = facebookAccountId;
    }

    public long getGmailAccountId() {
        return gmailAccountId;
    }

    public void setGmailAccountId(long gmailAccountId) {
        this.gmailAccountId = gmailAccountId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", password=" + password + ", fullName=" + fullName + ", phone="
                + phone + ", address=" + address + ", facebookAccountId=" + facebookAccountId + ", gmailAccountId="
                + gmailAccountId + ", avatar=" + avatar + "]";
    }
}
