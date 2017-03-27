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
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/apply.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/dropdown.js"></script>
<script type="text/javascript">
$(function(){
	var actionHref = $("form").attr("action");
	// 返回所有工作室名字
	$.post("${pageContext.request.contextPath}/user_room",function(data){
		for(var i = 0;i<data.length;i++){
			$("#dropDowns").append("<option value='"+data[i].roomId+"'>"+data[i].roomName+"</option>");
		}
	},"json");
	//判断是否有用户登录才能注册
	$("button[type='submit']").click(function(){
		if("${exitUser.userName}" == ""){
			alert("请先登录！");
			return false;
		}else{
			//更新actionHref
			actionHref = $("form").attr("action");
			/* 判断学号是否为空 */
			if($("#userStuID").val() != ""){
				actionHref = actionHref + "&userStuID=" + $("#userStuID").text();
			}else{
				alert("请填写学号！");
				return false;
			}
			/* 判断手机号是否为空 */
			if($("#userPhone").val() != ""){
				var reg = /\d{3}-\d{8}|\d{4}-\{7,8}/;
				/*开始手机号校验，如果校验通过才能进行actionHref拼接 */
				if(reg.test($("#userPhone").val())){
					actionHref = actionHref + "&userPhone=" + $("#userPhone").val();
				}else{
					alert("你手机号有误！");
					return false;
				}
			}else{
				alert("请填写手机号！");
				return false;
			}
			//判断申请缘由不能为空
			if($("#userText").val() != ""){
				actionHref = actionHref + "&userText=" + $("#userText").val();
			}else{
				alert("请填写申请缘由！");
				return false;
			}
			//设置新actionHref
			$("form").attr("action",actionHref);
		}
	}); 
	//选中工作室时将option至为selected状态
	$("#dropDowns").change(function(){
		$(this).find("option:checked").attr("selected",true).siblings().attr("selected",false);
		var roomId = $(this).find("option:checked").attr("value");
		$("form").attr("action",actionHref + "&roomId=" + roomId);
	});
	//根据首页发送的roomId自动选择下拉选项中的值
	var roomid = "${roomId}";
	//用window.setTimeout解决延迟读取roomid值的问题
	window.setTimeout(function(){
		if(roomid != ""){
			$("#dropDowns option").each(function(i, n){
				if($(n).attr("value") == roomid){
					$(n).attr("selected",true);
				}
			});
			//设置roomid
			$("form").attr("action",actionHref + "&roomId=" + roomid);
		}
	}, 100);
	
});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>
			<div class="col-md-4">
				<blockquote id="blockquoteTop">
					<p>申请信息填写</p>
				</blockquote>
			</div>
			<div class="col-md-4">
				<form style="margin-top:70px;" 
						action="${pageContext.request. contextPath}/room_UserRoom?userId=${exitUser.userId }" method="POST">
					<div class="form-group">
						<label for="exampleInputEmail1">申请人</label> <input type="text"
							class="form-control" value="${exitUser.userName }" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">学号</label> <input type="text"
							class="form-control" id="userStuID" placeholder="学号" name="userStuID">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">手机号</label> <input type="text"
							class="form-control" id=""userPhone"" placeholder="手机号" name="userPhone" />
					</div>
					<div class="btn-group form-group">
						<label>工作室</label><br>
						<select id="dropDowns" name="room">
							<option>请选择工作室</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">申请缘由</label>
						<textarea rows="8" cols="50" id="userText" placeholder="不能超过200字" name="userText"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">确认并提交</button>
				</form>
			</div>
			<div class="col-md-4"></div>
			<!-- 页脚 -->
			<div class="col-md-12">
				<jsp:include page="workRoomFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>