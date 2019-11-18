<%--
  Created by IntelliJ IDEA.
  User: huangshangi
  Date: 2019/11/18
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>网站标题</title>
    <meta name="keywords" content="关键词,关键词,关键词,关键词,5个关键词" />
    <meta name="description" content="网站简介，不超过80个字" />
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/form-elements.css">
    <link rel="stylesheet" href="/css/style.css">
    <link href="/css/index.css" rel="stylesheet">
    <script src="/js/jquery.min.js" ></script>

    <!--[if lt IE 9]>
    <script src="/js/modernizr.js"></script>
    <![endif]-->
</head>
<body>
<%@include file="slider.jsp" %>
<div class="main-content">
    <!-- Top content -->
    <div class="top-content">

        <div class="inner-bg">
            <div class="container">

                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>与我联系</h3>
                                <p>请在留言板中填写信息:</p>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-envelope"></i>
                            </div>
                        </div>
                        <div class="form-bottom contact-form">
                            <form id="form" role="form" action="/contactus" method="post" onsubmit="Verify();">
                                <div class="form-group">
                                    <label class="sr-only" for="contact-email">邮箱</label>
                                    <input type="text" name="email" placeholder="邮箱地址..." class="contact-email form-control" id="contact-email">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="contact-name">昵称</label>
                                    <input type="text" name="subject" placeholder="昵称..." class="contact-subject form-control" id="contact-name">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="contact-message">信息</label>
                                    <textarea name="message" placeholder="留言信息..." class="contact-message form-control" id="contact-message"></textarea>
                                </div>
                                <button type="submit" class="btn">留言</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>



</div>
<!-- Javascript -->

<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.backstretch.min.js"></script>
<script src="/js/retina-1.1.0.min.js"></script>
<script src="/js/scripts.js"></script>

<script>

    function Verify(){

        var email=$('#contact-email').val();
        var name=$('#contact-name').val();
        var message=$('#contact-message').val();

        if(email==null||name==null||message==null){
            layer.msg('请将留言信息填写完整');
            return false;
        }



        return true;
    }


    $('#form').submit(function (e) {
        e.preventDefault();
        var obj=new Object();

        obj.email=$('#contact-email').val();
        obj.name=$('#contact-name').val();
        obj.message=$('#contact-message').val();

        $.ajax({
            method:'POST',
            url:'/contactus',
            contentType:"application/json",
            data:JSON.stringify(obj),
            success:function (res) {
                var json=JSON.parse(res);
                if(Number(json.result)==1){
                   layer.msg('留言信息提交成功,感谢您的关注')
                }
                else
                    layer.msg('网络异常,请稍后重试')
            }
        })

    })

</script>

</body>
</html>
