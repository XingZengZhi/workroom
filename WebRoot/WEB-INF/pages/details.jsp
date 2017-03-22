<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div class="container">
		<jsp:include page="/head.jsp" />
		<div class="row clearfix" style="margin-top:20px;">
			<div class="row clearfix">
				<div class="col-md-2 column">
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#">简介</a></li>
						<li><a href="#">资讯</a></li>
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
					<p class="lead">
						<em>Git</em> 是一个分布式的版本控制系统，最初由 <strong>Linus Torvalds</strong>
						编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在 <small>Ruby</small>
						社区中。
					</p>
					
					<blockquote>
						<p style="font-weight:600;">
							职能
						</p>
					</blockquote>
					<p class="lead">
						${article.articleFunction }
					</p>
					
					<blockquote>
						<p style="font-weight:600;">
							承担项目
						</p>
					</blockquote>
					<p class="lead">
						${article.articleProject }
					</p>
					
					<blockquote>
						<p style="font-weight:600;">
							负责人及团队
						</p>
					</blockquote>
					<p class="lead">
						${article.articleTeam }
					</p>
					
					<blockquote>
						<p style="font-weight:600;">
							合作企业
						</p>
					</blockquote>
					<p class="lead">
						${article.articleEnterprise }
					</p>
					<span class="label label-primary">
						联系电话: ${article.articleTelphone }
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>