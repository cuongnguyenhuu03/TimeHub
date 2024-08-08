package com.huucuong.TimeHub.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String email;

    private String password;

    private String fullName;

    private String phone;

    private String address;

    private long facebookAccountId;

    private long gmailAccountId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public String getFullname() {
        return fullName;
    }

    public void setFullname(String fullname) {
        this.fullName = fullname;
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
        return "User [id=" + id + ", email=" + email + ", password=" + password + ", fullname=" + fullName + ", phone="
                + phone + ", facebookAccountId=" + facebookAccountId + ", gmailAccountId=" + gmailAccountId + "]";
    }

}
