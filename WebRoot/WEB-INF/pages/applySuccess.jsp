<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css">
<title>提交申请成功</title>
<style type="text/css">
	.success{
		margin:30px auto;
		display:block;
		width:700px;
		height:400px;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="/head.jsp" />
			</div>
			<div class="col-md-12">
				<div class="alert-info">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<h4>
						提示!
					</h4> 
					<p>您的申请已提交 ，请等待管理员审核！（工作休息除外）</p>
				</div>
				<img class="success" title="提交审核成功" src="${pageContext.request.contextPath }/img/success.png" />
			</div>
			<div class="col-md-12">
				<jsp:include page="/workRoomFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>