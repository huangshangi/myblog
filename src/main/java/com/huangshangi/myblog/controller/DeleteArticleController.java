package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.OperationAnnoation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
public class DeleteArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @OperationAnnoation(name="文章删除")
    @RequestMapping(value = "/article/delete",method= RequestMethod.POST)
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
}
