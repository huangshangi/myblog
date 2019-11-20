package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.enums.Contant;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.CommentService;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ForeArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/checkArticle/{category}/{id}",method = RequestMethod.GET)
    public String checkArticle(@PathVariable int category,@PathVariable int id, Model model){

        Article article=articleService.getArticleById(id);
        User user=userService.getUserInfo(article.getArticleUserId());

        //用户查看的博客具体内容
        model.addAttribute("article",article);

        //博客拥有者信息
        model.addAttribute("articleUser",user);

        //获取上一篇博客信息
        model.addAttribute("preArticle",articleService.getPreArticle(id));
        //获取下一篇博客信息
        model.addAttribute("nextArticle",articleService.getNextArticle(id));
        //获取文章排行信息
        model.addAttribute("rankList",articleService.getRankList());
        //获取文章推荐信息
        model.addAttribute("recommendList",articleService.getRecommendList());
        //获取本栏推荐信息
        model.addAttribute("headRecommendList",articleService.getHeadRecommendList(article.getArticleStatus()));
        //随便看看界面
        model.addAttribute("randomList",articleService.getRandomList(4));

        //获取评论列表(json)
        model.addAttribute("commentList",commentService.getCommentListJson(article.getArticleId()));

        //面包屑常量
        String contant="您现在的位置是：首页>"+Contant.list.get(category-1)+">正文";
        model.addAttribute("contant", contant);
        //文章类型
        model.addAttribute("category",category);
        return "fore/checkArticle";
    }



    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String getForeIndex(Model model){
        String []array={"yuyanList","kexueList","shizhanList","zhishiList","jishuList","dailyList"};

        model.addAttribute("randomList",articleService.getRandomList(8));

        for(int i=1;i<7;i++){
            model.addAttribute(array[i-1],articleService.getListByCategory(i,8,1));
            System.out.println(i);
        }



        return "fore/index";
    }

    //分类界面(多余操作 待删除)
    @RequestMapping(value = "/articleList/{category}",method = RequestMethod.GET)
    public String getArticlesCategory(@PathVariable int category,Model model){

        model.addAttribute("articleList",articleService.getListByCategory(category,6,1));

        return "fore/articleList";
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
        String contant="您现在的位置是：首页>"+Contant.list.get(category-1);
        model.addAttribute("contant", contant);

        return "fore/articleList";

    }



}
