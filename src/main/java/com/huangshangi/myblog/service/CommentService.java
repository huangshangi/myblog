package com.huangshangi.myblog.service;

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

    //获取某篇文章评论列表
    List<CommentTree>getCommentList(int articleId);

    //获取文章评论列表json形式
    String getCommentListJson(int articleId);
}
