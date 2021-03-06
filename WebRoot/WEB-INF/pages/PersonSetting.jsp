<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/PersonCSS.css">
<script 
	src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资料设置</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="/head.jsp" />
			</div>
			
			<div class="col-md-12" id="FormContent">
				<form action="${pageContext.request.contextPath }/user_ChangeMessage" method="POST" id="ChangeForm">
					<ul>
						<li>
							<span>用户名</span>
							<input type="text" name="userName" value="${user.userName }" readonly="readonly" />
						</li>
						<li>
							<span>手机号</span>
							<input type="text" name="userPhone" />
						</li>
						<li>
							<input type="submit" value="确认修改" />
						</li>
					</ul>
				</form>
			</div>
			
			<div class="col-md-12">
					<jsp:include page="/workRoomFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>