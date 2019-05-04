package com.sinosoft.exam.ques.mapper;

import com.sinosoft.exam.ques.model.Ques;
import com.sinosoft.exam.user.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface QuesMapper {
    public Ques getQuesById(String id);

    public boolean saveQues(Ques ques);

    public List<Ques> getQuesListByUser(User user);

    public boolean updateQues(Ques ques);


}
