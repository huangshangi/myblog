package com.huangshangi.myblog.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

    private int userId;//用户id 作为主键

    private String userName;//用户昵称

    private String userPass;//用户密码

    private String userImage;//用户头衔地址

    private String userEmail;//用户邮箱地址

    private String userIp;//用户ip地址

    private String userRegisterTime;//用户首次注册时间

    private String userLastTime;//用户上次登录时间

    private int checkCount;//文章游览总次数

    private int commentCount;//文章评论次数

    private int articleCount;//文章总数


    public User() {
    }

    public User(int userId, String userName, String userPass, String userImage,String userEmail, String userIp, String userRegisterTime, String userLastTime, int checkCount, int commentCount, int articleCount) {
        this.userId = userId;
        this.userName = userName;
        this.userPass = userPass;
        this.userImage = userImage;
        this.userEmail=userEmail;
        this.userIp = userIp;
        this.userRegisterTime = userRegisterTime;
        this.userLastTime = userLastTime;
        this.checkCount = checkCount;
        this.commentCount = commentCount;
        this.articleCount = articleCount;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getUserIp() {
        return userIp;
    }

    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }

    public String getUserRegisterTime() {
        return userRegisterTime;
    }

    public void setUserRegisterTime(String userRegisterTime) {
        this.userRegisterTime = userRegisterTime;
    }

    public String getUserLastTime() {
        return userLastTime;
    }

    public void setUserLastTime(String userLastTime) {
        this.userLastTime = userLastTime;
    }

    public int getCheckCount() {
        return checkCount;
    }

    public void setCheckCount(int checkCount) {
        this.checkCount = checkCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public int getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(int articleCount) {
        this.articleCount = articleCount;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }


}
