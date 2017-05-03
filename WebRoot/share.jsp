<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/share.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<title>知识分享</title>
<script type="text/javascript">
	$(function(){
		$.post("${pageContext.request.contextPath}/article_returnAllArticleNoRoom",function(data){
			console.log(data);
			for(var i = 0;i<data.length;i++){
				$("#shareItem").append("<div id='share-item'>" +
						"<p>" +
							"<a href='${pageContext.request.contextPath}/article_roomArticle?articleid=" + data[i].articleId +"'>" + data[i].articleTitle +"</a>" +
							"<span>作者:" + data[i].articleResouce + "</span>" +
						"</p>" +
						"<p> 发布时间:" + data[i].articleTime + "</p>" +
							 
						"<div id='article-share'>" +
							"<a href='${pageContext.request.contextPath}/article_roomArticle?articleid="+ data[i].articleId +"'>"+ data[i].articleText.substring(0, 100) +"</a>" +
						"</div>" +
				"</div>");
			}
		},"json");
	});
</script>
</head>
<body>
	<div class="row-fluid" style="margin-top: 20px;">
		<div class="col-md-12">
			<jsp:include page="head.jsp" />
		</div>
		
		<div class="col-md-12 column" id="shareItem">
		</div>
		
		<!-- 页脚 -->
		<div class="col-md-12">
			<jsp:include page="workRoomFoot.jsp" />
		</div>
		<!-- 页脚结束 -->
	</div>
</body>
</html>