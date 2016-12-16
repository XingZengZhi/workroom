<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>注册</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/checkInput.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/head.jsp" />
		<div class="row clearfix" style="margin-top: 20px;">
			<div class="col-md-8 column">
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p>This is a template for a simple marketing or informational
						website. It includes a large callout called the hero unit and
						three supporting pieces of content. Use it as a starting point to
						create something more unique.</p>
					<p>
						<a class="btn btn-primary btn-large" href="#">Learn more</a>
					</p>
				</div>
			</div>
			<div class="col-md-4 column">
				<form role="form"
					action="${pageContext.request.contextPath }/user_registe"
					method="POST">
					<div class="form-group">
						<label for="exampleInputEmail1">用户名</label>
						<span id="checName" style="margin-left:5px;"></span>
						<input
							placeholder="不能带有特殊符号，长度在5-16之间" type="text" class="form-control"
							id="exampleInputEmail1" name="userName" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密码</label>
						<span id="checkPassword" style="margin-left:20px;"></span>
						<input
							placeholder="密码长度不能少于4位数" name="userPassword" type="password" class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">确认密码</label>
						<span id="checkText" style="margin-left:20px;"></span>
						<input name="checkPassword" type="password" class="form-control" id="exampleInputPassword1" />
					</div>
					<button type="submit" class="btn btn-default">注册</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>