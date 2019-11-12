<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <%@include file="common.jspf" %>

</head>

<body data-type="widgets">
<script src="/js/theme.js"></script>
<div class="am-g tpl-g">

    <%@include file="slider.jsp" %>


    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <div class="row-content am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title  am-cf">文章列表</div>


                        </div>
                        <div class="widget-body  am-fr">

                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                <div class="am-form-group">
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">

                                            <button class="am-btn am-btn-default" >  <i class="am-icon-trash-o"></i> 批量删除</button>

                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                <div class="am-form-group tpl-table-list-select">
                                    <select data-am-selected="{btnSize: 'sm'}">
                                        <option value="option1"  disabled="">搜索范围</option>
                                        <option value="option2" selected >评论内容</option>
                                        <option value="option3">评论人</option>
                                    </select>
                                </div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                    <input type="text" class="am-form-field ">
                                    <span class="am-input-group-btn">
           								 	<button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button"></button>
         								 </span>
                                </div>
                            </div>



                            <div class="am-u-sm-12">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox"/></th>
                                        <th>评论文章</th>
                                        <th>评论人</th>
                                        <th>评论内容</th>
                                        <th>评论时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="gradeX">
                                        <td><input type="checkbox"/></td>
                                        <td>Amaze UI 模式窗口</td>
                                        <td>test</td>
                                        <td>写的不错!</td>
                                        <td>2016-09-26</td>
                                        <td>
                                            <div class="tpl-table-black-operation">
                                                <a href="javascript:;">
                                                    <i class="am-icon-pencil"></i> 编辑
                                                </a>
                                                <a href="javascript:;" class="tpl-table-black-operation-del">
                                                    <i class="am-icon-trash"></i> 删除
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${requestScope.comments==null }">
                                            <tr>
                                                <th colspan="8" style="text-align: center">暂无数据</th>
                                            </tr>
                                        </c:when>

                                        <c:otherwise>
                                            <c:forEach items="${requestScope.articles }" var="item">
                                                <input class="itemId" value="${item.articleId}" type="hidden"/>
                                                <tr class="gradeX">
                                                    <td><input value="${item.articleId}" type="checkbox"/></td>
                                                    <td><c:out value="${item.title }"></c:out></td>
                                                    <td><c:out value="${item.commenter }"></c:out></td>
                                                    <td><c:out value="${item.commentContent }"></c:out></td>
                                                    <td><c:out value="${item.createTime }"></c:out></td>
                                                    <td>
                                                        <div class="tpl-table-black-operation">
                                                            <a href="javascript:;">
                                                                <i class="am-icon-pencil"></i> 编辑
                                                            </a>
                                                            <a href="javascript:;" class="tpl-table-black-operation-del" onclick="deleteArticle(${item.articleId})">
                                                                <i class="am-icon-trash"></i> 删除
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>

                                    </tbody>
                                </table>
                            </div>
                            <div class="am-u-lg-12 am-cf">

                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <li class=""><a href="#" >«</a></li>
                                        <c:forEach var="i" begin="0" end="9">
                                            <li class=""><a ><c:out value="${i+1 }"></c:out></a></li>

                                        </c:forEach>
                                        <li><a href="#">»</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>

    $(document).ready(function(){
        //初始化分页选择器
        var index=1;
        $('div.am-fr ul.am-pagination  li:eq('+(Number(index))+')').addClass('am-active am-disabled');
        if($('div.am-fr ul.am-pagination  li:eq('+(Number(index)-1)+')').html()===$('div.am-fr ul.am-pagination  li:first').html())
            $('div.am-fr ul.am-pagination  li:eq('+(Number(index)-1)+')').addClass('am-disabled');
        if($('div.am-fr ul.am-pagination  li:eq('+(Number(index)+1)+')').html()===$('div.am-fr ul.am-pagination  li:last').html())
            $('div.am-fr ul.am-pagination  li:eq('+(Number(index)+1)+')').addClass('am-disabled');

        //分页选择器
        $('div.am-fr ul.am-pagination  li a').on('click',function(){

            //清除原先被禁用信息
            $('div.am-fr ul.am-pagination  li:eq('+(Number(index))+')').removeClass('am-active am-disabled');
            if($('div.am-fr ul.am-pagination  li:eq('+(Number(index)-1)+')').hasClass('am-disabled'))
                $('div.am-fr ul.am-pagination  li:eq('+(Number(index)-1)+')').removeClass('am-disabled');
            if($('div.am-fr ul.am-pagination  li:eq('+(Number(index)+1)+')').hasClass('am-disabled'))
                $('div.am-fr ul.am-pagination  li:eq('+(Number(index)+1)+')').removeClass('am-disabled');

            //获取当前被选择的页面
            string=$(this).html();
            if(string==="»")
                index=index+1;
            else if (string==='«')
                index=index-1;
            else
                index=Number(string);

            $('div.am-fr ul.am-pagination  li:eq('+(Number(index))+')').addClass('am-active am-disabled');
            if($('div.am-fr ul.am-pagination  li:eq('+(Number(index)+1)+')').html()===$('div.am-fr ul.am-pagination  li:last').html())

                $('div.am-fr ul.am-pagination  li:eq('+(Number(index)+1)+')').addClass('am-disabled');


            if($('div.am-fr ul.am-pagination  li:eq('+(Number(index)-1)+')').html()===$('div.am-fr ul.am-pagination  li:first').html())

                $('div.am-fr ul.am-pagination  li:eq('+(Number(index)-1)+')').addClass('am-disabled');


            //根据index分页显示页面
            //ajax



        });





    });



    //批量删除文章系列操作
    //1.全部选择 checkbox
    $('div.am-u-sm-12 table thead tr th input').on('click',function(){

        if($('div.am-u-sm-12 table thead tr th input').is(':checked'))
            $('div.am-u-sm-12 table tbody tr.gradeX  input').prop('checked',true)

        else
            $('div.am-u-sm-12 table tbody tr.gradeX  input').prop('checked',false)
    })
    //2.删除单个 article
    function deleteArticle(value) {
        //value代表删除的article id 使用ajax删除
    }
    //3.执行批量选择按钮
    function deleteArticles() {
        var list=[]
        var target=$('div.am-u-sm-12 table tbody tr.gradeX  input');
        target.each(function(){
            list.push($(this).val())
        })
        //list中存放article ids 使用ajax删除

    }


</script>

</body>

</html>>