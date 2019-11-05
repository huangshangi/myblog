package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    ArticleService articleService;

    @RequestMapping(value = "/admin")
    public String getAdminIndex(HttpServletRequest request, Model model){

        User user= (User) request.getSession().getAttribute("user");
        //获取用户简略信息(文章数 游览量 评论量)
        List<Integer>userSampList=articleService.getUserSampInfos(user.getUserName());

        //获取排行榜(基于文章发表数)
        List<User>rankList=userService.getUserList();
        //获取新注册用户信息表
        List<User>registerList=userService.getRegisterList();
        //获取操作日志

        model.addAttribute("userSampList",userSampList);
        model.addAttribute("rankList",rankList);
        model.addAttribute("registerList",registerList);

        return "admin/index";

    }


}
