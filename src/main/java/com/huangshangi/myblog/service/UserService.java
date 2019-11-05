package com.huangshangi.myblog.service;

import com.huangshangi.myblog.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    //获取用户信息(排行榜专用) 获取前3条
    List<User>getUserList();

    //获取新注册用户信息表(取最新3条)
    List<User>getRegisterList();
}
