package com.huangshangi.myblog.entity;

public class Friend {

    private int friendId;

    private String friendLink;

    private String friendSummary;

    public Friend() {
    }

    public Friend(int friendId, String friendLink, String friendSummary) {
        this.friendId = friendId;
        this.friendLink = friendLink;
        this.friendSummary = friendSummary;
    }

    public int getFriendId() {
        return friendId;
    }

    public void setFriendId(int friendId) {
        this.friendId = friendId;
    }

    public String getFriendLink() {
        return friendLink;
    }

    public void setFriendLink(String friendLink) {
        this.friendLink = friendLink;
    }

    public String getFriendSummary() {
        return friendSummary;
    }

    public void setFriendSummary(String friendSummary) {
        this.friendSummary = friendSummary;
    }
}
