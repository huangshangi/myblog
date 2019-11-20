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

<body >
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
												<button class="am-btn am-btn-default" id="newArticle">  <i class="am-icon-plus"></i> 新增</button>
												<button class="am-btn am-btn-default" style="margin-left:30px" onclick="deleteArticles()">  <i class="am-icon-trash-o"></i> 批量删除</button>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            


							<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}">
											  <option   disabled="">搜索范围</option>
											  <option value="0" selected >标题</option>
											  <option value="1">内容</option>
										</select>
                                    </div>		
                            </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " placeholder="请输入关键词">
                                        <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button" onclick="findArticle()"></button>
          </span>
                                    </div>
                                </div>

                               

							   <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
												<th><input type="checkbox"/></th>
                                                <th>标题</th>
                                                <th>评论数</th>
												<th>访问数</th>
                                                <th>时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           

                                        <c:choose>
                                        	<c:when test="${articleList==null }">
	                                        	<tr>
													<th colspan="8" style="text-align: center">暂无数据</th>
												</tr>
											</c:when>
											
											<c:otherwise>
	                                        	<c:forEach items="${articleList }" var="item">
	                                        	 		<input class="itemId" value="${item.articleId}" type="hidden"/>
		                                            <tr class="gradeX" id="${item.articleId}">
														<td><input value="${item.articleId}" type="checkbox"/></td>
		                                                <td><c:out value="${item.articleTitle }"></c:out></td>
		                                                <td><c:out value="${item.articleCommentCount }"></c:out></td>
														<td><c:out value="${item.articleCheckCount }"></c:out></td>
		                                                <td><c:out value="${item.articleCreateTime }"></c:out></td>
		                                                <td>
		                                                    <div class="tpl-table-black-operation">
		                                                        <a href="javascript:;" onclick="checkArticle(${item.articleStatus},${item.articleId})">
		                                                            <i class="am-icon-pencil" ></i> 查看
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
									<!-- am-disabled 代表不能点击  am-active代表正在被点击的元素-->			
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination">
                                            <li class=""><a href="#" >«</a></li>
                                            <c:forEach var="i" begin="0" end="9">
		                                            <li class=""><a href="#"><c:out value="${i+1 }"></c:out></a></li>
		                                            
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

    		var data={"page":index};
        		//发送分页显示器
                $.post({
                    type:'POST',
                    url:'article/article',
                    data:data,
                    success:function (result) {
                        $('tbody').remove();
                        var tbody=$('<tbody></tbody>');
                        var list=JSON.stringify(result)
                        for(var i=0;i<list.size();i++){
                            var item=list[i];
                            var tr="  <tr class=\"gradeX\ id="+item.articleId +">\t                                           \n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td><input value="+item.articleId+"type=\"checkbox\"/></td>\n" +
                                "\t\t                                                <td>"+item.articleTitle+"</td>\n" +
                                "\t\t                                                <td>"+item.articleCommentCount+"</td>\n" +
                                "\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td>"+item.articleCheckCount+"</td>\n" +
                                "\t\t                                                <td>"+item.articleCreateTime +"</td>\n" +
                                "\t\t                                                <td>\n" +
                                "\t\t                                                    <div class=\"tpl-table-black-operation\">\n" +
                                "\t\t                                                        <a href=\"javascript:;\" onclick=\"checkArticle("+item.articleStatus+","+item.articleId+")\">\n" +
                                "\t\t                                                            <i class=\"am-icon-pencil\" ></i> 查看\n" +
                                "\t\t                                                        </a>\n" +
                                "\t\t                                                        <a href=\"javascript:;\" class=\"tpl-table-black-operation-del\" onclick=\"deleteArticle("+item.articleId+"})\">\n" +
                                "\t\t                                                            <i class=\"am-icon-trash\"></i> 删除\n" +
                                "\t\t                                                        </a>\n" +
                                "\t\t                                                    </div>\n" +
                                "\t\t                                                </td>\n" +
                                "\t\t                                            </tr>";

                            tr.appendTo(tbody);
                        }
    		            $('thead').after(tbody)

                    },
                    error:function (e) {
                        layer.msg('文章删除失败')
                    }
                })
        	
        	
        	
        	
    	});
    	
    	 
		    $('#newArticle').on('click',function(){
		    	//用户将要进行发表新文章的操作
		    	console.log('发表新文章');
				window.location.href="/article/newArticle";
		    	
		    });
		    

    	});

		function findArticle() {
			var type=$('div.am-u-sm-12 div.tpl-table-list-select select').val();
			var key=$('div.am-u-sm-12 div.am-input-group input').val();
			var data={'type':type,'key':key};
			if(!key){
				layer.alert('关键词不能为空!');
				return
			}
			$.ajax({
				type:'POST',
				url:'article/find',
				data:JSON.stringify(data),
				success:function (result) {
					console.log(result)
				},
				error:function (e) {
					console.log(e.status)
					console.log(e.responseText)
				}
			})

		}

    	//查看文章
		function checkArticle(category,id){

		    window.location.href="/article/"+category+"/"+id;


		}
    
    	
    	//删除文章系列操作
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
            var data={"postData":value};
			$.ajax({
				type:'POST',
				url:'article/delete',
				data:data,
				success:function (result) {
                    var json=JSON.stringify(result)

					//删除article
                    $('#'+value).remove()
				},
				error:function (e) {
					layer.msg('文章删除失败')
				}
			})
		}
    	//3.执行批量选择按钮
    	function deleteArticles() {
			var list=[]
			var target=$('div.am-u-sm-12 table tbody tr.gradeX  input');
			target.each(function(){
				list.push($(this).val())
			})
			//list中存放article ids 使用ajax删除
			$.ajax({
				type:'POST',
				url:'article/deletes',
				data:JSON.stringify(list),
				success:function (result) {
					console.log(result)
                    for(var i=0;i<list.length;i++){
                        var id=list[i]
                        $('#'+id).remove()
                    }

				},
				error:function (e) {
					layer.msg('删除文章失败')
				}
			})
		}
			    
	        </script>
   
</body>

</html>>