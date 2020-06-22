package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.OperationAnnoation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
//后台controller
@Controller
public class CheckArticlesController {


    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @OperationAnnoation(name="查看文章")
    @RequestMapping(value = "/admin/article",method = RequestMethod.GET)
    public String getArticlePage(HttpServletRequest request, Model model){

        User user= (User) request.getSession().getAttribute("user");
        //获取某位用户文章信息
        List<Article> articleList=articleService.getArticlesByName(user.getUserId(),1,10);

        int count=userService.getArticleCount(user.getUserId());

        model.addAttribute("articleList",articleList);
        model.addAttribute("count",count);
        return "admin/table-list";
    }

    @OperationAnnoation(name="查看文章")
    @RequestMapping(value = "/admin/article",method = RequestMethod.POST)
    @ResponseBody
    public String getArticlePage(HttpServletRequest request, @RequestParam(required = false,defaultValue = "1")int page,
                                 @RequestParam(required = false,defaultValue = "10")int pageSize,Model model){
        User user= (User) request.getSession().getAttribute("user");

        List<Article>articleList=articleService.getArticlesByName(user.getUserId(),page,pageSize);

        JSONArray jsonArray=articleService.getJsonArray(articleList);

        return jsonArray.toJSONString();
    }

    @OperationAnnoation(name="查询文章列表")
    @RequestMapping(value = "/article/find",method = RequestMethod.POST)
    public String findArticlesbyKey(HttpServletRequest request, @RequestBody String param, Model model){

        User user=(User)request.getSession().getAttribute("user");
        JSONObject jsonObject=JSONObject.parseObject(param);

        int sign=(int)jsonObject.get("sign");

        String key=(String)jsonObject.get("key");

        List<Article>articleList=articleService.getArticlesBySign(user.getUserId(),sign,key);
        model.addAttribute("articleList",articleList);
        return "admin/table-list";
    }

}
