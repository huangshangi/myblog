package com.huangshangi.myblog.service;

import com.alibaba.fastjson.JSONArray;
import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.CommentTree;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommentService {

    //插入一条评论
    int insertComment(Comment comment);

    //删除一条评论
    int deleteCommentById(int id);

    //删除多条评论
    int deleteCommentsById(List<Integer>ids);

    //获取某篇文章评论列表-资源树
    List<CommentTree>getCommentList(int articleId);

    //获取某个用户评论列表
    List<Comment>getCommentsList(int uid);

    //获取某位用户直接评论
    JSONArray getCommentsJSON(int uid);

    //获取文章评论列表json形式
    String getCommentListJson(int articleId);
}
