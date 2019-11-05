<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


</head>
<body>

 <!-- 头部 -->
        <header>
            <!-- logo -->
            <div class="am-fl tpl-header-logo">
                <a href="javascript:;"><img src="/img/logo.png" alt=""></a>
            </div>
            <!-- 右侧内容 -->
            <div class="tpl-header-fluid">
                <!-- 侧边切换 -->
                <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
                </div>
                <!-- 搜索 -->
                <div class="am-fl tpl-header-search">
                    <form class="tpl-header-search-form" action="javascript:;">
                        <button class="tpl-header-search-btn am-icon-search"></button>
                        <input class="tpl-header-search-box" type="text" placeholder="搜索内容...">
                    </form>
                </div>
                <!-- 其它功能-->
                <div class="am-fr tpl-header-navbar">
                    <ul>
                        <!-- 欢迎语 -->
                        <li class="am-text-sm tpl-header-navbar-welcome">
                            <a href="javascript:;">欢迎你, <span><%= session.getAttribute("nickname")%></span> </a>
                        </li>

               
                        <!-- 退出 -->
                        <li class="am-text-sm " id="logout">
                            <a href="javascript:;">
                                <span class="am-icon-sign-out"></span> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </header>
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <div class="tpl-user-panel-profile-picture">
                        <img src="${sessionScope.imageUrl }" alt="">
                    </div>
                    <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
              <%=session.getAttribute("nickname") %>
          </span>
                   
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <!--<li class="sidebar-nav-heading">Components <span class="sidebar-nav-heading-info"> 附加组件</span></li>-->
                <li class="sidebar-nav-link">
                    <a href="index.jsp" >
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/admin/article">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 博客
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="comment-list.jsp">
                        <i class="am-icon-calendar sidebar-nav-link-logo"></i> 评论
                    </a>
                </li>
                
                
                 <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 用户管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link">
                            <a href="personInfo.jsp">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 个人信息
                            </a>
                        </li>

                        <li class="sidebar-nav-link">
                            <a href="modifyPassword.jsp">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 修改密码
                            </a>
                        </li>
                    </ul>
                </li>
                
               
          
            </ul>
        </div>
	   <script>
	
		     // 侧边菜单
		     $('.sidebar-nav-sub-title').on('click', function() {
		         $(this).siblings('.sidebar-nav-sub').slideToggle(80)
		             .end()
		             .find('.sidebar-nav-sub-ico').toggleClass('sidebar-nav-sub-ico-rotate');
		     })
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
		
			    //退出操作
			    $('#logout').on('click',function(){
			    	console.log('you have logout')
			    	//重定向至logout
			    })
	        
			    
			    $('.tpl-skiner-toggle').on('click', function() {
    $('.tpl-skiner').toggleClass('active');
})

$('.tpl-skiner-content-bar').find('span').on('click', function() {
    $('body').attr('class', $(this).attr('data-color'))
    saveSelectColor.Color = $(this).attr('data-color');
    // 保存选择项
    storageSave(saveSelectColor);

})
	        </script>

</body>
</html>