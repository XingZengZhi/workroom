<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>简介</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
	.muted,.page-header{
		text-indent:0;
		text-align:left;
		line-height:30px;
		color:#999999;
	}
	.muted{
		font-size: 20px;
		max-width:450px;
	}
	.boss-header{
		color:black;
	}
	.boss-header h2{
		text-align:center;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>
			<!-- 简介内容 -->
			<div class="col-md-12">
				<div class="page-header boss-header">
					<h2>贵州师范学院大学生创新创业中心</h2>
				</div>
			</div>
			<div class="col-md-12" style="margin-top:100px;">
				<div class="col-md-7">
					<img style="width: 520px; height: 200px"
						src="${pageContext.request.contextPath }/img/about_p1.png" />
				</div>
				<div class="col-md-5">
					<div class="page-header">
						<h2>多人团队合作高效开发</h2>
					</div>
					<p class="lead muted">是一个分布式的版本控制系统，最初由编写，用作Linux内核代码的管理。在推出后，
						Git在其它项目中也取得了很大成功，尤其是在Ruby社区中。是一个分布式的版本控制系统，最初由编写，
						用作Linux内核代码的管理。在推出后</p>
				</div>
			</div>
			<div class="col-md-12" style="margin-top:100px;">
				<div class="col-md-6">
					<div class="page-header">
						<h2>信息资料学习内容共享</h2>
					</div>
					<p class="lead muted">是一个分布式的版本控制系统，最初由编写，用作Linux内核代码的管理。在推出后，
						Git在其它项目中也取得了很大成功，尤其是在Ruby社区中。是一个分布式的版本控制系统，最初由编写，
						用作Linux内核代码的管理。在推出后</p>
				</div>
				<div class="col-md-6">
					<img style="width: 520px; height: 200px"
						src="${pageContext.request.contextPath }/img/about_p2.png" />
				</div>
			</div>

			<div class="col-md-12">
				<jsp:include page="workRoomFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>