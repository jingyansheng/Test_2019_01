package com.sinosoft.exam.ques.service;

import com.sinosoft.exam.ques.mapper.QuesMapper;
import com.sinosoft.exam.ques.model.Ques;
import com.sinosoft.exam.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class QuesServiceImpl implements QuesService {

    @Autowired
    QuesMapper quesMapper;

    @Override
    public Ques getQuesById(String id) {
        return quesMapper.getQuesById(id);
    }

    @Override
    public boolean saveQues(Ques ques) {return quesMapper.saveQues(ques);}

    @Override
    public List<Ques> getQuesListByUser(User user) {
        return quesMapper.getQuesListByUser(user);
    }

    @Override
    public boolean updateQues(Ques ques) {return quesMapper.updateQues(ques);}
}
