package com.huangshangi.myblog.impl;

import com.huangshangi.myblog.entity.Friend;
import com.huangshangi.myblog.mapper.FriendMapper;
import com.huangshangi.myblog.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendServiceImpl implements FriendService {

    @Autowired
    FriendMapper friendMapper;

    @Override
    public int addFriend(String link, String sumamry) {

        return friendMapper.addFriend(link,sumamry);
    }

    @Override
    public int deleteFriend(int deleteId) {
        return friendMapper.deleteFriend(deleteId);
    }

    @Override
    public List<Friend> getFriendList() {
        return friendMapper.getFriendList();
    }
}
