package com.huangshangi.myblog.service;

import com.huangshangi.myblog.entity.Friend;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FriendService {

    //添加一个友链
    int addFriend(String link,String sumamry);

    //删除一个友链
    int deleteFriend(int deleteId);

    //获取友链
    List<Friend> getFriendList();

}
