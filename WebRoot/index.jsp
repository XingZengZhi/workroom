<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>工业物联网中心</title>
<meta charset="utf-8">
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

<script
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<!-- <script type="text/javascript">
		$(function(){
			var name = "${exitUser.userName}";
			$(".modal-footer").click(function(){
				$(".modal").css("display","none");
				$(".fade").css("opacity","0");
			});
			if(name == ""){
				$(".modal").css("display","block");
				$(".fade").css("opacity","1");
			}
		});
	</script> -->
</head>
<body>

	<div class="container">
	
		<div class="modal fade" style="maring-top:50px;">
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

		<jsp:include page="/head.jsp" />
		<div class="row clearfix" style="margin-top: 20px;">
			<div class="col-md-12 column">
				<div class="carousel slide" id="carousel-142221">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-142221"></li>
						<li data-slide-to="1" data-target="#carousel-142221"></li>
						<li data-slide-to="2" data-target="#carousel-142221"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active left">
							<img src="${pageContext.request.contextPath }/img/new.png" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="item next left">
							<img alt="" src="${pageContext.request.contextPath }/img/new2.png" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="${pageContext.request.contextPath }/img/new3.png" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-142221"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-142221"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				
				<!-- 工作室列表开始 -->
				<div class="row" style="margin-top: 20px;">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3>智能开发工作室</h3>
								<p>为学生提供嵌入式智能设备开发平台，培养适应工业4.0时代需要的智能设备开发人才。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3>移动终端应用系统开发工作室</h3>
								<p>Web系统开发、手机APP开发（Android、IOS）。通过校企合作，以项目驱动的方式提升学生综合能力。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3>视觉设计工作室</h3>
								<p>Web系统开发、手机APP开发（Android、IOS）。通过校企合作，以项目驱动的方式提升学生综合能力。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3>泰迪大数据挖掘工作室</h3>
								<p>为学生提供嵌入式智能设备开发平台，培养适应工业4.0时代需要的智能设备开发人才。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3>软件测试工作室</h3>
								<p>为学生提供嵌入式智能设备开发平台，培养适应工业4.0时代需要的智能设备开发人才。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3>教育云平台开发工作室</h3>
								<p>为学生提供嵌入式智能设备开发平台，培养适应工业4.0时代需要的智能设备开发人才。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image1.jpg" />
							<div class="caption">
								<h3>教育大数据系统开发工作室</h3>
								<p>为学生提供嵌入式智能设备开发平台，培养适应工业4.0时代需要的智能设备开发人才。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image2.jpg" />
							<div class="caption">
								<h3>智能视屏分析系统开发工作室</h3>
								<p>为学生提供嵌入式智能设备开发平台，培养适应工业4.0时代需要的智能设备开发人才。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="${pageContext.request.contextPath }/img/image3.jpg" />
							<div class="caption">
								<h3>智能设计开发工作室</h3>
								<p>为学生提供嵌入式智能设备开发平台，培养适应工业4.0时代需要的智能设备开发人才。</p>
								<p>
									<a class="btn btn-primary" href="#">详情</a> <a class="btn"
										href="#">申请加入</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- 工作室列表结束 -->
				
				<!-- 页脚 -->
				<div class="row clearfix"
					style="margin-top: 20px; border-top: 1px solid royalblue; padding-top: 10px;">
					<div class="col-md-4 column">
						<ul>
							<li>Lorem ipsum dolor sit amet</li>
							<li>Consectetur adipiscing elit</li>
							<li>Integer molestie lorem at massa</li>
							<li>Facilisis in pretium nisl aliquet</li>
							<li>Nulla volutpat aliquam velit</li>
							<li>Faucibus porta lacus fringilla vel</li>
							<li>Aenean sit amet erat nunc</li>
							<li>Eget porttitor lorem</li>
						</ul>
					</div>
					<div class="col-md-4 column">
						<address>
							<strong>Twitter, Inc.</strong><br /> 795 Folsom Ave, Suite 600<br />
							San Francisco, CA 94107<br /> <abbr title="Phone">P:</abbr>
							(123) 456-7890
						</address>
					</div>
					<div class="col-md-4 column">
						<blockquote>
							<p>其实我们每个人的生活都是一个世界，即使最平凡的人也要为他生活的那个世界而奋斗。</p>
							<small>路遥</small>
						</blockquote>
					</div>
				</div>
				<!-- 页脚结束 -->
			</div>
		</div>
	</div>

</body>
</html>