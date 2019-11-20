<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
  </head>
 <link rel="stylesheet" href="css/exam-user-login.css">
 <link href="css/font-awesome.min.css" rel="stylesheet" media="screen">
  <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
 <style type="text/css">
		
		i.fa { position: absolute; top: 26%; left: 1%; font-size: 20px;}
		.guide2 input {  text-indent: 20px;height: 40px; width: 300px;}
		.guide3 input{ text-indent: 20px;height: 40px; width: 300px; }
	</style>

	<body>
		<div class="main-start-interface" id="main-start-interface">
			
				<h3 class="guide1 positonAb">在线考试系统</h3>
				<b class="guide5 positonAb littleFinger" onclick="changeRoleToStudent()">考生登录</b> <b class="guide6 positonAb littleFinger" onclick="changeRoleToSystem()">管理员登录</b>
				<img src="img/img_0.png"  class="guide7 positonAb">
				<span id="showError" class="guide9 positonAb"></span>
				<form method="post" id="form_login">
				<div class="guide2 positonAb">
				<input type="text" name="name" value="" placeholder="用户名/手机号" /><i class="fa fa-user"></i>
				</div>
				<div class="guide3 positonAb">
					<input type="password" name="password" value="" placeholder="密码"/><i class="fa fa-lock"></i>
				</div>
				<input type="button" id=""  class="guide4 positonAb" value="登录" onclick="submitData()"/>
				<a href="register.jsp" class="guide8 positonAb littleFinger">没有账号,立即注册</a>
			</form>
			
		</div>
	</body>
	<script type="text/javascript">
		function submitData(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user_login.action",
				data:$("#form_login").serialize(),
				success:function(data){
					if(data=="true"){
						 window.location.href="index.jsp"; 
						/*  window.location.href = "exam/exam_insert.jsp";  */
						
					}else{
						var span_error = $("#showError");
						span_error.html("输入信息不正确");
						var i = 40;
						var time_0 = setInterval(function(){
							if(i>1){
								span_error.css("opacity",1);
								i-=1;
							}else if(i>0){
								span_error.css("opacity",i);
							i-=0.1;
							}else{
								span_error.html("");
								clearInterval(time_0);
							}
						},100);
					}
				}
			});
		}
		window.onkeydown = function(){
			var keyCode = this.event.keyCode;
			if(keyCode == 13){
				submitData();
			}
		}
		function changeRoleToSystem(){
			var form = $("input[name='name']");
			form.attr("placeholder","管理员用户名");
			sessionStorage.setItem("role", 1);
		}
		function changeRoleToStudent(){
			var form = $("input[name='name']");
			form.attr("placeholder","用户名/手机号");
			sessionStorage.setItem("role", 0);
		}
	</script>
</html>
