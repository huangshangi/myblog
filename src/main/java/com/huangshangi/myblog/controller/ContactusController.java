package com.huangshangi.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactusController {

    @RequestMapping(value = "/contactus")
    public String getContactPage(){

        return "fore/contactus";
    }
}
