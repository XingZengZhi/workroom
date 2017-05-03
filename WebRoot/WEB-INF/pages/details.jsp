<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>详情</title>
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
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top:20px;">
			<div class="col-md-12">
				<jsp:include page="/head.jsp" />
			</div>
			<div class="col-md-2 column">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="${pageContext.request.contextPath }/nav_show">资讯</a></li>
					<li><a href="#">资料下载</a></li>
				</ul>
			</div>
			<div class="col-md-10 column">
				<h3 class="text-center text-success">${article.articleTitle}</h3>
				<p class="text-center">
					发布时间：<em>${article.articleTime}</em>
				</p>
				<p class="text-left">
					<em>来源：${article.articleResouce }</em>
				</p>
	
				<blockquote>
					<p style="font-weight: 600;">职能</p>
				</blockquote>
				<p class="lead">${article.articleFunction }</p>
	
				<blockquote>
					<p style="font-weight: 600;">承担项目</p>
				</blockquote>
				<p class="lead">${article.articleProject }</p>
	
				<blockquote>
					<p style="font-weight: 600;">负责人及团队</p>
				</blockquote>
				<p class="lead">${article.articleTeam }</p>
	
				<blockquote>
					<p style="font-weight: 600;">合作企业</p>
				</blockquote>
				<p class="lead">${article.articleEnterprise }</p>
				<span class="label label-primary"> 联系电话:
					${article.articleTelphone } </span>
				</div>
			<!-- 页脚 -->
			<div class="col-md-12">
				<jsp:include page="/workRoomFoot.jsp" />
			</div>
		<!-- 页脚结束 -->
		</div>
	</div>
</body>
</html>