package com.sinosoft.exam.authentication.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sinosoft.exam.authentication.service.LoginService;
import com.sinosoft.exam.user.model.User;

@Controller
public class LoginController{
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, @ModelAttribute User user){
		ModelAndView mv = new ModelAndView("index");
		String userName = user.getName();
		String password = user.getPassword();
		//TODO: need to verify here that the username and password are not empty
		logger.debug("login actin, user: " + userName);
		User result = loginService.loginValidate(userName, password);
		if(null == result) {
			mv.setViewName("login");
			mv.addObject("reason", "用户名或密码错误");
		} else {
			mv.addObject("reason", "登陆成功");
			request.getSession().setAttribute("user", result);
			mv.setViewName("redirect:/ques/quesList");
		}
		return mv;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String refresh2Index(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if(null != request.getSession().getAttribute("user")) {
			return "index";
		}else {
			response.sendRedirect("/");
			return null;
		}
		
	}

}
