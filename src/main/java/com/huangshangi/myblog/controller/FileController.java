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
    public String commUploadC(HttpServletRequest request,@RequestPart("file") MultipartFile uploadFileC) {
        User user=(User)request.getSession().getAttribute("user");
        JSONObject json = new JSONObject();
        String filename=uploadFileC.getOriginalFilename();
        String s=File.separator;
        String basePath=request.getSession().getServletContext().getRealPath("/")+"resource"+s+"assets"+s+"uploadImage"+s;
        System.out.println(basePath);
        try {
            File file=new File(basePath);
            if(!file.exists())
                file.mkdirs();
            File imageFile = new File(basePath+filename);// 上传后的文件保存目录及名字
            System.out.println(imageFile.getAbsolutePath());
            if(!imageFile.exists())
                imageFile.createNewFile();
            uploadFileC.transferTo(imageFile);// 将上传文件保存到相应位置
            json.put("success", 1);
            json.put("message","sucess");
            json.put("url","chenggong");
            return json.toString();
        } catch (Exception e) {
            json.put("success", 0);
            json.put("message","fail");

            e.printStackTrace();
            return json.toString();
        }
    }

}
