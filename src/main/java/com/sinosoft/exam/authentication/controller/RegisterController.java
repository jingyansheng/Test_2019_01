package com.sinosoft.exam.authentication.controller;

import com.sinosoft.exam.tools.StringProcessor;
import com.sinosoft.exam.user.model.User;
import com.sinosoft.exam.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegisterController {
    @Autowired
    UserService userService;

    @RequestMapping("register")
    public ModelAndView register(){
        System.out.println("I want to register");
        ModelAndView mv = new ModelAndView("register");
        mv.addObject("reason", "");
        return mv;
    }

    @RequestMapping("/verifyRepeat")
    @ResponseBody
    public boolean verifyRepeat (String name){
        System.out.println("verify start");
        System.out.println(userService.verifyUsername(name));
        return userService.verifyUsername(name);
    }

    @RequestMapping("/creAccount")
    public String createAccount(User user, RedirectAttributes redirectAttributes){
        //ModelAndView mv = new ModelAndView("register");
        //密码MD5加密
        if(!StringProcessor.isNullOrEmpty(user.getPassword())) {
            user.setPassword(StringProcessor.getMD5(user.getPassword()));
        }
        if(userService.createAccount(user)){
            redirectAttributes.addFlashAttribute("reason", "Create account successfully");
            //mv.setViewName("redirect:/login");
            return ("login");
        }
        //mv.addObject("reason", "Failed to create account");
        redirectAttributes.addFlashAttribute("reason", "Failed to create account");
        return ("redirect:/register");
    }
}
