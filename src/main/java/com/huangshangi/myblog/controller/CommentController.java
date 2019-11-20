package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.CommentService;
import com.huangshangi.myblog.utils.util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CommentController {

    @Autowired
    CommentService commentService;


    @RequestMapping(value = "/addComment",method = RequestMethod.POST)
    @ResponseBody
    public String addComment(@RequestBody String data){

        JSONObject res=new JSONObject();
        //将评论信息进行解析
        JSONObject jsonObject=JSONObject.parseObject(data);
        Comment comment=new Comment();
        comment.setArticleId((int)jsonObject.get("articleId"));
        comment.setContent((String)jsonObject.get("content"));
        comment.setUid((int)jsonObject.get("uid"));
        comment.setCreateTime(util.getTime());
        comment.setParentId((int)jsonObject.get("parentId"));

        if(commentService.insertComment(comment)==1)
            res.put("result",1);
        else
            res.put("result",0);
        return res.toString();

    }


    @RequestMapping(value = "/commentList",method = RequestMethod.GET)
    public String getCommentList(HttpServletRequest request, Model model){

        User user=(User)request.getSession().getAttribute("user");

        commentService.getCommentsJSON()
    }



}
