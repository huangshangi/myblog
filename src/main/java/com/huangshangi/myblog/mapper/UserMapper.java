package com.huangshangi.myblog.mapper;

import com.huangshangi.myblog.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    /*
        获取用户列表()
        sum->用户列表长度 根据文章
     */
    List<User>getUserList(@Param(value = "sum") Integer sum);

    //根据用户id或邮箱地址获取用户个人信息
    User getUserByNameOrEmail(@Param(value="string") String string);

    //根据用户name获取用户个人信息
    User getUserByName(@Param(value="name") String name);


    //根据用户email获取个人信息
    User getUserByEmail(@Param(value="email") String email);

    //删除用户
    int deleteByNameOrEmail(@Param(value="string") String string);

    //添加用户
    int insertUser(User user);

    //更新用户
    int updateUser(User user);



}
