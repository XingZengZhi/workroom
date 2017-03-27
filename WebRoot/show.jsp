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
					$(".nav-stacked").append("<li><a href=''>" + data[i].roomName + "</a></li>");
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>

			<div class="col-md-3 column">
				<ul class="nav nav-pills nav-stacked">
				</ul>
			</div>
			<div class="col-md-9" style="margin-top: 20px;">
				<div class="tabbable" id="tabs-77207">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-706309" data-toggle="tab">第一部分</a>
						</li>
						<li><a href="#panel-187352" data-toggle="tab">第二部分</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-706309">
							<!-- 文章搜索 -->
							<form class="form-search form-inline">
								<input class="input-medium search-query" type="text" />
								<button type="submit" class="btn">查找</button>
							</form>

							<ul class="thumbnails" style="margin-left: -55px;">
								<li class="col-md-4">
									<div class="thumbnail">
										<img src="${pageContext.request.contextPath }/img/image1.jpg" />
										<div class="caption">
											<h3>冯诺尔曼结构</h3>
											<p>
												也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
											</p>
											<p>
												<a class="btn btn-primary" href="#">浏览</a> <a class="btn"
													href="#">分享</a>
											</p>
										</div>
									</div>
								</li>
								<li class="col-md-4">
									<div class="thumbnail">
										<img src="${pageContext.request.contextPath }/img/image1.jpg" />
										<div class="caption">
											<h3>哈佛结构</h3>
											<p>
												哈佛结构是一种将程序指令存储和数据存储分开的存储器结构，它的主要特点是将程序和数据存储在不同的存储空间中，进行独立编址。</p>
											<p>
												<a class="btn btn-primary" href="#">浏览</a> <a class="btn"
													href="#">分享</a>
											</p>
										</div>
									</div>
								</li>
								<li class="col-md-4">
									<div class="thumbnail">
										<img src="${pageContext.request.contextPath }/img/image1.jpg" />
										<div class="caption">
											<h3>改进型哈佛结构</h3>
											<p>
												改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。</p>
											<p>
												<a class="btn btn-primary" href="#">浏览</a> <a class="btn"
													href="#">分享</a>
											</p>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="tab-pane" id="panel-187352">
							<!-- 视频搜索 -->
							<form class="form-search form-inline">
								<input class="input-medium search-query" type="text" />
								<button type="submit" class="btn">查找</button>
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