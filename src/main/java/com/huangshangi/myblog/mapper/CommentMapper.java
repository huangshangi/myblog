package com.huangshangi.myblog.mapper;

import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.CommentTree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface CommentMapper {

    //增加一条评论
    int insertComment(Comment comment);

    //根据评论id删除某条评论
    int deleteCommentById(@Param(value = "id") int id);

    //根据评论id批量删除数据
    int deleteCommentsByIds(@Param(value = "ids")ArrayList<Integer>ids);

    //根据评论id查询某条评论
    Comment getCommentById(@Param(value = "id")int id);

    //根据父评论id查询某条评论
    Comment getCommentByParentDd(@Param(value = "id")int id);

    //根据文章id获取文章评论树
    List<CommentTree>getCommentTree(@Param(value="id")int id);

    //获取文章的直接评论->articleId
    List<Comment>getComments(@Param(value = "id")int id,@Param(value = "size")int size,@Param(value = "style")String style);



}
