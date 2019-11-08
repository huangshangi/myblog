package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ForeArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/checkArticle/{id}",method = RequestMethod.POST)
    public String checkArticle(@PathVariable int id, Model model){

        Article article=articleService.getArticleById(id);
        User user=userService.getUserInfo(article.getArticleUserId());

        model.addAttribute("article",article);
        model.addAttribute("articleUser",user);
        return "fore/checkArticle";
    }
}
