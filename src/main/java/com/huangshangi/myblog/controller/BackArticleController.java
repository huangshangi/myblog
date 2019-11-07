package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BackArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;


    @RequestMapping(value = "/admin/article",method = RequestMethod.GET)
    public String getArticlePage(HttpServletRequest request, Model model){

        User user= (User) request.getSession().getAttribute("user");
        //获取某位用户文章信息
        List<Article> articleList=articleService.getArticlesByName(user.getUserId(),1,10);

        model.addAttribute("articleList",articleList);

        return "admin/table-list";
    }

    @RequestMapping(value = "/admin/article",method = RequestMethod.POST)
    public String getArticlePage(HttpServletRequest request, @RequestParam(required = false,defaultValue = "1")int page,
                                 @RequestParam(required = false,defaultValue = "10")int pageSize,Model model){
        User user= (User) request.getSession().getAttribute("user");

        List<Article>articleList=articleService.getArticlesByName(user.getUserId(),page,pageSize);

        model.addAttribute("articleList",articleList);

        return "admin/table-list";
    }

    @RequestMapping(value = "/article/delete",method=RequestMethod.POST)
    public void deleteArticles(@RequestParam(value = "postData",required = true)int postData){
       articleService.deleteArticleById(postData);

    }

    @RequestMapping(value = "/article/deletes",method = RequestMethod.POST)
    @ResponseBody
    public void deleteArticles(@RequestBody ArrayList<Integer> ids){
        articleService.deleteArticlesByIds(ids);
    }


    @RequestMapping(value = "/article/edit")
    public String editArticle(){

        return "admin/newArticle";
    }

    @RequestMapping(value = "/article/submit")
    @ResponseBody
    public void submitArticle(@RequestBody Article article){

        articleService.submitArticle(article);


    }


}
