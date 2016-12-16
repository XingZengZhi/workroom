/**
 * 验证用户名是否合法和用户密码
 */
$(function(){
	var d = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
	var flag1 = false, flag2 = false;
	$("button[type='submit']").prop("disabled",true);
	$userName = $("input[name='userName']");
	$userPassword = $("input[name='userPassword']");
	$checkPassword = $("input[name='checkPassword']");
	$userName.blur(function(){ 
		if($(this).val() != ""){
			if($(this).val().length >= 6){
				if(d.test($(this).val())){
					$.ajax({
						type:"POST",
						dataType:"text",
						url:"/WorkRoom/user_checkInput",
						data:"userName=" + $(this).val(),
						success:function(data){
							if(parseInt(data) == 1){
								$("#checName").text("用户名以存在").css("color","red");
								flag1 = false;
							}else{
								$("#checName").text("可以注册").css("color","green");
								flag1 = true;
							}
						}
					});
				}else{
					$("#checName").text("字母开头，允许5-16字节，允许字母数字下划线").css("color","red");
					flag1 = false;
				}
			}else{
				$("#checName").text("长度不够").css("color","red");
				flag1 = false;
			}
		}else{
			$("#checName").text("不能为空").css("color","red");
			flag1 = false;
		}
		
	});
	$checkPassword.blur(function(){
		if($userPassword.val().length > 4){
			if($checkPassword.val() != $userPassword.val()){
				$("#checkText").text("两次密码输入不相同").css("color","red");
				flag2 = false;
			}else{
				$("#checkText").text("");
				flag2 = true;
				if(flag1 && flag2){
					$("button[type='submit']").prop("disabled",false);
				}
			}
		}
	});
	
});