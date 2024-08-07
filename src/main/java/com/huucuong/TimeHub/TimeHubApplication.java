package com.huucuong.TimeHub;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@SpringBootApplication
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class TimeHubApplication {

	public static void main(String[] args) {
		SpringApplication.run(TimeHubApplication.class, args);
	}

}
