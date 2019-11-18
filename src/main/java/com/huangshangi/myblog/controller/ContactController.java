package com.huangshangi.myblog.controller;

import com.alibaba.fastjson.JSONObject;
import com.huangshangi.myblog.entity.ContactMessage;
import com.huangshangi.myblog.service.ContactService;
import com.huangshangi.myblog.utils.util;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String getContactMessage(@Param(value="contact-email")String email,@Param(value = "contact-name")String name,@Param(
            value = "contact-message")String message){

        JSONObject jsonObject=new JSONObject();

        ContactMessage contactMessage=new ContactMessage();
        contactMessage.setContactEmail(email);
        contactMessage.setContactName(name);
        contactMessage.setContactMessage(message);
        contactMessage.setContactTime(util.getTime());

        if(contactService.insertMessage(contactMessage)!=0)
            jsonObject.put("result",1);
        else
            jsonObject.put("result",0);

        return jsonObject.toString();

    }
}
