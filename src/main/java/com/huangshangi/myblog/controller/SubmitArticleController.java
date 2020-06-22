package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SubmitArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;




    @RequestMapping(value = "/article/newArticle")
    public String newArticle(){

        return "admin/newArticle";
    }


    @RequestMapping(value = "/article/submit",method = RequestMethod.POST)
    @ResponseBody
    public String submitArticle(@RequestBody String data){

        JSONObject jsonObject=JSONObject.parseObject(data);
        JSONObject res=new JSONObject();
        Article article=new Article();
        article.setArticleUserId(jsonObject.getInteger("articleUserId"));
        article.setArticleTitle(jsonObject.getString("articleTitle"));
        article.setArticleContent(jsonObject.getString("articleContent"));
        article.setArticleCreateTime(jsonObject.getString("articleCreateTime"));
        article.setArticleUpdateTime(jsonObject.getString("articleUpdateTime"));
        article.setArticleSummary(jsonObject.getString("articleSummary"));
        article.setArticleStatus(Integer.parseInt(jsonObject.getString("articleStatus")));

        int result=articleService.submitArticle(article);

        res.put("result",1);

        User user=userService.getUserInfo(article.getArticleUserId());
        user.setArticleCount(user.getArticleCount()+1);
        userService.updateUser(user);

        return res.toString();
    }

    @RequestMapping(value = "/article/edit",method = RequestMethod.POST)
    public String editArticle(@RequestParam(value = "id") int id, Model model){

        Article article=articleService.getArticleById(id);
        model.addAttribute("article",article);

        return "admin/newArticle";
    }

}
