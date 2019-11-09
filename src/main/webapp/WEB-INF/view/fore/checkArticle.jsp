<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>网站标题</title>
    <meta name="keywords" content="关键词,关键词,关键词,关键词,5个关键词" />
    <meta name="description" content="网站简介，不超过80个字" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/index.css" rel="stylesheet">
    <link rel="stylesheet"  href="/css/bootstrap.css">
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
        <div class="contentbox">
            <h2 class="contitle">${article.articleTitle}</h2>
            <p class="bloginfo"><span>${articleUser.userName}</span><span>${article.articleCreateTime}</span><span>阅读数 ${article.articleCheckCount}</span></p>
            <div id="test-editormd-view">
                <textarea style="display:none;">
                    ${article.articleContent}
                </textarea>
            </div>

            <div class="share"> 分享 </div>
            <div class="nextinfo">
                <p>上一篇：<a href="${'/checkArticle/'+preArticle.articleId}">${preArticle.articleTitle}</a></p>
                <p>下一篇：<a href="${'/checkArticle/'+nextArticle.articleId}">${nextArticle.articleTitle}</a></p>
            </div>
        </div>
        <c:when test="${randomList!=null} ">
            <div class="viewbox">
                <h2 class="newstitle"><b>随便看看</b></h2>
                <ul>
                   <c:forEach items="${randomList}" var="item">
                       <li>
                           <a href="/">
                               <i>
                                 <img src="http://www.yangqq.com/d/file/news/life/2018-06-17/917d732926d79cc2ae1012831ce51d1e.jpg">
                               </i>
                                <p>${item.articleTitle}</p>
                                <span>${item.articleCreateTime}</span>
                            </a>
                       </li>
                   </c:forEach>


                </ul>
            </div>
        </c:when>
        <div class="pinlun">
            <h2 class="newstitle"><b>评论</b></h2>
            <div class="gbok">

                <div class="container">
                    <div class="commentbox">
                        <textarea cols="80" rows="50" placeholder="来说几句吧......" class="mytextarea" id="content"></textarea>
                        <div class="btn-comment btn-info pull-right" id="comment">评论</div>
                    </div>
                    <div class="comment-list">





                    </div>
                </div>

            </div>
        </div>

    </div>
    <div class="rside">
        <div class="news">
            <h2 class="newstitle"><b>文章排行</b></h2>
            <ul>
                <c:forEach items="${rankList}" var="item">
                    <li><a href="${'/checkArticle/'+item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                </c:forEach>


            </ul>
        </div>
        <div class="news">
            <h2 class="newstitle"><b>优质好文</b></h2>
            <ul>
                <c:forEach items="${recommendList}" var="item">
                    <li><a href="${'/checkArticle/'+item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                </c:forEach>
            </ul>
        </div>
        <div class="news">
            <h2 class="newstitle"><b>本栏推荐</b></h2>
            <ul>
                <c:forEach items="${headRecommendList}" var="item">
                    <li><a href="${'/checkArticle/'+item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="copyright">
        <p>Copyright 2019 <a href="/">myblog</a> </p>
    </div>
</div>

<a href="#" class="cd-top cd-is-visible">Top</a>
</body>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.comment.js" ></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript">

    var testEditor;

    //初始化数据

    $(function(){

        var arr= ${commentList}

        $(".comment-list").addCommentList({data:arr,add:""});


        testEditor = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode: "style,script,iframe",  // you can filter tags decode

            emoji: true,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true,  // 默认不解析
            codeFold: true,
        });
    })

    //用户准备提交评论

    $("#comment").click(function(){
        //1.检查评论内容是否为空
        var comment=$('#comment').val();
        if(!comment){
            layer.msg('内容不能为空!')
            return;
        }
        var obj = new Object();
        obj.img="./image/img.jpg";
        obj.replyName="懒人";
        obj.content=$("#content").val();
        obj.browse="深圳";
        obj.osname="win10";
        obj.replyBody="";
        //
        var replyData={}
        $(".comment-list").addCommentList({data:[],add:obj});
    });
</script>
</html>
