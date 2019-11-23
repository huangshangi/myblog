package com.huangshangi.myblog.controller;

import com.huangshangi.myblog.entity.User;
import com.huangshangi.myblog.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller

public class FileController {

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public String commUploadC(HttpServletRequest request,@RequestPart("file") MultipartFile uploadFileC,@RequestParam(value = "type",
            required = false,defaultValue = "0") int type) {
        User user=(User)request.getSession().getAttribute("user");
        JSONObject json = new JSONObject();
        String filename=uploadFileC.getOriginalFilename();
        String s=File.separator;
        String basePath=request.getSession().getServletContext().getRealPath("/")+"resource"+s+"assets"+s+"uploadImage"+s+user.getUserId()+s;
        String path="http://localhost:8080/uploadImage/"+user.getUserId()+"/"+filename;
        System.out.println(basePath);
        try {
            File file=new File(basePath);
            if(!file.exists())
                file.mkdirs();
            File imageFile = new File(basePath+filename);// 上传后的文件保存目录及名字

            if(!imageFile.exists())
                imageFile.createNewFile();
            uploadFileC.transferTo(imageFile);// 将上传文件保存到相应位置
            if(type==1){
                user.setUserImage(path);
                userService.updateUser(user);
                request.getSession().setAttribute("user",user);

            }

            json.put("success", 1);
            json.put("message","sucess");
            json.put("url",path);
            return json.toString();
        } catch (Exception e) {
            json.put("success", 0);
            json.put("message","fail");

            e.printStackTrace();
            return json.toString();
        }
    }

}
