<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>申请管理</title>
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
<script src="${pageContext.request.contextPath }/js/dropdown.js"></script>
<script type="text/javascript">
	$(function(){
		$.post("${pageContext.request.contextPath}/user_room",function(data){
			for(var i = 0;i<data.length;i++){
				$("#dropDowns").append("<option value='"+data[i].roomId+"'>"+data[i].roomName+"</option>");
			}
		},"json");
	});
</script>
<style type="text/css">
	.dropdown-menu li:hover{
		cursor:pointer;
	}
	textarea{
		resize:none;
	}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="head.jsp" />
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form action="${pageContext.request. contextPath}/user_apply" method="POST">
				<input type="hidden" name="userId" value="${exitUser.userId }" />
				<div class="form-group">
					<label for="exampleInputEmail1">申请人</label> <input type="text"
						class="form-control"
						disabled="false" value="${exitUser.userName }">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">学号</label> <input type="text"
						class="form-control" placeholder="填写学号" name="userStuID">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">邮箱</label> <input type="text"
						class="form-control" placeholder="请误填写无效的邮箱" name="userEmail" />
				</div>
				<div class="btn-group form-group">
					<label>工作室</label><br>
					<select id="dropDowns" name="roomId">
						<option selected="selected">--------请选择工作室--------</option>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">申请缘由</label>
					<textarea rows="5" cols="70" placeholder="不能超过200字" name="userText"></textarea>
				</div>
				<button type="submit" class="btn btn-default">提交</button>
			</form>
		</div>
		<div class="col-md-4"></div>

	</div>
</body>
</html>