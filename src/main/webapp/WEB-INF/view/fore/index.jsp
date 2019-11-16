<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huangshangi
  Date: 2019/11/9
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>博客前台</title>
    <meta name="keywords" content="关键词,关键词,关键词,关键词,5个关键词" />
    <meta name="description" content="网站简介，不超过80个字" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/index.css" rel="stylesheet">
    <script src="/js/jquery.min.js" ></script>
    <script src="/js/comm.js" ></script>
    <!--[if lt IE 9]>
    <script src="/js/modernizr.js"></script>
    <![endif]-->
</head>
<body>
<%@include file="slider.jsp" %>
<div class="main-content">
    <div class="welcome"> 您好，欢迎您访问我们的官方网站！ </div>
    <div class="picbox">
        <h2 class="pictitle"><a href="/">轮播图</a></h2>
        <!--box begin-->
        <div class="Box_con"> <span class="btnl btn" id="btnl"></span> <span class="btnr btn" id="btnr"></span>
            <div class="conbox" id="BoxUl">
                <ul>
                    <c:choose>
                        <c:when test="${randomList!=null}">
                            <c:forEach items="${randomList}" var="item">

                                <li class="cur"><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><img src="http://www.yangqq.com/d/file/news/life/2018-04-27/762f99f369ae786f970477feeb3b9d77.jpg" alt=""/>
                                    <p>${item.articleTitle}</p>
                                </a>
                                </li>
                            </c:forEach>

                        </c:when>

                    </c:choose>


                </ul>
            </div>
        </div>
        <!--box end-->
    </div>
    <div class="newsbox">
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>编程语言</b></h2>
                <ul>
                    <c:choose>
                        <c:when test="${yuyanList!=null}">
                            <c:forEach items="${yuyanList}" var="item">

                                <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                            </c:forEach>
                        </c:when>

                    </c:choose>


                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>计算机科学</b></h2>
                <ul>
                    <c:choose>
                        <c:when test="${kexueList!=null}">
                            <c:forEach items="${kexueList}" var="item">

                                <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                            </c:forEach>
                        </c:when>

                    </c:choose>

                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>框架与实战</b></h2>
                <ul>
                    <c:choose>
                        <c:when test="${shizhanList!=null}">
                            <c:forEach items="${shizhanList}" var="item">

                                <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                            </c:forEach>
                        </c:when>

                    </c:choose>

                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>资源与知识</b></h2>
                <ul>
                    <c:choose>
                        <c:when test="${zhishiList!=null}">
                            <c:forEach items="${zhishiList}" var="item">

                                <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                            </c:forEach>
                        </c:when>

                    </c:choose>

                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>其他技术</b></h2>
                <ul>
                    <c:choose>
                        <c:when test="${jishuList}!=null}">
                            <c:forEach items="${jishuList}" var="item">

                                <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                            </c:forEach>
                        </c:when>
                    </c:choose>

                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计心得</b></h2>
                <ul>
                    <c:choose>
                        <c:when test="${dailyList!=null}">
                            <c:forEach items="${dailyList}" var="item">

                                <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                            </c:forEach>
                        </c:when>

                    </c:choose>

                </ul>
            </div>
        </section>
    </div>
    <div class="blank"></div>
    <div class="links">
        <h2 class="linktitle">合作伙伴</h2>

        <ul class="link-text">
            <li><a href="http://www.yangqq.com">myblog</a></li>
            <li><a href="http://www.yangqq.com">myblog</a></li>
            <li><a href="http://www.yangqq.com">myblog</a></li>
            <li><a href="http://www.yangqq.com">myblog</a></li>
            <li><a href="http://www.yangqq.com">myblog</a></li>
        </ul>
    </div>
    <div class="copyright">
        <p>Copyright 2019I <a href="/">myblog</a></p>
    </div>
</div>

<a href="#" class="cd-top cd-is-visible">Top</a>
</body>
</html>
