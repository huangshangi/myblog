(function($){
	var x,y;
	$(document).mousemove(function(e){
		x = e.pageX;
		y = e.pageY;
	});

	function crateCommentInfo(obj){
		/*
		 * <div class="comment-info">
			<header><img src="./images/img.jpg"></header>
			<div class="comment-right">
				<h3>匿名</h3>
				<div class="comment-content-header"><span><i class="glyphicon glyphicon-time"></i> 2017-10-17 11:42:53</span><span><i class="glyphicon glyphicon-map-marker"></i>深圳</span></div>
				<p class="content">mongodb 副本集配置副本集概念：就我的理解就是和主从复制 差不多，就是在主从复制的基础上多加了一个选举的机制。
				复制集 特点：数据一致性 主是唯一的，没有Mysql 那样的双主结构大多数原则，集群存活节点小于二分之一是集群不可写，
				只可读从库无法写入数据自动容灾通过下面的一个图来简单的了解下
				 配置过程：一、安装mongodb安装过程略，不懂得可以看前面的教程二、创建存储目录与配置文件创...</p>
				<div class="comment-content-footer">
					<div class="row">
						<div class="col-md-10">
							<span><i class="glyphicon glyphicon-pushpin"></i> 来自:win10 </span><span><i class="glyphicon glyphicon-globe"></i> chrome 55.0.2883.87</span>
						</div>
						<div class="col-md-2"><span class="reply-btn">回复</span></div>
					</div>
				</div>
				<div class="reply-list">
					<div class="reply">
						<div><a href="javascript:void(0)">匿名</a>:<a href="javascript:void(0)">@匿名</a><span>这写的是什么鬼东西。。。。</span></div>
						<p><span>2017-10-17 11:42:53</span> <span class="reply-list-btn">回复</span></p>
					</div>
				</div>
			</div>
		</div>
		 * */
		//评论发布时间
		if(typeof(obj.time) == "undefined" || obj.time == ""){
			obj.time = getNowDateFormat();
		}

		//评论者头像
		var el = "<div class='comment-info'><header><img src='"+obj.img+"'></header><div class='comment-right'><h3>"+obj.replyName+"</h3>"
			+"<div class='comment-content-header'><span><i class='glyphicon glyphicon-time'></i>"+obj.time+"</span>";

		//评论发布地址
		if(typeof(obj.address) != "undefined" && obj.browse != ""){
			el =el+"<span><i class='glyphicon glyphicon-map-marker'></i>"+obj.address+"</span>";
		}

		//评论内容
		el = el+"</div><p class='content'>"+obj.content+"</p><div class='comment-content-footer'><div class='row'><div class='col-md-10'>";

		//评论者昵称
		if(typeof(obj.osname) != "undefined" && obj.osname != ""){
			el =el+"<span><i class='glyphicon glyphicon-pushpin'></i> 来自:"+obj.osname+"</span>";
		}

		//用户使用的游览器 待删除
		if(typeof(obj.browse) != "undefined" && obj.browse != ""){
			el = el + "<span><i class='glyphicon glyphicon-globe'></i> "+obj.browse+"</span>";
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
		var replyEl = "<div class='reply'><div><a href='javascript:void(0)' class='replyname'>"+reply.replyName+"</a>:<a href='javascript:void(0)'>@"+reply.beReplyName+"</a><span>"+reply.content+"</span></div>"
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
		el.parent().parent().append("<div id='replybox' tabindex='0' class='replybox' ><textarea id='mytextarea' cols='80' rows='50' placeholder='来说几句吧......' class='mytextarea' style='padding-left:5px;padding-top:2px;'></textarea><span class='send' id='send'>发送</span></div>")
			.find(".send").click(function(){
			var content = $(this).prev().val();
			if(content != ""){
				var parentEl = $(this).parent().parent().parent().parent();
				var obj = new Object();
				obj.replyName="匿名";
				if(el.parent().parent().hasClass("reply")){
					console.log("1111");
					obj.beReplyName = el.parent().parent().find("a:first").text();
				}else{
					console.log("2222");
					obj.beReplyName=parentEl.find("h3").text();
				}
				obj.content=content;
				obj.time = getNowDateFormat();
				var replyString = createReplyComment(obj);
				$(".replybox").remove();
				parentEl.find(".reply-list").append(replyString).find(".reply-list-btn:last").click(function(){alert("不能回复自己");});
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
		console.log('22')
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



})(jQuery);