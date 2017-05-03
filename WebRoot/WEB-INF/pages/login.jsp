<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<title>用户登录</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/login.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="/head.jsp" />
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column" style="margin-top: 80px;">
					<div class="jumbotron">
						<img src="${pageContext.request.contextPath }/barnerimg/loginBarner.jpg" />
						<h2>你以为人工智能真能超越人类？大错特错！</h2>
						<p>
						我听到这样一种说法：未来，计算机主导的人工智能将比我们聪明得多，
						甚至会夺走我们所有的工作和资源，人类则会走向灭亡。果真如此吗？
						</p>
						<p>
							<a class="btn btn-primary btn-large" href="#">详情</a>
						</p>
					</div>
				</div>
				<div class="col-md-4 column" style="margin-top: 80px;">
					<form role="form" action="${pageContext.request.contextPath }/user_login" method="POST">
						<div class="form-group">
							<label for="exampleInputEmail1">用户名</label>
							<c:if test="${not empty error }">
							<label style="color:red;">${error }</label>
							</c:if>
							<input placeholder="请输入用户名" type="text" name="userName" class="form-control" id="exampleInputEmail1" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">密码</label>
							<input placeholder="请输入密码" type="password" name="userPassword" class="form-control" id="exampleInputPassword1" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1" style="display:block;">验证码</label>
							<input placeholder="输入验证码" type="text" id="checkCode" class="form-control" style="width:100px;display:inline-block;" />
							<img id="co" title="点击切换" alt="code" src="${pageContext.request.contextPath }/user_code" style="display:inline-block;"/>
						</div>
						<button type="submit" class="btn btn-primary">登录</button>
					</form>
				</div>
			</div>
			<div class="col-md-12">
				<jsp:include page="/workRoomFoot.jsp" />
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(function(){
		var flag = 0;
		/* 与后台验证码对比 */
		function submitCode(){
			$.post("${pageContext.request.contextPath}/user_checkCode",{"value":$("#checkCode").val()},function(data){
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
	});
</script>
</body>
</html>