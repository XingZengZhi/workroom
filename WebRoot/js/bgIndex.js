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
	//图片上传按钮
	var $button = $("#picture button:eq(0)");
	var $file = $("#picture input[type='file']");
	$button.click(function(){
		$file.click();
		$file.change(function(){
			FileChange(this);
		});
	});
	//继续上传按钮
	$("#btn2").click(function(){
		$file.click();
		$file.change(function(){
			FileChange(this);
		});
	});
	
	function FileChange(target){
		var fileSize = 0;
		fileSize = target.files[0].size;//获取文件大小，字节为单位
		var size = fileSize / 1024;
		
		var name = target.value;//获得文件名
		var filename = name.substring(name.lastIndexOf('.')+1).toLowerCase();
		/*image/jpeg,image/gif,image/bmp,image/png,image/jpg*/
		if(size > 2000){
			alert("文件不能超过2M");
			target.value = "";//若文件超过大小，则将文件输入框的值置为空
			return;
		}else if(filename !="jpg" && filename !="jpeg" && filename !="png" && filename !="bmp" && filename !="gif"){
			 alert("请选择图片格式文件上传(jpg,png,gif,bmp,jpeg等)！");
	         target.value="";
	         return;
		}else{
			$("#btn1").fadeOut();
			$("#btn2").fadeIn();
			$("#btn3").fadeIn();
		}
	
	}
});
