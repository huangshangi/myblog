package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.entity.User;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller

public class FileController {


    @ResponseBody
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public JSONObject commUploadC(HttpServletRequest request,@RequestPart("uploadFileC") MultipartFile uploadFileC) {
        User user=(User)request.getSession().getAttribute("user");
        JSONObject json = new JSONObject();
        String filename=uploadFileC.getName();

        try {
            File imageFile = new File("c:/upload/"+user.getUserId()+"/"+filename);// 上传后的文件保存目录及名字
            uploadFileC.transferTo(imageFile);// 将上传文件保存到相应位置
            json.put("success", 1);
            json.put("message","图片上传成功");
            json.put("url","chenggong");
            return json;
        } catch (Exception e) {
            json.put("success", 0);
            json.put("message",e.getStackTrace());
            json.put("url","shibai");
            e.printStackTrace();
            return json;
        }
    }

}
