package com.sinosoft.exam.authentication.controller;

import com.sinosoft.exam.ques.model.Ques;
import com.sinosoft.exam.ques.service.QuesService;
import com.sinosoft.exam.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class QuesController {
    @Autowired
    QuesService quesService;

    @RequestMapping("/ques/creQues")
    public ModelAndView creQues(){
        Ques ques = new Ques();
        ModelAndView mv = new ModelAndView("post");
        mv.addObject("ques", ques);
        return mv;
    }
    @RequestMapping("/ques/editQues")
    public ModelAndView editQues(HttpServletRequest request,Ques ques){
        User user = (User)request.getSession().getAttribute("user");
        ModelAndView mv = new ModelAndView("post");
        String id = request.getParameter("id");
        if(id != null && !id.equals("")){
            ques = quesService.getQuesById(id);
        }
        mv.addObject("ques", ques);
        mv.addObject("nowUserid", user.getId());
        return mv;
    }
    @RequestMapping("/ques/saveQues")
    public String saveQues(HttpServletRequest request, RedirectAttributes attr,Ques ques){
        User user = (User)request.getSession().getAttribute("user");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String data = sdf.format(new Date());

        if(ques.getId() != null && !ques.getId().equals("")){
            quesService.updateQues(ques);
        }else{
            ques.setAuthor(user.getName());
            ques.setUserid(user.getId());
            ques.setDate(data);
            quesService.saveQues(ques);
        }
        attr.addFlashAttribute("ques",ques);
        return "redirect:/ques/editQues";
    }

    @RequestMapping("/ques/quesList")
    public ModelAndView getQuesList(HttpServletRequest request,RedirectAttributes attr){
        ModelAndView mv = new ModelAndView("index");
        User user = (User)request.getSession().getAttribute("user");
        String userId = user.getId();
        List<Ques> quesList = new ArrayList<Ques>();
        quesList = quesService.getQuesListByUser(user);
        mv.addObject("quesList", quesList);
        mv.addObject("user", user);
        return mv;
    }
}
