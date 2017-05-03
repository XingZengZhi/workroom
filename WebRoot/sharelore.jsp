<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<title>知识分享</title>
</head>
<body>
	<div class="container-fluid">

		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>
			
			<div class="col-md-12 column">
								
			</div>
			
			<!-- 页脚 -->
				<div class="col-md-12">
					<jsp:include page="workRoomFoot.jsp" />
				</div>
				<!-- 页脚结束 -->
		</div>
	</div>

</body>
</html>