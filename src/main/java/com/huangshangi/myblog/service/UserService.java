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

    //根据用户id查询用户信息
    User getUserInfo(int id);

    //添加用户
    int insertUser(String json);

    int insertUser(User user);

    //根据用户名或邮箱id
    User getUserByNameOrEmail(String username);

    //获取某位用户文章总数
    int getArticleCount(int id);

    //获取某位用户评论数
    int getCommentCount(int id);

    int changePass(int id,String oldP,String newP);

    int updateUser(User user);
}
