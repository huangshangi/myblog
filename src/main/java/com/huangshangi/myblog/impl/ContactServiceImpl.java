package com.huangshangi.myblog.impl;

import com.huangshangi.myblog.entity.ContactMessage;
import com.huangshangi.myblog.mapper.ContactMapper;
import com.huangshangi.myblog.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {

    @Autowired
    ContactMapper contactMapper;

    @Override
    public int insertMessage(ContactMessage message) {
        return contactMapper.insertMessage(message);
    }

    @Override
    public int deleteMessage(int id) {
        return contactMapper.deleteMessage(id);
    }

    @Override
    public List<ContactMessage> getMessages(int start, int size) {
        return contactMapper.getMessages(start,size);
    }

    @Override
    public List<ContactMessage> getMessageByPage(int page, int pageSize) {
        return getMessages((page-1)*pageSize,pageSize);
    }
}
