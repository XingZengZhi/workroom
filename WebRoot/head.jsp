<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function(){
		var href = window.location.href;
		$.each($(".nav li:not('.dropdown') a"),function(i,n){
			if(href == $(n).prop("href")){
				$(n).parent().addClass("active").siblings().removeClass("active");
			}else{
				$(n).parent().removeClass("active");
			}
		});
	});
</script>
<div class="row clearfix">
	<div class="col-md-12 column">
		<ul class="nav nav-pills" style="border-bottom:1px solid #ccc;">
			<li class="active"><a href="${pageContext.request.contextPath }/nav_index">首页</a></li>
			<li><a href="${pageContext.request.contextPath }/nav_apply">加入申请</a></li>
			<li><a href="${pageContext.request.contextPath }/nav_show">成果展区</a></li>
			<li><a href="${pageContext.request.contextPath }/nav_share">知识分享</a></li>
			<li><a href="${pageContext.request.contextPath }/nav_summary">关于我们</a></li>
			<li class="dropdown pull-right">
				<c:if test="${not empty exitUser}">
					<a href="#" data-toggle="dropdown" class="dropdown-toggle">${exitUser.userName }<strong
						class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li><a href="#">我的评论</a></li>
						<li><a href="${pageContext.request.contextPath }/user_Setting?username=${exitUser.userName }">个人资料设置</a></li>
						<li><a href="${pageContext.request.contextPath }/nav_mysharejsp">我的知识</a></li>
						<li><a href="${pageContext.request.contextPath }/nav_sharelorejsp">分享知识</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath }/user_exit">退出</a></li>
					</ul>
				</c:if> <c:if test="${empty exitUser}">
					<a
						href="${pageContext.request.contextPath }/user_registeJsp"
						style="display: inline-block;">注册</a>
					<a href="${pageContext.request.contextPath }/user_loginJsp"
						style="display: inline-block;">登录</a>
				</c:if></li>
		</ul>
	</div>
</div>