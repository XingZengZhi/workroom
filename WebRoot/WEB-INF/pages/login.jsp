<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<title>用户登录</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<jsp:include page="/head.jsp" />
		<div class="row clearfix" style="margin-top: 20px;">
			<div class="col-md-8 column">
				<img alt="140x140" src="${pageContext.request.contextPath }/img/image1.jpg" class="img-rounded" />
			</div>
			<div class="col-md-4 column">
				<form role="form"
					action="${pageContext.request.contextPath }/user_login"
					method="POST">
					<div class="form-group">
						<label for="exampleInputEmail1">用户名</label>
						<c:if test="${not empty error }">
						<label style="color:red;">${error }</label>
						</c:if>
						<input
							placeholder="请输入用户名" type="text" name="userName"
							class="form-control" id="exampleInputEmail1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密码</label><input
							placeholder="请输入密码" type="password" name="userPassword"
							class="form-control" id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" style="display:block;">验证码</label><input
							placeholder="输入验证码" type="text" id="checkCode"
							class="form-control" style="width:100px;display:inline-block;" />
						<img id="co" title="点击切换" alt="code" src="${pageContext.request.contextPath }/user_code" style="display:inline-block;"/>
					</div>
					<button type="submit" class="btn btn-default">登录</button>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(function(){
		var flag = 0;
		/* 与后台验证码对比 */
		function submitCode(){
			$.post("${pageContext.request.contextPath}/user_checkCode",{value:$("#checkCode").val()},function(data){
				if(data == 1){
					$("form").submit();
				}else{
					alert("验证码错误");
				}
			});
		}
		/* 刷新验证码 */
		$("#co").click(function(){
			$(this).prop("src","${pageContext.request.contextPath }/user_code?num="+Math.random());
		});
		$("button[type='submit']").click(function(){
			submitCode();
			return false;
		});
		/* 如果按下的为enter键，则进行登录 */
		$(document).keypress(function(event){
			var key = event.keyCode ? event.keyCode : event.whitch;
			if(key == '13'){
				submitCode();
			}
			return false;
		});
	});
</script>
</body>
</html>