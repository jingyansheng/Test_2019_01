package com.sinosoft.exam.ques.service;

import com.sinosoft.exam.ques.model.Ques;
import com.sinosoft.exam.user.model.User;

import java.util.List;

public interface QuesService {
    public Ques getQuesById(String id);

    public boolean saveQues(Ques ques);

    public List<Ques> getQuesListByUser(User user);

    public boolean updateQues(Ques ques);
}
