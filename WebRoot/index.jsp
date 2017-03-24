<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>工业物联网中心</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
	#foot ul li a{
		text-decoration:none;
		color:white;
		transition:all 0.5s;
		-webkit-transition:all 0.5s;
		-moz-transition:all 0.5s;
		-ms-transition:all 0.5s;
		-o-transition:all 0.5s;
	}
	 #foot ul li a:hover{
		color:#00C1DE;
	}
</style>
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/user_room",
				dataType:"json",
				success:function(data){
					/* 异步获取工作室的名字 */
					$("div[class*='row'] h3").each(function(i, n){
						$(n).text(data[i].roomName);
					});
					/* 异步获取工作室简介 */
					$("div[class*='row'] p.title").each(function(i, n){
						$(n).text(data[i].roomSum);
					});
					/* 异步获取工作室id */
					$("div[class*='row'] p a.btn-primary").each(function(i, n){
						$(n).prop("href","${pageContext.request.contextPath}/room_BackRoomPage?roomId=" + data[i].roomId);
					});
				}
			});
			
		});
	</script>
</head>
<body>

	<div class="container-fluid">
	
		<div class="modal fade" style="maring-top:50px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">提示</h4>
					</div>
					<div class="modal-body">
						<p>信息以过期，请重新登录&hellip;</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">确定</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>
			<div class="col-md-12 column">
				<div class="carousel slide" id="carousel-142221">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-142221"></li>
						<li data-slide-to="1" data-target="#carousel-142221"></li>
						<li data-slide-to="2" data-target="#carousel-142221"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active left">
							<img src="${pageContext.request.contextPath }/img/new.png" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="item next left">
							<img alt="" src="${pageContext.request.contextPath }/img/new2.png" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="${pageContext.request.contextPath }/img/new3.png" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-142221"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-142221"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				
				<!-- 工作室列表开始 -->
				<div class="row" style="margin-top: 20px;">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="">详情</a> 
									<a class="btn" href="">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- 工作室列表结束 -->
				
				<!-- 页脚 -->
				<div class="col-md-12">
					<jsp:include page="workRoomFoot.jsp" />
				</div>
				
				<!-- 页脚结束 -->
			</div>
		</div>
	</div>

</body>
</html>