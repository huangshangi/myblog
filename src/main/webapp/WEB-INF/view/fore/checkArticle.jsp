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
                <p>上一篇：<a href="/download/f/881.html">纯文字个人博客模板《时尚黑》</a></p>
                <p>下一篇：<a href="/download/f/886.html">html5 个人博客模板《蓝色畅想》</a></p>
            </div>
        </div>
        <div class="viewbox">
            <h2 class="newstitle"><b>随便看看</b></h2>
            <ul>
                <li><a href="/"><i><img src="http://www.yangqq.com/d/file/news/life/2018-06-17/917d732926d79cc2ae1012831ce51d1e.jpg"></i>
                    <p>3dmax利用VRay光源制作灯带</p>
                    <span>2018年7月25日</span></a></li>
                <li><a href="/"><i><img src="http://www.yangqq.com/d/file/news/life/2018-04-27/762f99f369ae786f970477feeb3b9d77.jpg"></i>
                    <p>3dmax利用VRay光源制作灯带</p>
                    <span>2018年7月25日</span></a></li>
                <li><a href="/"><i><img src="http://www.yangqq.com/d/file/jstt/bj/2018-06-29/3f0b6da48a6fd4e626a021ff7bd0d74f.jpg"></i>
                    <p>3dmax利用VRay光源制作灯带</p>
                    <span>2018年7月25日</span></a></li>
                <li><a href="/"><i><img src="http://www.yangqq.com/d/file/blogs/2018-08-22/28e3bbca2ae0205f641a9072ecb7c100.jpg"></i>
                    <p>3dmax利用VRay光源制作灯带</p>
                    <span>2018年7月25日</span></a></li>
            </ul>
        </div>

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
        <div class="news">
            <h2 class="newstitle"><b>本栏推荐</b></h2>
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
        <div class="news">
            <h2 class="newstitle"><b>栏目更新</b></h2>
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
    var arr = [
        {id:1,img:"./images/img.jpg",replyName:"帅大叔",beReplyName:"匿名",content:"同学聚会，看到当年追我的屌丝开着宝马车带着他老婆来了，他老婆是我隔壁宿舍的同班同学，心里后悔极了。",
            time:"2017-10-17 11:42:53",address:"深圳",osname:"",browse:"谷歌",replyBody:[]},
        {id:2,img:"./images/img.jpg",replyName:"匿名",beReplyName:"",
            content:"到菜市场买菜，看到一个孩子在看摊，我问：“一只鸡多少钱？” 那孩子回答：“23。” 我又问：“两只鸡多少钱？” 孩子愣了一下，一时间没算过来，急中生智大吼一声：“一次只能买一只！”",
            time:"2017-10-17 11:42:53",address:"深圳",osname:"",browse:"谷歌",
            replyBody:[{id:3,img:"",replyName:"帅大叔",beReplyName:"匿名",content:"来啊，我们一起吃鸡",time:"2017-10-17 11:42:53",address:"",osname:"",browse:"谷歌"}]},
        {id:3,img:"./images/img.jpg",replyName:"帅大叔",beReplyName:"匿名",content:"同学聚会，看到当年追我的屌丝开着宝马车带着他老婆来了，他老婆是我隔壁宿舍的同班同学，心里后悔极了。",time:"2017-10-17 11:42:53",address:"深圳",osname:"win10",browse:"谷歌",replyBody:[]}
    ];
    $(function(){
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
