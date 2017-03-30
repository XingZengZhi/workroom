<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>工业物联网中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html,charset=utf-8">
<meta name="keywords" content="贵州师范学院,贵州师范学院物联网中心,创新创业中心,贵州师范学院创新创业中心">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/sj.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bannerList.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/index.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bannerList.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		/*=======================
		调用方法：
		传递参数方法如下：
		对象1：banner最大容器====================必填
		对象2：banner======>按钮父容器============必填
		对象3，4：banner====>左右按钮对象名===========必填
		对象5：banner滚动时间==================>可选项=======>默认为2000
		对象6：是否需要自动轮播需要==========true============不需要false:必填
		=============================*/
		bannerListFn($(".banner"), $(".img-btn-list"), $(".left-btn"),
				$(".right-btn"), 2000, true);

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/user_room",
			dataType : "json",
			success : function(data) {
				/* 异步获取工作室的名字 */
				$("div[class*='row'] h3").each(function(i, n) {
					$(n).text(data[i].roomName);
				});
				/* 异步获取工作室简介 */
				$("div[class*='row'] p.title").each(function(i, n) {
					$(n).text(data[i].roomSum);
				});
				/* 异步获取工作室id */
				$("div[class*='row'] p a.btn-primary").each(
						function(i, n) {
							$(n).prop(
									"href",
									"${pageContext.request.contextPath}/room_BackRoomPage?roomId="
											+ data[i].roomId);
						});
				/* 根据工作室id设置需要加入的工作室 */
				$("div[class*='row'] p a#sq").each(function(i, n){
					$(n).prop("href","${pageContext.request.contextPath}/room_GiveId?roomId=" + data[i].roomId);
				});
			}
		});

	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="modal fade" style="maring-top: 50px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">提示</h4>
					</div>
					<div class="modal-body">
						<p>信息以过期，请重新登录&hellip;</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">确定</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<div class="row-fluid" style="margin-top: 20px;">
			<div class="col-md-12">
				<jsp:include page="head.jsp" />
			</div>
			<div class="col-md-12 column">
				<div class="banner">
					<ul class="">
						<li><a href=""><img
								src="${pageContext.request.contextPath }/barnerimg/banner1.png"></a></li>
						<li><a href=""><img
								src="${pageContext.request.contextPath }/barnerimg/banner2.png"></a></li>
						<li><a href=""><img
								src="${pageContext.request.contextPath }/barnerimg/banner3.png"></a></li>
						<li><a href=""><img
								src="${pageContext.request.contextPath }/barnerimg/banner4.png"></a></li>
					</ul>
					<div class="left-btn"></div>
					<div class="right-btn"></div>
					<div class="img-btn-list"></div>
				</div>

				<!-- 工作室列表开始 -->
				<div class="row" style="margin-top: 20px;">
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="">简介</a> <a class="btn"
										href="" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3></h3>
								<p class="title"></p>
								<p>
									<a class="btn btn-primary" href="#">简介</a> <a class="btn"
										href="#" id="sq">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- 工作室列表结束 -->
				<!-- 页脚 -->
				<div class="col-md-12">
					<jsp:include page="workRoomFoot.jsp" />
				</div>
				<!-- 页脚结束 -->
			</div>
		</div>
	</div>

</body>
</html>