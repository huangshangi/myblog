package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.Operation;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.ArticleService;
import com.huangshangi.myblog.service.OperationService;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.OperationAnnoation;
import com.huangshangi.myblog.utils.util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {


    @Autowired
    UserService userService;

    @Autowired
    ArticleService articleService;

    @Autowired
    OperationService operationService;




    @RequestMapping(value = "/register")
    public String getRegisterPage(){
        return "fore/register";
    }


    @OperationAnnoation(name="用户注册")
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

    @OperationAnnoation(name="用户登录")
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String LoginVerify(HttpServletRequest request,@RequestBody String data){

        JSONObject res=new JSONObject();

        JSONObject jsonObject=JSONObject.parseObject(data);
        User user=userService.getUserByNameOrEmail(jsonObject.getString("username"));

        if(user!=null&&user.getUserPass().equals(jsonObject.getString("password"))){
            res.put("result",1);
            request.getSession().setAttribute("user",user);
        }
        else
            res.put("result",0);

        return res.toString();
    }

    @OperationAnnoation(name="退出登录")
    @RequestMapping(value = "/loginout")
    public String getLoginOut(HttpSession session){
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping(value = "/changePass")
    public String changePass(){

        return null;
    }


}
