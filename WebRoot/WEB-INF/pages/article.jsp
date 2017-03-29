<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>成果展示</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<script src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="/head.jsp" />
			</div>
			<div class="col-md-12" style="margin-top: 20px;">
				<h3 class="text-center text-info">${article.articleTitle }</h3>
				<p class="text-center muted">发表时间：${article.articleTime }</p>
				<p>
					${article.articleText }
				</p>
				<span class="label label-primary">文章所属：${article.room.roomName }</span>
			</div>
			<!-- 页脚 -->
			<div class="col-md-12">
				<jsp:include page="/workRoomFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>