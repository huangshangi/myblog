package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.CommentService;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @Autowired
    ArticleService articleService;


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

        Article article=articleService.getArticleById(comment.getArticleId());
        User user=userService.getUserInfo(article.getArticleUserId());
        if(commentService.insertComment(comment)==1){
            res.put("result",1);

            //更新评论数信息
            article.setArticleCommentCount(article.getArticleCommentCount()+1);
            user.setCommentCount(user.getCommentCount()+1);

            articleService.updateArticle(article);
            userService.updateUser(user);
        }

        else
            res.put("result",0);
        return res.toString();

    }


    @RequestMapping(value = "/admin/comment",method = RequestMethod.GET)
    public String getCommentList(HttpServletRequest request, Model model){

        User user=(User)request.getSession().getAttribute("user");

        List<Comment> list=commentService.getCommentsList(user.getUserId(),1,10);



        int count=userService.getCommentCount(user.getUserId());

        model.addAttribute("commentList",list);
        model.addAttribute("count",count);

        return "admin/comment-list";
    }

    @RequestMapping(value = "/admin/comment",method = RequestMethod.POST)
    @ResponseBody
    public String getCommentList(HttpServletRequest request,@RequestParam(value = "page",required = true,defaultValue = "1")int page,@RequestParam(
            value = "pageSize",required = false,defaultValue = "10")int pageSize){

        User user=(User)request.getSession().getAttribute("user");



        return commentService.getCommentsJSON(user.getUserId(),page,pageSize).toJSONString();

    }

    @RequestMapping(value = "/comment/delete",method = RequestMethod.POST)
    @ResponseBody
    public String deleteComment(@RequestParam(value="id")int id){
        JSONObject res=new JSONObject();
        if(commentService.deleteCommentById(id)==1)
            res.put("result",1);
        else
            res.put("result",0);

        return res.toString();
    }

    @RequestMapping(value = "/comment/deletes",method = RequestMethod.POST)
    @ResponseBody
    public String deleteComments(@RequestParam(value="ids")List<Integer> ids){
        JSONObject res=new JSONObject();
        if(commentService.deleteCommentsById(ids)==1)
            res.put("result",1);
        else
            res.put("result",0);

        return res.toString();
    }

}
