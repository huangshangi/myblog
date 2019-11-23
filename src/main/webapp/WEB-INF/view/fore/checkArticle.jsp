<%@ page import="com.huangshangi.myblog.entity.User" %>
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
    <script src="/plugin/editormd/lib/marked.min.js"></script>
    <script src="/plugin/editormd/lib/prettify.min.js"></script>
    <script src="/plugin/editormd/lib/raphael.min.js"></script>
    <script src="/plugin/editormd/lib/underscore.min.js"></script>
    <script src="/plugin/editormd/lib/sequence-diagram.min.js"></script>
    <script src="/plugin/editormd/lib/flowchart.min.js"></script>
    <script src="/plugin/editormd/lib/jquery.flowchart.min.js"></script>
    <script src="/plugin/editormd/editormd.min.js"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>

    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script src="/plugin/editormd/editormd.js"></script>
    <script src="/js/comm.js" ></script>
    <link href="/plugin/editormd/css/editormd.min.css" rel="stylesheet" />
    <!--[if lt IE 9]>
    <script src="/js/modernizr.js"></script>
    <![endif]-->


</head>
<body>

<%@include file="slider.jsp" %>
<div class="main-content">

    <div class="welcome">${contant}</div>
    <div class="blogbox">
        <div class="contentbox">
            <h2 class="contitle">${article.articleTitle}</h2>
            <p class="bloginfo"><span>${articleUser.userName}</span><span>${article.articleCreateTime}</span><span>阅读数 ${article.articleCheckCount}</span></p>
            <div id="test-editormd-view">
                <textarea style="display:none;" name="textContent">
                   ${article.articleContent}
                </textarea>
            </div>


            <div class="nextinfo">
                <p>上一篇：<a href="/checkArticle/${preArticle.articleStatus}/${preArticle.articleId}">${preArticle.articleTitle}</a></p>
                <p>下一篇：<a href="/checkArticle/${nextArticle.articleStatus}/${nextArticle.articleId}">${nextArticle.articleTitle}</a></p>
            </div>
        </div>
        <c:choose>
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

        </c:choose>

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
                <c:choose>
                    <c:when test="${rankList!=null}">
                        <c:forEach items="${rankList}" var="item">
                            <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>
                </c:choose>



            </ul>
        </div>
        <div class="news">
            <h2 class="newstitle"><b>优质好文</b></h2>
            <ul>
                <c:choose>
                    <c:when test="${recommendList!=null}">
                        <c:forEach items="${recommendList}" var="item">
                            <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>
                </c:choose>

            </ul>
        </div>
        <div class="news">
            <h2 class="newstitle"><b>本栏推荐</b></h2>
            <ul>
                <c:choose>
                    <c:when test="${headRecommendList!=null}">
                        <c:forEach items="${headRecommendList}" var="item">
                            <li><a href="/checkArticle/${item.articleStatus}/${item.articleId}"><span>${item.articleCreateTime}</span>${item.articleTitle}</a></li>

                        </c:forEach>
                    </c:when>
                </c:choose>

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
<%
    User user=(User) session.getAttribute("user");
    int userId=0;
    String userName="ceshi";
    if(user==null){
        userName="ceshi";
         userId=0;
    }else{
        userName=user.getUserName();
        userId=user.getUserId();
    }



