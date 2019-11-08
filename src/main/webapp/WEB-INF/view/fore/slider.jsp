<%--
  Created by IntelliJ IDEA.
  User: huangshangi
  Date: 2019/11/8
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="lib/layui/css/layui.css"  media="all">
</head>
<body>


<header>
    <div class="logo">myblog</div>
    <div class="top-nav">
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="nav">
            <li><a href="index.jsp">网站首页</a></li>
            <li><a href="articleList.jsp">编程语言</a></li>
            <li><a href="/2">计算机科学</a></li>
            <li><a href="/3">框架与实战</a></li>
            <li><a href="/4">资源与知识</a></li>
            <li><a href="/5">其他技术</a></li>
            <li><a href="/5">关于我</a></li>
            <li><a href="/5">留言</a></li>
        </ul>
    </div>
    <div class="search">
        <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
            <input name="keyboard" id="keyboard" class="input_text" value="搜索你喜欢的" style="color: rgb(153, 153, 153);" onfocus="if(value=='搜索你喜欢的'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='搜索你喜欢的'}" type="text">
            <input name="show" value="title" type="hidden">
            <input name="tempid" value="1" type="hidden">
            <input name="tbname" value="news" type="hidden">
            <input name="Submit" class="input_submit" value="" type="submit">
        </form>
    </div>
</header>

<aside class="side">
    <div class="about"> <i><a href="/"><img src="assets/images/avatar.jpg"></a></i>
        <p>关于站长的介绍</p>
    </div>
    <div class="weixin"> <img src="http://www.yangqq.com/skin/html/images/wx.jpg">
        <p>关注我 么么哒！</p>
    </div>
</aside>

</body>
<script src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use("layer",function(){
        var $ = layui.jquery, layer = layui.layer;
    })
</script>

</html>