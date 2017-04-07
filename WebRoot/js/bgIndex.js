$(document).ready(function(){
	//侧栏js
	var $UserManager = $("#UserManager"); //用户管理按钮
	var $RoomManager = $("#RoomManager"); //工作室管理按钮
	var $ProductManager = $("#ProductManager");//作品管理按钮
	
	$UserManager.click(function(){
		navClick($("#userTables"));
		$(this).addClass("liActive").siblings().removeClass("liActive");
	});
	$RoomManager.click(function(){
		navClick($("#roomTables"));
		$(this).addClass("liActive").siblings().removeClass("liActive");
	});
	$ProductManager.click(function(){
		navClick($("#productTables"));
		$(this).addClass("liActive").siblings().removeClass("liActive");
	});
	
	function navClick(e){ //模块切换
		e.fadeIn().siblings().fadeOut();
	}
	//用户模块
	var $addUser = $("#addUser");
	var $deleteUser = $("#deleteUser");
	$addUser.click(function(){
		btns($("#searchBtn"), $("#searchForm"));
	});
	$deleteUser.click(function(){
		btns($("#deleteBtn"), $("#deleteForm"));
	});
	function btns(e1, e2){
		if(e1.css("display") == "none" && e2.css("display") == "none"){
			e1.fadeIn();
			e2.fadeIn();
		}else{
			e1.fadeOut();
			e2.fadeOut();
		}
	}
});
