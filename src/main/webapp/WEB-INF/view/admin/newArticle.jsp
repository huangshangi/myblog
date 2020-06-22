<%@ page import="com.huangshangi.myblog.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: huangshangi
  Date: 2019/11/7
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>写文章</title>
    <link rel="stylesheet" href="/plugin/editormd/examples/css/style.css" />
    <link rel="stylesheet" href="/plugin/editormd/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <style type="text/css">

        .title{
            width: 50%;
            margin-left:150px;

            line-height: 2.5em;
            padding-left:5px;
            background-color: #fff;
        }

        .btn_save{
            margin-right: 16px;
            padding: 0 16px;
            font-size: 16px;
            color:#ca0c16;
            border: 1px solid #ca0c16;
            border-radius: 4px;
            white-space: nowrap;
            background-color:#fff;
            cursor: pointer;
            height:2em;
            right:7em;
            position:absolute;
        }

        .btn_pub{
            padding: 0 16px;
            font-size: 16px;
            color:#fff;
            border: none;
            border-radius: 4px;
            white-space: nowrap;
            background-color:#ca0c16;
            cursor: pointer;
            height:2em;
            width:6em;
            right:0px;
            position:absolute;
        }
    </style>

</head>
<body>
<div id="layout">
    <header style="position:relative;">
        <select style="width:150px;height:2.5em;" id="select">
            <option value="0" disabled selected>请选择文章类别</option>
            <option value="1">编程语言</option>
            <option value="2">计算机科学</option>
            <option value="3">框架与实战</option>
            <option value="4">资源与知识</option>
            <option value="5">其他技术</option>
            <option value="6">日常生活</option>
        </select>
        <input class="title" placeholder="请输入标题"></input>

        <button class="btn_pub" onclick="submitArticle()">发布文章</button>
    </header>

    <div id="test-editormd">
                <textarea id="articleContent" style="display:none;">
				</textarea>
    </div>
</div>
<script src="/plugin/editormd/examples/js/jquery.min.js"></script>
<script src="/plugin/editormd/editormd.js"></script>
<script type="text/javascript">
    var testEditor;

    function submitArticle(){
        var style=$('#select').val()
        var title=$('.title').val();
        var content= $("#articleContent").val();
        var userId=<%=((User)session.getAttribute("user")).getUserId() %>;
        var createTime=getCurrentDate(2);
        var updateTime=getCurrentDate(2);
        var summary=content.substr(0,100);
        var data={'articleUserId':userId,'articleTitle':title,'articleContent':content,'articleCreateTime'
        :createTime,'articleUpdateTime':updateTime,'articleSummary':summary,'articleStatus':style}

        if(style==""||title==""||content==""){
            layer.msg("请填写完整文章信息")
            return
        }
        $.ajax({
            type:'POST',
            url:'/article/submit',
            dataType: 'json',
            contentType: 'application/json;charset=utf-8',
            data:JSON.stringify(data),
            success:function (result) {
                layer.msg('文章提交成功')
                $('#select').val("")
                $('.title').val("");
                $("#articleContent").val("");
            },
            error:function (e) {
                console.log(e.status)
                console.log(e.responseText)
            }
        })

    }

    function getCurrentDate(format) {
        var now = new Date();
        var year = now.getFullYear(); //得到年份
        var month = now.getMonth();//得到月份
        var date = now.getDate();//得到日期
        var day = now.getDay();//得到周几
        var hour = now.getHours();//得到小时
        var minu = now.getMinutes();//得到分钟
        var sec = now.getSeconds();//得到秒
        month = month + 1;
        if (month < 10) month = "0" + month;
        if (date < 10) date = "0" + date;
        if (hour < 10) hour = "0" + hour;
        if (minu < 10) minu = "0" + minu;
        if (sec < 10) sec = "0" + sec;
        var time = "";
        //精确到天
        if(format==1){
            time = year + "-" + month + "-" + date;
        }
        //精确到分
        else if(format==2){
            time = year + "-" + month + "-" + date+ " " + hour + ":" + minu + ":" + sec;
        }
        return time;
    }

    $(function() {
        testEditor = editormd("test-editormd", {
            width           : "90%",
            autoHeight      : true,
            path            : "/plugin/editormd/lib/",
            htmlDecode      : "style,script,iframe",
            tex             : true,
            emoji           : true,
            taskList        : true,
            flowChart       : true,
            sequenceDiagram : true,
            previewTheme : "dark",
            imageUpload          : true,          // Enable/disable upload
            imageFormats         : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL       : "/upload",             // Upload url

        });


    });
</script>
</body>
</html>