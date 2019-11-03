<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <%@include file="common.jspf" %>

</head>

<body data-type="widgets">
    <script src="assets/js/theme.js"></script>
    <div class="am-g tpl-g">
    <%@include file="slider.jsp" %>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
			
          

            <div class="row-content am-cf">


             
                <div class="row">

                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">个人资料</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body am-fr">

                                <form class="am-form tpl-form-border-form tpl-form-border-br">
                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-1 am-form-label">用户id:</label>
										<label for="user-email" class="am-u-sm-1 am-form-label">1</label>
                                        <div class="am-u-sm-2">
                                            
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-1 am-form-label">用户名:</label>
										<label for="user-email" class="am-u-sm-1 am-form-label">admin</label>
                                        <div class="am-u-sm-2">
                                            
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-1 am-form-label">邮箱: </label>
										<label for="user-email" class="am-u-sm-1 am-form-label">1730256822@qq.com</label>
                                        <div class="am-u-sm-2">
                                            
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                       <label for="user-email" class="am-u-sm-1 am-form-label">注册时间: </label>
										<label for="user-email" class="am-u-sm-1 am-form-label">2019.11.03 </label>
                                        <div class="am-u-sm-2">
                                            
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-weibo" class="am-u-sm-1 am-form-label">头像地址:</label>
										
                                        <div class="am-u-sm-2">
                                            <div class="am-form-group am-form-file">
                                                
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
													<i class="am-icon-cloud-upload"></i> 更改头像地址
												</button>
                                                <input id="doc-form-file" type="file" multiple="">
                                            </div>

                                        </div>
										
										<div class="am-u-sm-2">
										
										
										</div>
                                    </div>

                                    
                                    <div class="am-form-group">
                                         <label for="user-email" class="am-u-sm-1 am-form-label">个人说明:</label>
										<label for="user-email" class="am-u-sm-1 am-form-label">无</label>
                                        <div class="am-u-sm-2">
                                            
                                        </div>
                                    </div>

                                

                                    <div class="am-form-group">
                                        <div class="am-u-sm-1 ">
                                            <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
										 <div class="am-u-sm-2">
                                            
                                        </div>
										 <div class="am-u-sm-2">
                                            
                                        </div>
                                    </div>
                                </form>
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

     // 侧边菜单
     
   $('.tpl-header-switch-button').on('click', function() {
        if ($('.left-sidebar').is('.active')) {
            if ($(window).width() > 1024) {
                $('.tpl-content-wrapper').removeClass('active');
            }
            $('.left-sidebar').removeClass('active');
        } else {

            $('.left-sidebar').addClass('active');
            if ($(window).width() > 1024) {
                $('.tpl-content-wrapper').addClass('active');
            }
        }
    })

        
        </script>

</body>

</html>