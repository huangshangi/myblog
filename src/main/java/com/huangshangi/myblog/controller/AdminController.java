package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Article;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import com.huangshangi.myblog.utils.util;
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
        List<Integer>userSampList=articleService.getUserSampInfos(user.getUserId());

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

    @RequestMapping(value = "/register")
    public String getRegisterPage(){
        return "fore/register";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public String addRegister(HttpServletRequest request,@RequestBody String data){

        JSONObject res=new JSONObject();

        JSONObject jsonObject=JSONObject.parseObject(data);

        User use=userService.getUserByNameOrEmail((String)jsonObject.get("username"));

        if(use!=null){
            res.put("result",0);

            return res.toJSONString();
        }

        User user=new User();

        user.setUserName((String)jsonObject.get("username"));

        user.setUserPass((String)jsonObject.get("password"));

        user.setUserEmail((String)jsonObject.get("email"));

        user.setUserImage("https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=300591b04910b912abccfeaca2949766/d043ad4bd11373f07f16b994aa0f4bfbfbed0494.jpg");

        user.setUserRegisterTime(util.getDay());

        user.setUserLastTime(util.getDay());

        user.setUserIp(util.getIpAddr(request));





        res.put("result",userService.insertUser(user));

        return res.toJSONString();
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String getLoginPage(){

        return "fore/login";
    }

    @RequestMapping(value = "/loginVerify",method = RequestMethod.POST)
    @ResponseBody
    public String LoginVerify(HttpServletRequest request,@RequestParam(value = "username")String username,@RequestParam(value = "password")String password){

        JSONObject jsonObject=new JSONObject();

        User user=userService.getUserByNameOrEmail(username);

        if(user.getUserPass().equals(password)){
            jsonObject.put("result",1);
            request.getSession().setAttribute("user",user);
        }
        else
            jsonObject.put("result",0);

        return jsonObject.toString();
    }


}
