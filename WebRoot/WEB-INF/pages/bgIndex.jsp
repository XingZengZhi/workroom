<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bgIndex.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bgIndex.js"></script>
<script type="text/javascript">
	$(function() {
		SendAjaxByPage(1);
		//根据id删除用户
		function DeleteUserForId(uid) {
			$.post("${pageContext.request.contextPath}/manager_deleteUser", {
				"uid" : uid
			}, function(data) {
				//刷新用户列表
				SendAjaxByPage(1);
			});
		}
		//根据ajax返回对象提取用户信息
		function GetJsonForData(data) {
			if (data.length == 1) {
				$(".userListItem").remove();
			}
			for (var i = 0; i < data.length; i++) {
				var month = parseInt(data[i].userRegistTime.month);
				month += 1;
				$(
						"<div class='userListItem'>" + "<span id='uid'>"
								+ data[i].userId + "</span>" + "<span>"
								+ data[i].userName + "</span>" + "<span>"
								+ data[i].userStuID + "</span>" + "<span>"
								+ data[i].userPhone + "</span>" + "<span>"
								+ month + "月" + data[i].userRegistTime.date
								+ "号" + "</span>" + "</div>").insertBefore(
						"#pageList");
			}
			//读取每个用户所在工作室
			window.setTimeout(function() {
				$.each(data,function(i, n) {
					$.post("${pageContext.request.contextPath}/manager_GetUserRoom",{"userId" : data[i].userId},function(data) {
								//选择对应的item
								$(".userListItem:eq("+ i+ ")").append("<span>"+ data+ "</span>");
							}, "text");
				});
			}, 100);
		}

		//根据页数发送ajax
		function SendAjaxByPage(page) {
			//异步获取用户总数
			var count = 0;
			$.ajax({
				type : "POST",
				dataType : "text",
				url : "${pageContext.request.contextPath}/manager_PageCount",
				success : function(data) {
					$("#pageList #max").text(data);
					var count = parseInt($("#max").text())
					if (page == 1) {
						if (count > 8) {
							$page.fadeIn();
						}
					}
				}
			});
			//清空分页再发ajax
			$(".userListItem").remove();
			$.post("${pageContext.request.contextPath}/manager_UserPage", {
				"pageIndex" : page,
				"pageSize" : 8
			}, function(data) {
				GetJsonForData(data);
			}, "json");
		}

		//根据名称查询用户
		var $searchBtn = $("#searchBtn");
		$searchBtn
				.click(function() {
					var name = $("#searchForm").val();
					if (name == "") {
						SendAjaxByPage(1);
					} else {
						$
								.post(
										"${pageContext.request.contextPath}/manager_FindUserByName",
										{
											"uName" : name
										}, function(data) {
											GetJsonForData(data);
										}, "json");
					}
				});

		//根据id数组解析要删除的用户id
		var $deleteBtn = $("#deleteBtn");
		$deleteBtn.click(function() {
			var ids = $("#deleteForm").val();
			if (ids != "") {
				if (ids.indexOf(",") > 0) {
					$pageleft.fadeOut().animate({
						left : 400 + 'px'
					});
					$page.animate({
						left : 450 + 'px'
					});
					$("#pageList #min").text(1);
					DeleteUserForId(ids);
				} else {
					$pageleft.fadeOut().animate({
						left : 400 + 'px'
					});
					$page.animate({
						left : 450 + 'px'
					});
					$("#pageList #min").text(1);
					DeleteUserForId(ids);
				}
			} else {
				alert("不能为空！");
			}
		});

		//分页按钮
		var $pageleft = $("#pageleft");
		var $page = $("#page");
		var pageSize = 8;//每页的条数
		$page.click(function() {
			var min = parseInt($("#pageList #min").text());
			var max = Math
					.ceil(parseInt($("#pageList #max").text()) / pageSize);
			min++;
			$("#pageList #min").text(min);
			if (min > 1 && min <= max) {
				$page.animate({
					left : 500 + 'px'
				});
				$pageleft.fadeIn();
			}
			if (min > max) {
				min = max;
			}
			/*等于最大分页数时，向右标志消失*/
			if (min == max) {
				$pageleft.animate({
					left : 450 + 'px'
				});
				$page.fadeOut(100);
			}
			SendAjaxByPage(min);
		});
		$pageleft.click(function() {
			var min = parseInt($("#pageList #min").text());
			var max = parseInt($("#pageList #max").text());
			min--;
			$("#pageList #min").text(min);
			if (min < 1) {
				min = 1;
			}
			if (min >= 1 && min < max) {
				$pageleft.animate({
					left : 400 + 'px'
				});
				$page.fadeIn();
			}
			/*等于第一页时，向左标志消失*/
			if (min == 1) {
				$pageleft.fadeOut(100);
				$page.animate({
					left : 450 + 'px'
				});
			}
			SendAjaxByPage(min);
		});
		
		//工作室模块下拉列表
		$.post("${pageContext.request.contextPath}/user_room", function(data) {
			var dataArr = new Array(data.length);//存储每个工作室名称
			var dataCount = new Array(data.length);//每个工作室的计数
			for (var i = 0; i < data.length; i++) {
				$("#items").append("<p>" + data[i].roomName + "</p>");
				dataArr[i] = data[i].roomName;//获得工作室名并存入数组
				dataCount[i] = data[i].roomId;//获得工作室id并存入数组
			}
			$.post("${pageContext.request.contextPath}/room_GetRoomCounts",{"dataCount":dataCount.toString()},function(data){
				//3:1,2:1,1:1,7:1,6:1,5:1,4:1,9:1,8:1
				var OneArr = data.split(",");
				var counts = new Array(OneArr.length);
				for(var i = 0;i<OneArr.length;i++){
					var TwoArr = OneArr[i].split(":");
					var index = parseInt(TwoArr[0]) - 1;
					counts[index] = parseInt(TwoArr[1]);//将对应的工作室id存入访问数量
				}
				
				// 基于准备好的dom，初始化echarts实例
		        var myChart = echarts.init(document.getElementById('dataShow'));
		        // 指定图表的配置项和数据
		        var option = {
		            title: {
		                text: '一周访问量'
		            },
		            tooltip: {},
		            legend: {
		                data:['访问量']
		            },
		            xAxis: {
		                data: dataArr
		            },
		            yAxis: {},
		            series: [{
		                name: '访问量',
		                type: 'bar',
		                data: counts
		            }]
		        };
		        // 使用刚指定的配置项和数据显示图表。
		        myChart.setOption(option);
			},"text");
			
			//工作室模块
			var $one = $("#one");//获取一个下拉选项
			var $items = $("#items");//获取下拉子选项盒子
			var $itemsP = $("#items p");//获取下拉子选项
			var $xe = $("#xe");//获取第一个选项中的值的DOM
			$one.click(function(){
				$items.stop().fadeToggle(500);
			});
			$itemsP.click(function(){
				$xe.text($(this).text());//将子选项的值复制给第一个选项的值
				$items.fadeOut(100);//将子选项的盒子隐藏
			});
			
	        
		}, "json");
		//更改工作室详情按钮事件
		var $button = $("#updateRoomSum button");
		var $roomSumText = $("#roomSumText");
		$button.click(function(){
			if($roomSumText.val() == ""){
				alert("不能为空");
			}else{
				/* 发送ajax更新工作室详情 */
				$.post("${pageContext.request.contextPath}/room_ChangeRoomSum",{"roomName":$("#xe").text(),"roomSum":$roomSumText.val()},function(data){
					if(data != ""){
						alert("更新成功");
					}else{
						alert("更新失败，请检查输入的内容或选项");
					}
				},"text");
			}
		});

	});
