package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.Comment;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.enums.Contant;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.CommentService;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.OperationAnnoation;
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



    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String getForeIndex(Model model){
        String []array={"yuyanList","kexueList","shizhanList","zhishiList","jishuList","dailyList"};

        model.addAttribute("randomList",articleService.getRandomList(8));

        for(int i=1;i<7;i++)
            model.addAttribute(array[i-1],articleService.getListByCategory(i,8,1));





        return "fore/index";
    }





}
