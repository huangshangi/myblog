package com.huangshangi.myblog.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.CommentTree;
import com.huangshangi.myblog.mapper.CommentMapper;
import com.huangshangi.myblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {


    @Autowired
    CommentMapper commentMapper;

    @Override
    public int insertComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public int deleteCommentById(int id) {
        return commentMapper.deleteCommentById(id);
    }

    @Override
    public List<CommentTree> getCommentList(int articleId) {
        return commentMapper.getCommentTree(articleId);
    }

    @Override
    public String getCommentListJson(int articleId) {

        List<CommentTree>list=getCommentList(articleId);

        JSONArray jsonArray=addCommentItem(list);

        return jsonArray.toJSONString();
    }

    //一个工具类 用来递归填写commentListJson
    JSONArray addCommentItem(List<CommentTree>list){
        //对本文章的每一条评论
        JSONArray jsonArray=new JSONArray();
        for(CommentTree commentTree:list){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("id",commentTree.getId());
            jsonObject.put("img",commentTree.getUser().getUserImage());
            jsonObject.put("replyName",commentTree.getUser().getUserName());
            jsonObject.put("beReplyName","");
            jsonObject.put("content",commentTree.getContent());
            jsonObject.put("time",commentTree.getCreateTime());
            jsonObject.put("address","");
            jsonObject.put("osname","");
            jsonObject.put("browse","");
            if(commentTree.getList()!=null&&commentTree.getList().size()!=0)
                jsonObject.put("replyBody",addCommentItem(commentTree.getList()));
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}
