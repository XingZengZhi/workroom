<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>成果展示</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/show.css">
<script type="text/javascript">
	$(function(){
		//异步读取所有工作室的名称和设置每个工作室的链接
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath }/user_room",
			dataType:"json",
			success:function(data){
				for(var i = 0;i<data.length;i++){
					$(".nav-stacked").append("<li><a name='"+ data[i].roomId +"'>" + data[i].roomName + "</a></li>");
				}
			}
		});
		//异步获取所有文章
		$.post("${pageContext.request.contextPath}/article_returnAllArticle",function(data){
			for(var i = 0;i<data.length;i++){
				$(".thumbnails").append("<li class='col-md-4'>" +
											"<div class='thumbnail'>" +
												"<img src='${pageContext.request.contextPath }/img/image1.jpg' />" +
												"<div class='caption'>" +
													"<h3>"+ data[i].articleTitle +"</h3>" +
													"<p id='text'>"+ data[i].articleText +"</p>" +
													"<p>" +
														"<a class='btn btn-primary' href=''>"+"浏览</a>" +
														"<a class='btn' href='#'>"+"分享</a>" +
													"</p>" +
												"</div>" +
											"</div>" +
									    "</li>");
			}
		},"json");
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>
			<!-- 左侧工作室栏列表 -->
			<div class="col-md-3 column">
				<ul class="nav nav-pills nav-stacked">
				</ul>
				<script type="text/javascript">
					$(document).ready(function(){
						//左侧栏绑定点击
						$(".nav-stacked li a").click(function(){
							alert(1);
						});
					});
				</script>
			</div>
			<!-- 右侧信息展示 -->
			<div class="col-md-9" style="margin-top: 20px;">
				<div class="tabbable" id="tabs-77207">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-706309" data-toggle="tab">文章预览</a>
						</li>
						<li><a href="#panel-187352" data-toggle="tab">视频分享</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-706309">
							<!-- 文章搜索 -->
							<form class="form-search form-inline">
								<input class="input-medium search-query" type="text" />
								<button type="submit" class="btn">查找文章</button>
							</form>
							<ul class="thumbnails" style="margin-left: -55px;">
							</ul>
						</div>
						
						<div class="tab-pane" id="panel-187352">
							<!-- 视频搜索 -->
							<form class="form-search form-inline">
								<input class="input-medium search-query" type="text" />
								<button type="submit" class="btn">查找视频</button>
							</form>

							<div class="media">
								<a href="#" class="pull-left"><img src="img/a_002.jpg"
									class="media-object" /></a>
								<div class="media-body">
									<h4 class="media-heading">嵌入媒体标题</h4>
									请尽量使用HTML5兼容的视频格式和视频代码实现视频播放, 以达到更好的体验效果.
								</div>
							</div>
							<div class="media">
								<a href="#" class="pull-left"><img src="img/a_002.jpg"
									class="media-object" /></a>
								<div class="media-body">
									<h4 class="media-heading">嵌入媒体标题</h4>
									请尽量使用HTML5兼容的视频格式和视频代码实现视频播放, 以达到更好的体验效果.
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="col-md-12">
				<jsp:include page="workRoomFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>