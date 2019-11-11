package com.huangshangi.myblog.mapper;

import com.huangshangi.myblog.entity.Friend;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FriendMapper {

    //添加一个友链
    int addFriend(@Param(value="link") String link, @Param(value="summary") String summary);

    //删除一个友链
    int deleteFriend(@Param(value="id") int id);

    //获取友链信息
    List<Friend> getFriendList();

}
