package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.enums.Contant;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.CommentService;
import com.huangshangi.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class ArticleListController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;


    //分类界面
    @RequestMapping(value = "/articleList/{category}",method = RequestMethod.GET)
    public String getArticlesCategory(@PathVariable int category, Model model){

        model.addAttribute("articleList",articleService.getListByCategory(category,6,1));

        return "forward:/articleList/"+category+"/1 ";
    }

    //分类界面下的分页界面
    @RequestMapping(value = "/articleList/{category}/{pageId}",method = RequestMethod.GET)
    public String getArticlesCategoryByPage(@PathVariable(value = "category")int category,@PathVariable(value = "pageId")int pageId,Model model ){

        model.addAttribute("articleList",articleService.getListByCategory(category,6,pageId));

        //获取文章排行信息
        model.addAttribute("rankList",articleService.getRankList());
        //获取本栏推荐信息
        model.addAttribute("recommendList",articleService.getRecommendList());
        //获取文章推荐信息
        model.addAttribute("headRecommendList",articleService.getHeadRecommendList(category));

        //获取本分类下文章分页数
        model.addAttribute("articlePage",articleService.getArticlePageByCategory(category,6));

        //面包屑常量

        model.addAttribute("contant", Contant.list.get(category-1));

        return "fore/articleList";

    }
}
