<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>首页</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
     <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
   <%@include file="common.jspf"%>

</head>

<body >
    <script src="/js/theme.js"></script>
    <div class="am-g tpl-g">
     
     	<%@include file="slider.jsp" %>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">

            <div class="container-fluid am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                        <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 后台首页 <small>myBlog</small></div>
                        <p class="page-header-description">这是一段广告词。</p>
                    </div>
                   
                </div>

            </div>

            <div class="row-content am-cf">
                <div class="row  am-cf">
				
                     <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-primary am-cf">
                            <div class="widget-statistic-header">
                                文章
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ${userSampList[0] }
                                </div>
                                
                                <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                            </div>
                        </div>
                    </div>
					
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-purple am-cf">
                            <div class="widget-statistic-header">
                                游览量
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ${userSampList[1] }
                                </div>
                                
                                <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                        <div class="widget widget-purple am-cf">
                            <div class="widget-statistic-header">
                                评论数
                            </div>
                            <div class="widget-statistic-body">
                                <div class="widget-statistic-value">
                                    ${userSampList[2] }
                                </div>
                               
                                <span class="widget-statistic-icon am-icon-support"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row am-cf">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">排行榜</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body-md widget-body tpl-amendment-echarts am-fr" >
								 <div class="widget-body  widget-body-lg am-fr">

                                <table width="100%" class="am-table am-table-compact tpl-table-black " >
								
                                    <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>用户</th>
                                            <th>文章数</th>
                                            <th>最后登录时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                          <c:forEach var="rankInfo" varStatus="status" items="${rankList }">
                                              <tr class="gradeX">
                                                  <td><c:out value="${status.count }"></c:out></td>
                                                  <td><c:out value="${rankInfo.userName }"></c:out></td>
                                                  <td><c:out value="${rankInfo.articleCount }"></c:out></td>
                                                  <td><c:out value="${rankInfo.userLastTime }"></c:out></td>
                                              </tr>
                                          </c:forEach>
                                        <!-- more data -->
                                    </tbody>
									
                                </table>



                            </div>
                            </div>
                        </div>
                    </div>

                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">新注册用户</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body-md widget-body tpl-amendment-echarts am-fr" >
                                <div class="widget-body  widget-body-lg am-fr">

                                    <table width="100%" class="am-table am-table-compact tpl-table-black " >

                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>用户</th>
                                            <th>最后登录时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="registerInfo" varStatus="status" items="${registerList }">
                                            <tr class="gradeX">
                                                <td><c:out value="${status.count }"></c:out></td>
                                                <td><c:out value="${registerInfo.userName }"></c:out></td>
                                                <td><c:out value="${registerInfo.userLastTime }"></c:out></td>
                                            </tr>
                                        </c:forEach>
                                        <!-- more data -->
                                        </tbody>

                                    </table>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>


             

                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12 widget-margin-bottom-lg">

                        <div class="widget am-cf widget-body-lg">

                            <div class="widget-body  am-fr">
								<div class="widget-head am-cf">
									<div class="widget-title am-fl">操作日志</div>
									<div class="widget-function am-fr">
										<a href="javascript:;" class="am-icon-cog"></a>
									</div>
								</div>
								
                                <div class="am-scrollable-horizontal ">
                                    <table width="100%" class="am-table am-table-compact am-text-nowrap tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>名称</th>
                                                <th>用户名</th>
                                                <th>ip</th>
                                                <th>请求路径和类型</th>
												 <th>操作时间</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="info" items="${operationList}">
                                                <tr class="gradeX">
                                                    <td><c:out value="${ info.operationName}"></c:out></td>
                                                    <td><c:out value="${ sessionScope.user.userName}"></c:out></td>
                                                    <td><c:out value="${ info.operationIp}"></c:out></td>
                                                    <td><c:out value="${ info.operationPath}"></c:out></td>
                                                    <td><c:out value="${ info.operationTime}"></c:out></td>

                                                </tr>
                                       </c:forEach>


                                            <!-- more data -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    
    </div>
  

   <script>

     // 侧边菜单
  
        </script>
</body>

</html>