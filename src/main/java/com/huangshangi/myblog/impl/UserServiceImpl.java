package com.huangshangi.myblog.impl;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.mapper.UserMapper;
import com.huangshangi.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> getRegisterList() {
        List<User>list=userMapper.getUserList(3);
        return list;
    }

    @Override
    public List<User> getUserList() {

        List<User>list=userMapper.getUserOrderArticle(3);
        return list;
    }

    @Override
    public User getUserInfo(int id) {
        return null;
    }

    @Override
    public int insertUser(String json) {
        JSONObject jsonObject=JSONObject.parseObject(json);


        return 0;
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public User getUserByNameOrEmail(String username) {
        return userMapper.getUserByNameOrEmail(username);
    }
}
