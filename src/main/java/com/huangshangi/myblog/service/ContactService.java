package com.huangshangi.myblog.service;

import com.huangshangi.myblog.entity.ContactMessage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ContactService {

    //增加一条留言
    int insertMessage(ContactMessage message);


    //删除一条留言
    int deleteMessage(int id);

    //查询一系列留言(分页 )根据发布时间倒序
    List<ContactMessage> getMessages(int start, int size);


    //分页查询查询留言
    List<ContactMessage>getMessageByPage(int page,int pageSize);

}
