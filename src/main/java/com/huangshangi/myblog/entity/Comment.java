package com.huangshangi.myblog.entity;

import java.util.Date;

public class Comment {

    private int id;//评论id

    private int parentId;//父评论id

    private String content;//评论内容

    private int uid;//评论人id

    private int articleId;//评论文章id

    private String createTime;//评论创建时间

    public Comment() {
    }

    public Comment(int id, int parentId, String content, int uid, int articleId,String createTime) {
        this.id = id;
        this.parentId = parentId;
        this.content = content;
        this.uid = uid;
        this.articleId = articleId;
        this.createTime=createTime;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
