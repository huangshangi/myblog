package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/article")
public class BackArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;


    @RequestMapping(value = "",method = RequestMethod.GET)
    public String getArticlePage(HttpServletRequest request, Model model){

        User user= (User) request.getSession().getAttribute("user");
        //获取某位用户文章信息
        List<Article> articleList=articleService.getArticlesByName(user.getUserName(),1,10);

        model.addAttribute("articleList",articleList);

        return "admin/table-list";
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    public String getArticlePage(HttpServletRequest request, @RequestParam(required = false,defaultValue = "1")int page,
                                 @RequestParam(required = false,defaultValue = "10")int pageSize,Model model){
        User user= (User) request.getSession().getAttribute("user");

        List<Article>articleList=articleService.getArticlesByName(user.getUserName(),page,pageSize);

        model.addAttribute("articleList",articleList);

        return "admin/table-list";
    }

    @RequestMapping(value = "/delete",method=RequestMethod.POST)
    public void deleteArticles(@RequestParam(value = "postData",required = true)String postData){
        articleService.deleteArticlesByIds(postData);

    }

    @RequestMapping(value = "/submit")
    public String submitArticle(){

        return null;
    }

}
