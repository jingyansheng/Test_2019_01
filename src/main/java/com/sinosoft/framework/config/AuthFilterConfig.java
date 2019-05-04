package com.sinosoft.framework.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Configuration;

import com.sinosoft.exam.authentication.filter.AuthenticationFilter;

@Configuration
public class AuthFilterConfig {

	public FilterRegistrationBean filterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		
		registration.setName("AuthenticationFilter");
		registration.addUrlPatterns("/*");
		registration.setFilter(new AuthenticationFilter());
		registration.setOrder(1);
		return registration;
	}
}
