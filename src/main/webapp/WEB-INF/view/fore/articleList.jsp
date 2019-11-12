<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huangshangi
  Date: 2019/11/11
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>网站标题</title>
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

    <div class="welcome">您现在的位置是：首页>个人博客模板</div>
    <div class="blogbox">
        <div class="bloglist">
            <ul>

                    <c:when test="${articleList!=null}">
                        <c:forEach var="item" items="${articleList}">
                            <li>
                                <h2><a href="/checkArticle/${item.articleId}"+>${item.articleTitle}</a></h2>
                                <i><a href="/checkArticle/${item.articleId}"><img src="http://www.yangqq.com/d/file/jstt/bj/2018-06-29/3f0b6da48a6fd4e626a021ff7bd0d74f.jpg"></a></i>
                                <p class="blogtext">${item.articleSummary}</p>
                                <p class="bloginfo"><span>${item.articleUserId}</span><span>${item.articleCreateTime}</span><span>浏览量:${item.articleCheckCount}</span></p>
                            </li>
                        </c:forEach>

                    </c:when>


            </ul>
        </div>
        <div class="pagelist">
            <a >首页</a>
            <c:when test="${articlePage}!=1">
                <c:forEach begin="1" end="${articlePage}" var="item">
                    <a href="$"><c:out value="${item}"></c:out> </a>&nbsp;
                </c:forEach>
            </c:when>
            <a >下一页</a>&nbsp;
            <a >尾页</a></div>
    </div>
    <div class="rside">
        <div class="news">
            <h2 class="newstitle"><b>文章排行</b></h2>
            <ul>

                <c:when test="${rankList}!=null}">
                <c:forEach items="${rankList}" var="item">

                    <li><a href="/checkArticle/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                </c:forEach>
                </c:when>
            </ul>
        </div>
        <div class="news">
            <h2 class="newstitle"><b>本栏推荐</b></h2>
            <ul>
                <c:when test="${recommendList}!=null}">
                    <c:forEach items="${recommendList}" var="item">

                        <li><a href="/checkArticle/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                    </c:forEach>
                </c:when>
            </ul>
        </div>
        <div class="news">
            <h2 class="newstitle"><b>栏目更新</b></h2>
            <ul>
                <c:when test="${headRecommendList}!=null}">
                    <c:forEach items="${headRecommendList}" var="item">

                        <li><a href="/checkArticle/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                    </c:forEach>
                </c:when>
            </ul>
        </div>
    </div>
    <div class="copyright">
        <p>Copyright 2019<a href="/"> myblog</a></p>
    </div>
</div>

<a href="#" class="cd-top cd-is-visible">Top</a>

<script>

    var index=1;
    //为分页标签添加点击事件
    $('div.pageList a').on('click',function () {
        selected=$(this).val();
        if(selected=="首页")
            index=1;
        else if(selected=="下一页" &&index!=${articlePage})
            index=index+1;
        else if(selected=="下一页"&&index==${articlePage})
            return;
        else if(selected=="尾页")
            index=${articlePage};
        else
            index=Number(selected)

        $.ajax({
            type:'POST',
            url:'articleList/'+'${category}'+"/"+index,
            data:value,
            success:function (result) {
                //更新文章列表(待实现)

            },
            error:function (e) {
                console.log(e.status)
                console.log(e.responseText)
            }
        })
    })


</script>
</body>
</html>