</script>
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
				<img src="${pageContext.request.contextPath }/bgimg/${Manager.mImg}" />
				<p>欢迎您，${Manager.mName }</p>
				<a href="${pageContext.request.contextPath }/manager_removeManager">注销</a>
			</div>
			<!--导航链接-->
			<div id="links">
				<ul>
					<li id="UserManager" class="liActive"><img
						src="${pageContext.request.contextPath }/bgimg/yh.png" /> <a>用户管理</a></li>
					<li id="RoomManager"><img
						src="${pageContext.request.contextPath }/bgimg/hy.png" /> <a>工作室管理</a></li>
					<li id="ProductManager"><img
						src="${pageContext.request.contextPath }/bgimg/zp.png" /> <a>作品管理</a></li>
				</ul>
			</div>
		</div>

		<div id="nav_message" class="clearfix">
			<!--用户管理展示区-->
			<div id="userTables">
				<p>
					<a id="addUser"> <img
						src="${pageContext.request.contextPath }/bgimg/user_add.png" /> <span>用户查找</span>
					</a> <a id="deleteUser"> <img
						src="${pageContext.request.contextPath }/bgimg/user_delete.png" />
						<span>用户删除</span>
					</a> <input type="text" id="deleteForm" placeholder=",分割可以删除更多" /> <span
						id="deleteBtn">确认删除</span> <input type="text" id="searchForm"
						placeholder="输入要查找的名称" /> <span id="searchBtn">查找</span>
				</p>
				<div id="userList">
					<span>学生序号</span><span>学生名称</span><span>学生学号</span><span>电话号码</span><span>注册时间</span><span>所属工作室</span>
				</div>
				<!--分页-->
				<div id="pageList">
					<span id="max"></span> <span id="min">1</span>
					<div id="pageleft">
						<span id="pageItem"> &lt;— </span>
					</div>
					<div id="page">
						<span id="pageItem"> —&gt; </span>
					</div>
				</div>
			</div>
			<!--工作室管理区-->
			<div id="roomTables">
				<div>
					<div id="updateRoomSum">
						<p>更改工作室详情</p>
						<div id="selector">
							<p id="one">
								<span id="xe">下拉选择</span><span id="re"></span>
							</p>
							<div id="items"></div>
						</div>
						<button>更改</button>
						<textarea id="roomSumText" rows="8" cols="35" placeholder="请输入"></textarea>
					</div>
					<!-- <div id="applyList">
						<p>申请列表</p>
						<div id="applyUsers">
							
						</div>
					</div> -->
				</div>
				<div id="roomVisit">
					<p>工作室访问量</p>
					<div id="dataShow"></div>
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
