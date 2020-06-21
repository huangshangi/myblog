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
    <link rel="stylesheet" href="/plugin/layui/css/layui.css"  media="all">
</head>
<body>


<header>
    <div class="logo">myblog</div>
    <div class="top-nav">
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="nav">
            <li><a href="/index">网站首页</a></li>
            <li><a href="/articleList/1/1">编程语言</a></li>
            <li><a href="/articleList/2/1">计算机科学</a></li>
            <li><a href="/articleList/3/1">框架与实战</a></li>
            <li><a href="/articleList/4/1">资源与知识</a></li>
            <li><a href="/articleList/5/1">其他技术</a></li>
            <li><a href="/articleList/6/1">日常生活</a></li>
            <li><a href="/contactus">留言板</a></li>
        </ul>
    </div>

    <c:choose>
        <c:when test="${sessionScope.user!=null}">
            <a name="show" href="/admin" style="color:white;margin-left:400px;" alt="我的后台">${sessionScope.user.userName}</a>
        </c:when>
        <c:otherwise>
            <a name="show" href="/login" style="color:white;margin-left:400px;" >登录/注册</a>

        </c:otherwise>
    </c:choose>


</header>

<aside class="side">
    <div class="about"> <i><a href="/images/avatar.jpg"><img src="/images/avatar.jpg"></a></i>
        <p>关于站长的介绍</p>
    </div>
    <div class="weixin"> <img src="http://www.yangqq.com/skin/html/images/wx.jpg">
        <p>关注我 么么哒！</p>
    </div>
</aside>

</body>
<script src="/plugin/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use("layer",function(){
        var $ = layui.jquery, layer = layui.layer;
    })
</script>

</html>