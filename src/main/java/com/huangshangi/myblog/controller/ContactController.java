package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.ContactMessage;
import com.huangshangi.myblog.service.ContactService;
import com.huangshangi.myblog.utils.util;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ContactController {

    @Autowired
    ContactService contactService;

    @RequestMapping(value = "/contactus",method = RequestMethod.GET)
    public String getContactUsPage(){

        return "fore/contactus";
    }

    @RequestMapping(value = "/contactus",method = RequestMethod.POST)
    @ResponseBody
    public String getContactMessage(@RequestBody String data){

        JSONObject request=JSONObject.parseObject(data);
        JSONObject jsonObject=new JSONObject();

        ContactMessage contactMessage=new ContactMessage();
        contactMessage.setContactEmail(request.getString("email"));
        contactMessage.setContactName(request.getString("name"));
        contactMessage.setContactMessage(request.getString("message"));
        contactMessage.setContactTime(util.getTime());

        if(contactService.insertMessage(contactMessage)!=0)
            jsonObject.put("result",1);
        else
            jsonObject.put("result",0);

        return jsonObject.toString();

    }
}
