<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>
			
			<div class="col-md-12">
				<s:form action="fileUpload" method="post" enctype="multipart/form-data">
					<s:file name="upload" />
					<s:submit value="上传" />
				</s:form>
				<s:a href="download?filename=2.jpg">图片下载</s:a>
			</div>
			<div class="col-md-12">
				<jsp:include page="workRoomFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>