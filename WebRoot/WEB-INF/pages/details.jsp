<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="${pageContext.request.contextPath}/head.jsp" />
		<div class="row clearfix">
			<div class="row clearfix">
				<div class="col-md-2 column">
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#">首页</a></li>
						<li><a href="#">简介</a></li>
						<li class="disabled"><a href="#">信息</a></li>
						<li class="dropdown pull-right"><a href="#"
							data-toggle="dropdown" class="dropdown-toggle">下拉<strong
								class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">操作</a></li>
								<li><a href="#">设置栏目</a></li>
								<li><a href="#">更多设置</a></li>
								<li class="divider"></li>
								<li><a href="#">分割线</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="col-md-10 column">
					<h3 class="text-center text-success">h3. 这是一套可视化布局系统.</h3>
					<p class="text-center">
						<em>Git</em> 是一个分布式的版本控制系统，最初由 <strong>Linus Torvalds</strong>
						编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在 <small>Ruby</small>
						社区中。
					</p>
					<p class="lead">
						<em>Git</em> 是一个分布式的版本控制系统，最初由 <strong>Linus Torvalds</strong>
						编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在 <small>Ruby</small>
						社区中。
					</p>
					<span class="label label-default">标签</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>