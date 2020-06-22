package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.Operation;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.OperationService;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.OperationAnnoation;
import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import com.huangshangi.myblog.utils.util;
@Controller
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    ArticleService articleService;

    @Autowired
    OperationService operationService;


    @OperationAnnoation(name="查看后台")
    @RequestMapping(value = "/admin")
    public String getAdminIndex(HttpServletRequest request, Model model){

        User user= (User) request.getSession().getAttribute("user");
        //获取用户简略信息(文章数 游览量 评论量)
        List<Integer>userSampList=articleService.getUserSampInfos(user.getUserId());

        //获取排行榜(基于文章发表数)
        List<User>rankList=userService.getUserList();
        //获取新注册用户信息表
        List<User>registerList=userService.getRegisterList();

        //获取操作日志
        List<Operation>operationList=operationService.getOperations(user.getUserId(),8);

        model.addAttribute("userSampList",userSampList);
        model.addAttribute("rankList",rankList);
        model.addAttribute("registerList",registerList);
        model.addAttribute("operationList",operationList);

        return "admin/index";

    }

}
