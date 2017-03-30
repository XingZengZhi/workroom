<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>后台管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bgLogin.css" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/sha1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bgLogin.js"></script>
</head>
<body>
	<div id="content">
		<div id="bglogin">
			<div id="head">
				<img src="${pageContext.request.contextPath }/bgimg/1.jpg"
					title="点击切换头像" />
			</div>
			<div id="rg_lg">
				<div id="tip"></div>
				<!--登录-->
				<div id="login">
					<form id="loginForm" action="${pageContext.request.contextPath }/manager_findManager" method="post">
						<input type="text" name="mName" id="uName" placeholder="输入用户名" />
						<input type="password" name="mPass" id="uPass" placeholder="输入密码" />
						<p id="for_rg">
							<a id="forget">忘记密码？</a> <a id="rg">注册</a>
						</p>
						<span id="remeber"> <i></i>
						</span> <span id="me"> 记住我？ </span> <input type="submit" value="登录"
							id="loginBtn" />
					</form>
				</div>
				<!--注册-->
				<div id="register">
					<form action="" method="post" id="registerForm">
						<input type="text" name="uName" id="ruName" placeholder="输入用户名" />
						<input type="password" name="uPass" id="ruPass" placeholder="输入密码" />
						<input type="password" name="ruPass" id="ruPassword"
							placeholder="确认密码" /> <span id="have"> 已有帐号？登录 </span> <input
							type="submit" value="注册" id="registerBtn" />
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>