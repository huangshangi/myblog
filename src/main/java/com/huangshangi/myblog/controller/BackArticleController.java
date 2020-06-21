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

        int count=userService.getArticleCount(user.getUserId());

        model.addAttribute("articleList",articleList);
        model.addAttribute("count",count);
        return "admin/table-list";
    }


    @RequestMapping(value = "/admin/article",method = RequestMethod.POST)
    @ResponseBody
    public String getArticlePage(HttpServletRequest request, @RequestParam(required = false,defaultValue = "1")int page,
                                 @RequestParam(required = false,defaultValue = "10")int pageSize,Model model){
        User user= (User) request.getSession().getAttribute("user");

        List<Article>articleList=articleService.getArticlesByName(user.getUserId(),page,pageSize);

        JSONArray jsonArray=articleService.getJsonArray(articleList);

        return jsonArray.toJSONString();
    }

    @OperationAnnoation(name="文章删除")
    @RequestMapping(value = "/article/delete",method=RequestMethod.POST)
    @ResponseBody
    public String deleteArticles(@RequestParam(value = "postData",required = true)int postData){
        com.alibaba.fastjson.JSONObject jsonObject=new com.alibaba.fastjson.JSONObject();

       if(articleService.deleteArticleById(postData)==1)
           jsonObject.put("result",1);
       else
           jsonObject.put("result",0);
       return jsonObject.toString();

    }

    @OperationAnnoation(name="文章删除")
    @RequestMapping(value = "/article/deletes",method = RequestMethod.POST)
    @ResponseBody
    public String deleteArticles(@RequestBody ArrayList<Integer> ids)
    {
        com.alibaba.fastjson.JSONObject jsonObject=new com.alibaba.fastjson.JSONObject();

        if(articleService.deleteArticlesByIds(ids)==1)
            jsonObject.put("result",1);
        else
            jsonObject.put("result",0);
        return jsonObject.toString();

    }



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
        System.out.println("articleStatus中为"+jsonObject.getString("articleStatus"));
        int result=articleService.submitArticle(article);

        res.put("result",1);

        User user=userService.getUserInfo(article.getArticleUserId());
        user.setArticleCount(user.getArticleCount()+1);
        userService.updateUser(user);

        return res.toString();
    }

    @RequestMapping(value = "/article/edit",method = RequestMethod.POST)
    public String editArticle(@RequestParam(value = "id") int id,Model model){

        Article article=articleService.getArticleById(id);
        model.addAttribute("article",article);

        return "admin/newArticle";
    }

    @RequestMapping(value = "/article/find",method = RequestMethod.POST)
    public String findArticles(HttpServletRequest request,@RequestBody String param,Model model){

        User user=(User)request.getSession().getAttribute("user");
        JSONObject jsonObject=JSONObject.parseObject(param);

        int sign=(int)jsonObject.get("sign");

        String key=(String)jsonObject.get("key");

        List<Article>articleList=articleService.getArticlesBySign(user.getUserId(),sign,key);
        model.addAttribute("articleList",articleList);
        return "admin/table-list";
    }


}
