package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.UserService;
import com.huangshangi.myblog.utils.OperationAnnoation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PersonInfoController {

    @Autowired
    UserService userService;
    @OperationAnnoation(name="修改密码")
    @RequestMapping(value = "/admin/person")
    public String getPsersonPage(){
        return "admin/personInfo";
    }

    @OperationAnnoation(name="修改密码")
    @RequestMapping(value = "/admin/changeP")
    public String getChangePassPage(){
        return "admin/modifyPassword";
    }


    @OperationAnnoation(name="修改密码")
    @RequestMapping(value = "/admin/changeP",method = RequestMethod.POST)
    @ResponseBody
    public String changePass(HttpServletRequest request, @RequestBody String data){

        JSONObject jsonObject=JSONObject.parseObject(data);

        JSONObject resJson=new JSONObject();

        User user=(User)request.getSession().getAttribute("user");

        int res=userService.changePass(user.getUserId(),jsonObject.getString("oldpass"),jsonObject.getString("newpass"));

        resJson.put("result",res);

        return resJson.toString();
    }
}
