<%--
  Created by IntelliJ IDEA.
  User: huangshangi
  Date: 2019/11/15
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>注册界面</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="/css/util.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" href="/plugin/layui/css/layui.css"  media="all">
</head>

<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('/images/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <div class="login100-form validate-form" method="post">
                <span class="login100-form-title p-b-49">注册</span>

                <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                    <span class="label-input100">用户名</span>
                    <input id="username" class="input100" type="text" name="username" placeholder="请输入用户名" autocomplete="off">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>


                <div class="wrap-input100 validate-input m-b-23" data-validate="请输入邮箱">
                    <span class="label-input100">邮箱</span>
                    <input id="email" class="input100" type="text" name="email" placeholder="请输入邮箱" autocomplete="off">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码">
                    <span class="label-input100">密码</span>
                    <input id="password1" class="input100" type="password" name="password" placeholder="请输入密码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码" style="margin-top:30px;">
                    <span class="label-input100">密码</span>
                    <input id="password2" class="input100" type="password" name="password" placeholder="请输入密码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <div class="container-login100-form-btn" style="margin-top:50px;">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" onclick="register()" >注 册</button>
                    </div>
                </div>



            </div>
        </div>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/main.js"></script>
<script src="/plugin/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use("layer",function(){
        var $ = layui.jquery, layer = layui.layer;
    })

    function register() {

        var username=$("#username").val();
        var email=$("#email").val();
        var password1=$('#password1').val();
        var password2=$('#password2').val();
        if(username==''||email==''||password1==''||password2==''){
            layer.msg('字段不能为空')
            return
        }else if(password1!=password2) {
            layer.msg('两次输入的密码不一致')
            return;
        }

        var data={'username':username,'email':email,'password':password1};

        console.log(JSON.stringify(data))
        $.ajax({
            method:'POST',
            url:'/register',
            contentType:"application/json",
            data:JSON.stringify(data),
            success:function (res) {
                var json=JSON.parse(res)
                console.log( typeof json)
                if(Number(json.result)==1)
                    window.location.href="/login";
                else
                    layer.msg('该用户名已被注册')
            }

        })
    }



</script>

</body>

</html>