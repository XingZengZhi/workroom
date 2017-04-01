<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bgIndex.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bgIndex.js"></script>
</head>
<body>
	<div id="content">
		<div id="nav_link">
			<!--网站logo-->
			<div id="logo">
				<img src="${pageContext.request.contextPath }/bgimg/bglogo.png" />
			</div>
			<!--用户信息栏-->
			<div id="userMessage">
				<img src="${pageContext.request.contextPath }/bgimg/${Manager.mImg}"/>
				<p>欢迎您，${Manager.mName }</p>
				<a href="${pageContext.request.contextPath }/manager_removeManager">注销</a>
			</div>
			<!--导航链接-->
			<div id="links">
				<ul>
					<li id="UserManager"><img src="${pageContext.request.contextPath }/bgimg/yh.png" /> <a>用户管理</a></li>
					<li id="RoomManager"><img src="${pageContext.request.contextPath }/bgimg/hy.png" /> <a>工作室管理</a></li>
					<li id="ProductManager"><img src="${pageContext.request.contextPath }/bgimg/zp.png" /> <a>作品管理</a></li>
				</ul>
			</div>
		</div>

		<div id="nav_message" class="clearfix">
			<!--用户管理展示区-->
			<div id="userTables">
				<p>
					<a id="addUser"> <img src="${pageContext.request.contextPath }/bgimg/user_add.png" /> <span>用户查找</span>
					</a> <a id="deleteUser"> <img src="${pageContext.request.contextPath }/bgimg/user_delete.png" /> <span>用户删除</span>
					</a> <input type="text" id="deleteForm" placeholder=",分割可以删除更多" /> <span
						id="deleteBtn">确认删除</span> <input type="text" id="searchForm"
						placeholder="输入要查找的序号" /> <span id="searchBtn">查找</span>
				</p>
				<div id="userList">
					<span>学生序号</span> <span>学生名称</span> <span>学生学号</span> <span>电话号码</span>
					<span>注册时间</span> <span>所属工作室</span>
				</div>
				<div class="userListItem">
					<span>1</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<div class="userListItem">
					<span>2</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<div class="userListItem">
					<span>3</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<div class="userListItem">
					<span>4</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<div class="userListItem">
					<span>5</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<div class="userListItem">
					<span>6</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<div class="userListItem">
					<span>7</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<div class="userListItem">
					<span>8</span> <span>邢增智</span> <span>1306050540101</span> <span>18285017634</span>
					<span>2017-8-12</span> <span>大数据应用开发工作室</span>
				</div>
				<!--分页-->
				<div id="pageList">
					<div id="page">
						<span id="pageItem"> —> </span>
					</div>
				</div>
			</div>
			<!--工作室管理区-->
			<div id="roomTables">
				<div>
					<div id="updateRoomSum">
						<p>更改工作室详情</p>
						<input type="text" id="selectRoom" placeholder="请选择" />
						<button>更改</button>
						<textarea id="roomSumText" rows="8" cols="35" placeholder="请输入"></textarea>
					</div>
					<div id="applyList">
						<p>申请列表</p>
						<div id="applyUsers"></div>
					</div>
				</div>
				<div id="roomVisit">
					<p>工作室访问量</p>
				</div>
			</div>
			<!--作品管理展示区-->
			<div id="productTables">
				<div id="picture">
					<p>图片管理</p>
					<div id="pictureManager"></div>
				</div>
				<div id="videoManager">
					<p>视频管理</p>
					<div id="VideoManager"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
