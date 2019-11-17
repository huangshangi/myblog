package com.huangshangi.myblog.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class CommentTree extends Comment {

    private List<CommentTree>list;

    private User user;

    public CommentTree() {
        super();
    }

    public CommentTree(int id, int parentId, String content, int uid, int articleId, String createTime) {
        super(id, parentId, content, uid, articleId, createTime);
    }
    public CommentTree(int id, int parentId, String content, int uid, int articleId, Timestamp createTime) {
        super(id, parentId, content, uid, articleId, createTime.toString());
    }

    public CommentTree(int id, int parentId, String content, int uid, int articleId, String createTime, List<CommentTree>list, User user) {
        super(id, parentId, content, uid, articleId, createTime);
        this.list=list;
        this.user=user;
    }

    public List<CommentTree> getList() {
        return list;
    }

    public void setList(List<CommentTree> list) {
        this.list = list;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
