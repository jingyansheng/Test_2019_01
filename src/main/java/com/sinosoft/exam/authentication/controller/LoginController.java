package com.sinosoft.exam.authentication.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController{
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, RedirectAttributes redirectAttributes, @ModelAttribute User user){
		ModelAndView mv = new ModelAndView("index");
		String userName = user.getName();
		String password = user.getPassword();
		logger.debug("login actin, user: " + userName);
		User result = loginService.loginValidate(userName, password);
		if(null == result) {
			mv.setViewName("login");
			mv.addObject("reason", "wrong user name or password");
		} else {
			mv.addObject("reason", "login successful");
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

	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request){
		ModelAndView result = new ModelAndView("login");
		HttpSession session = request.getSession();//获取当前session
		if(session!=null){
			User user = (User)session.getAttribute("user");//从当前session中获取用户信息
			result.addObject("reason", "You have logged out of your previous login account");
			session.invalidate();//关闭session
		}
		return result;

	}

}
