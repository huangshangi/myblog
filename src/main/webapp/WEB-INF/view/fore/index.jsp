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
                    <li class="cur">
                        <a href="/"><img src="http://www.yangqq.com/d/file/news/humor/2014-01-13/67ce0f90b72e884e562d3360575ab3c3.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站1</p>
                    </a> </li>
                    <li class="cur"><a href="/"><img src="http://www.yangqq.com/d/file/news/life/2018-04-27/762f99f369ae786f970477feeb3b9d77.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站2</p>
                    </a> </li>
                    <li class="cur"><a href="/"><img src="http://www.yangqq.com/d/file/news/life/2018-06-17/917d732926d79cc2ae1012831ce51d1e.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站3</p>
                    </a> </li>
                    <li class="cur"><a href="/"><img src="http://www.yangqq.com/d/file/jstt/bj/2018-06-29/3f0b6da48a6fd4e626a021ff7bd0d74f.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站4</p>
                    </a> </li>
                    <li class="cur"><a href="/"><img src="http://www.yangqq.com/d/file/news/life/2018-06-29/75842f4d1e18d692a66c38eb172a40ab.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站5</p>
                    </a> </li>
                    <li class="cur"><a href="/"><img src="http://www.yangqq.com/d/file/news/s/2014-06-14/072f267a54748c6e71d40a2d03978993.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站6</p>
                    </a> </li>
                    <li class="cur"><a href="/"><img src="http://www.yangqq.com/d/file/blogs/2018-08-22/28e3bbca2ae0205f641a9072ecb7c100.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站7</p>
                    </a> </li>
                    <li class="cur"><a href="/"><img src="http://www.yangqq.com/d/file/blogs/2018-08-17/3ee0644472fa8556562ab3d8716b5316.jpg" alt=""/>
                        <p>如何快速建立自己的个人博客网站8</p>
                    </a> </li>
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
                    <c:when test="${yuyanList!=null}">
                        <c:forEach items="${yuyanList}" var="item">

                            <li><a href="/checkArticle/"+${item.articleId}><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>

                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>计算机科学</b></h2>
                <ul>
                    <c:when test="${kexueList!=null}">
                        <c:forEach items="${kexueList}" var="item">

                            <li><a href="/checkArticle/"+${item.articleId}><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>
                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>框架与实战</b></h2>
                <ul>
                    <c:when test="${shizhanList!=null}">
                        <c:forEach items="${shizhanList}" var="item">

                            <li><a href="/checkArticle/"+${item.articleId}><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>
                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>资源与知识</b></h2>
                <ul>
                    <c:when test="${zhishiList!=null}">
                        <c:forEach items="${zhishiList}" var="item">

                            <li><a href="/checkArticle/"+${item.articleId}><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>
                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>其他技术</b></h2>
                <ul>
                    <c:when test="${jishuList}!=null}">
                        <c:forEach items="${jishuList}" var="item">

                            <li><a href="/checkArticle/"+${item.articleId}><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>
                </ul>
            </div>
        </section>
        <section>
            <div class="news">
                <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计心得</b></h2>
                <ul>
                    <li><a href="/"><span>08-30</span>如何快速建立自己的个人博客网站</a></li>
                    <li><a href="/"><span>08-30</span>个人博客，属于我的小世界！</a></li>
                    <li><a href="/"><span>08-30</span>网易博客关闭，何不从此开始潇洒行走江湖！</a></li>
                    <li><a href="/"><span>08-30</span>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></li>
                    <li><a href="/"><span>08-30</span>帝国cms 循环调用子栏目信息以及头条图片</a></li>
                    <li><a href="/"><span>08-30</span>我是怎么评价自己的？</a></li>
                    <li><a href="/"><span>08-30</span>html5 个人博客模板《蓝色畅想》</a></li>
                    <li><a href="/"><span>08-30</span>【匆匆那些年】总结个人博客经历的这四年</a></li>
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