%>
    var userId=<%=userId%>;
    var userName="<%=userName%>";
    $(function () {
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

    });
    //初始化数据

    var arr = ${commentList};



    //用户准备提交评论
    $("#comment").click(function(){
        //1.登录检查


        if(userId==0){
            layer.msg("登录之后才可以评论哟");

            return;
        }


        //1.检查评论内容是否为空
        var comment=$('#content').val();
        if(!comment){
            layer.msg('内容不能为空!')
            return;
        }
        var obj = new Object();
        obj.parentId=0;
        obj.content=comment;
        obj.uid=userId;
        obj.articleId=${article.articleId};
        obj.replyName=userName;
        obj.replyBody=[]
        $.ajax({
            method:'POST',
            url:'/addComment',
            contentType:"application/json",
            data:JSON.stringify(obj),
            success:function (res) {
                var json=JSON.parse(res)
                console.log(json);
                console.log(JSON.stringify(obj))
                if(Number(json.result)==1)
                    $(".comment-list").addCommentList({data:[],add:obj});

                else
                    layer.msg('用户名或密码错误,请重新输入')
            }
        })





    });


    var x,y;
    $(document).mousemove(function(e){
        x = e.pageX;
        y = e.pageY;
    });

    function crateCommentInfo(obj){

        //评论发布时间
        if(typeof(obj.time) == "undefined" || obj.time == ""){
            obj.time = getNowDateFormat();
        }

        //评论者头像
        var el = "<div class='comment-info'><header><img src='"+obj.img+"'></header><div class='comment-right'><h3 data-id='"+obj.id+"'>"+obj.replyName+"</h3>"
            +"<div class='comment-content-header'><span><i class='glyphicon glyphicon-time'></i>"+obj.time+"</span>";

        //评论发布地址
        if(typeof(obj.address) != "undefined" && obj.browse != ""){
            //el =el+"<span><i class='glyphicon glyphicon-map-marker'></i>"+obj.address+"</span>";
        }

        //评论内容
        el = el+"</div><p class='content'>"+obj.content+"</p><div class='comment-content-footer'><div class='row'><div class='col-md-10'>";

        //评论者昵称
        if(typeof(obj.osname) != "undefined" && obj.osname != ""){
            el =el+"<span id='comentName' data-id='"+obj.id+"'><i class='glyphicon glyphicon-pushpin' ></i> 来自:"+obj.osname+"</span>";
        }

        //用户使用的游览器 待删除
        if(typeof(obj.browse) != "undefined" && obj.browse != ""){
            //el = el + "<span><i class='glyphicon glyphicon-globe'></i> "+obj.browse+"</span>";
        }

        el = el + "</div><div class='col-md-2'><span class='reply-btn'>回复</span></div></div></div><div class='reply-list'>";


        //子评论
        if(obj.replyBody != "" && obj.replyBody.length > 0){
            var arr = obj.replyBody;
            for(var j=0;j<arr.length;j++){
                var replyObj = arr[j];
                el = el+createReplyComment(replyObj);
            }
        }
        el = el+"</div></div></div>";
        return el;
    }

    //返回每个回复体内容
    function createReplyComment(reply){
        var replyEl = "<div class='reply'><div><a href='javascript:void(0)' class='replyname' data-id='"+reply.id+"'>"+reply.replyName+"</a>:<a href='javascript:void(0)'>@"+reply.beReplyName+"</a><span>"+reply.content+"</span></div>"
            + "<p><span>"+reply.time+"</span> <span class='reply-list-btn' >回复</span></p></div>";
        return replyEl;
    }
    function getNowDateFormat(){
        var nowDate = new Date();
        var year = nowDate.getFullYear();
        var month = filterNum(nowDate.getMonth()+1);
        var day = filterNum(nowDate.getDate());
        var hours = filterNum(nowDate.getHours());
        var min = filterNum(nowDate.getMinutes());
        var seconds = filterNum(nowDate.getSeconds());
        return year+"-"+month+"-"+day+" "+hours+":"+min+":"+seconds;
    }
    function filterNum(num){
        if(num < 10){
            return "0"+num;
        }else{
            return num;
        }
    }
    function replyClick(el){
        //登录判断
        if(userId==0){
            layer.msg("请登录后评论")
            return;
        }

        el.parent().parent().append("<div id='replybox' tabindex='0' class='replybox' ><textarea id='mytextarea' cols='80' rows='50' placeholder='来说几句吧......' class='mytextarea' style='padding-left:5px;padding-top:2px;'></textarea><span class='send' id='send'>发送</span></div>")
            .find(".send").click(function(){
            var content = $(this).prev().val();
            if(content != ""){
                var parentEl = $(this).parent().parent().parent().parent();
                var obj = new Object();
                obj.replyName=userName;//回复者名称
                obj.articleId=${article.articleId};
                obj.uid=userId;
                if(el.parent().parent().hasClass("reply")){
                    obj.beReplyName = el.parent().parent().find("a:first").text();
                    obj.parentId=Number(el.parent().parent().find("a:first").attr("data-id"));
                }else{

                    obj.beReplyName=parentEl.find("h3").text();
                    obj.parentId=Number(parentEl.find("h3").attr("data-id"));
                }
                obj.content=content;
                obj.time = getNowDateFormat();

                //ajax发送回复信息
                $.ajax({
                    method:'POST',
                    url:'/addComment',
                    contentType:"application/json",
                    data:JSON.stringify(obj),
                    success:function (res) {
                        var json=JSON.parse(res);
                        if(Number(json.result)==1){
                            var replyString = createReplyComment(obj);
                            parentEl.find(".reply-list").append(replyString).find(".reply-list-btn:last").click(function(){alert("不能回复自己");});
                        }
                        else
                            layer.msg('网络异常,请稍后重试')
                    }
                })
                $(".replybox").remove();

            }else{
                alert("空内容");
            }
        });
    }



    $.fn.addCommentList=function(options){
        var defaults = {
            data:[],
            add:""
        }

        var option = $.extend(defaults, options);
        //加载数据
        if(option.data.length > 0){
            var dataList = option.data;
            var totalString = "";
            for(var i=0;i<dataList.length;i++){
                var obj = dataList[i];
                var objString = crateCommentInfo(obj);
                totalString = totalString+objString;
            }
            $(this).append(totalString).find(".reply-btn").click(function(){
                if($(this).parent().parent().find(".replybox").length > 0){
                    $(".replybox").remove();
                }else{

                    $(".replybox").remove();
                    replyClick($(this));
                }
                $('#mytextarea').focus()
                $('#mytextarea').blur(function(){
                    var div = $('.replybox');//获取你想要的DIV
                    var y1 = div.offset().top;  //div上面两个的点的y值
                    var y2 = y1 + div.height();//div下面两个点的y值
                    var x1 = div.offset().left;  //div左边两个的点的x值
                    var x2 = x1 + div.width();  //div右边两个点的x的值

                    if( x < x1 || x > x2 || y < y1 || y > y2){
                        $('.replybox').remove()
                    }


                })


            });
            $(".reply-list-btn").click(function(){

                if($(this).parent().parent().find(".replybox").length > 0){

                    $(".replybox").remove();
                }else{

                    $(".replybox").remove();
                    replyClick($(this));
                }
                $('#mytextarea').focus()
                $('#mytextarea').blur(function(){
                    var div = $('#replybox');//获取你想要的DIV
                    var y1 = div.offset().top;  //div上面两个的点的y值
                    var y2 = y1 + div.height();//div下面两个点的y值
                    var x1 = div.offset().left;  //div左边两个的点的x值
                    var x2 = x1 + div.width();  //div右边两个点的x的值

                    if( x < x1 || x > x2 || y < y1 || y > y2){
                        $('.replybox').remove()
                    }


                })
            })



        }




        //添加新数据
        if(option.add != ""){
            obj = option.add;
            var str = crateCommentInfo(obj);
            $(this).prepend(str).find(".reply-btn").click(function(){
                replyClick($(this));
            });
        }
    }





</script>
</html>
