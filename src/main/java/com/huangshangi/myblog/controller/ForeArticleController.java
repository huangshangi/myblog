package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
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
public class ForeArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/checkArticle/{id}",method = RequestMethod.POST)
    public String checkArticle(@PathVariable int id, Model model){

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
        //获取本栏推荐信息
        model.addAttribute("recommendList",articleService.getRecommendList());
        //获取文章推荐信息
        model.addAttribute("headRecommendList",articleService.getHeadRecommendList(article.getArticleStatus()));
        //随便看看界面
        model.addAttribute("randomList",articleService.getRandomList());

        //获取评论列表(json)
        model.addAttribute("commentList",commentService.getCommentListJson(article.getArticleId()));

        return "fore/checkArticle";
    }
}
