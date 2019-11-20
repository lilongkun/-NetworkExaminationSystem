<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="css/exam-user-register.css">
  <!-- 声明css代码域 -->
		<style type="text/css">
		body{
			background-image: url(img/bgd3.jpg);
		}
		.user-errorMessage{
				position: absolute;
				left:50%;
				color:red;
				}
		</style>	
			
  <body onload="createCode()">
  <h4>考试系统注册页面</h4>
 <div id="registerDiv">
			<form action="" method="post" onsubmit=" return checkSub()">
				<table >
					<tr><label class="user-errorMessage"><c:if test="${empty registMessage}"></c:if>
  <c:if test="${not empty registMessage}">${registMessage}</c:if></label>
						<td width="80px" >用户名：</td>
						<td width="300px"><input type="text" name="name" id="uname" value="" onblur="checkUname()" onfocus="showMessage(this)" ><span id="unameSpan" mes="*3-16位的字母">*3-16位的字母	
						</span></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="password" id="pwd" value="" onblur="checkPwd()" onfocus="showMessage(this)"/><span id="pwdSpan" mes="开头为字母的8-16个字符">
							
						</span></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" id="cfmpwd" value="" onblur="checkCfmpwd()" onfocus="showMessage(this)"/><span id="cfmpwdSpan" mes="请再次输入密码">
							
						</span></td>
					</tr>
					<tr>
						<td>手机号：</td>
						<td><input type="text" name="phoneNumber" id="mbphone" value="" onblur="checkMbPhone()" onfocus="showMessage(this)"/><span id="mbphoneSpan" mes="请输入正确的手机号">
							
						</span></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td><input type="text" name="email" id="mail" value="" onblur="checkMail()" onfocus="showMessage(this)"/><span id="mailSpan" mes="请输入正确的邮箱地址">
							
						</span></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>男<input type="radio" name="gender" id="male" value="0" onclick="checkSex()"/>
							女<input type="radio" name="gender" id="female" value="1" onclick="checkSex()"/><span id="genderSpan" >
							
						</span>
						</td>
					</tr>

					<tr>
						<td>验证码：</td>
						<td><input type="text"   id="code" value="" onblur="checkCode()"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="createCodeSpan" onclick="createCode()" style="color: black;background-image:url(img/bgd2.jpg);">
							
						</span><span id="codeSpan" style="float: right;">
							
						</span></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="checkbox"  id="agree" value="" onclick="checkAgree()"/>是否同意本考试系统的相关协议</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" name="" id="regist" value="注册" disabled="disabled"/></td>
					</tr>
				</table>
			</form>
		</div>
  </body>
  <!-- 声明js代码域 -->
			<script type="text/javascript">
				/* 生成验证码 */
				function createCode(){
					//得到四位随机数
					var number = Math.floor(Math.random()*9000+1000);
					//获取显示验证码的span
					var codeSpan = document.getElementById("createCodeSpan");
					//在span中显示验证码
					codeSpan.innerHTML = number;
					//得到要获得焦点的文本框对象
					var text = document.getElementById("uname");
					//调用函数获得焦点
					text.focus();
				}
				/* 校验用户名 */
				function checkUname(){
					var uname = document.getElementById("uname");
					
					//生成校验规则
					var reg = /^[a-zA-Z]{3,16}$/;
					//调用函数进行校验
					return checkField("uname",reg);
				}
				/* 校验密码 */
				function checkPwd(){
					//生成校验规则
					// var reg = /^[a-zA-Z].{7,16}$/;//第一位为字母,其他为可以为数字,字母,和任意符号(包括空格)
					var reg = /^[a-zA-Z]\w{7,16}$/; //第一位为字母,其他为可以为数字,字母,和下划线
					return checkField("pwd",reg);
				}
				/* 校验确认密码 */
				function checkCfmpwd(){
					//获得第一次填写的密码
					var pwd = document.getElementById("pwd").value;
					//获取确认的密码
					var cfmpwd = document.getElementById("cfmpwd").value;
					//获取显示校验结果的Span
					var span = document.getElementById("cfmpwdSpan");
					//判断两次密码是否相同
					if(cfmpwd==""||cfmpwd==null){
						span.innerHTML = "不能为空";
						span.style.color = "red";
						return false;
					}else if(cfmpwd==pwd){
						span.innerHTML = "√";
						span.style.color = "green";
						return true;
					}else {
						span.innerHTML = "两次密码不一致";
						span.style.color = "red";
						return false;
					}
				}
				/* 校验手机号 */
				function checkMbPhone(){
					//生成校验规则
					var reg = /^1[3,4,5,7,8]\d{9}$/;
					//调用函数校验
					return checkField("mbphone",reg);
				}
				/* 校验邮箱 */
				function checkMail(){
					//生成校验规则
					var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+\.([a-zA-Z0-9_-])+$/;//(\.)正则表达式中匹配".","\"表示转义字符
					//调用函数校验
					return checkField("mail",reg);
				}
				/* 校验性别 */
				function checkSex(){
					//获得性别单选按钮对象数组
					var sexs = document.getElementsByName("gender");
					//获得显示校验结果的Span
					var span = document.getElementById("genderSpan");
					//判断是否有按钮被选择
					for(var i=0;i<sexs.length;i++){
						if(sexs[i].checked){
							span.innerHTML = "√";
							span.style.color = "green";
							return true;
						}
					}
					span.innerHTML = "请选择一个性别";
					span.style.color = "red";
					return false;
				}
				/* 校验验证码 */
				function checkCode(){
					//获取生成的验证码
					var createCode = document.getElementById("createCodeSpan").innerHTML;
					//获取填写的验证码
					var code = document.getElementById("code").value;
					//获取显示校验结果的Span
					var span = document.getElementById("codeSpan");
					//判断填写的验证码是否正确
					if(code==createCode){
						span.innerHTML = "√";
						span.style.color = "green";
						return true;
					}else{
						span.innerHTML = "验证码输入错误";
						span.style.color = "red";
						return false;
					}
				}
				/* 同意协议，解锁注册 */
				function checkAgree(){
					//获得数据提交按钮对象
					var agr = document.getElementById("agree");
					var sub = document.getElementById("regist");
					if(agr.checked){
						//设置注册按钮可提交
						sub.disabled = false;
					}else{
						sub.disabled = true;
					}
				}
				/* 提交校验 */
				function checkSub(){
					var success = false;
					var form = $("form");
					checkUname();
					checkPwd();
					checkCfmpwd();
					checkMbPhone();
					checkMail();
					checkSex();
					checkCode();
					if(checkUname()&&checkPwd()&&checkCfmpwd()&&checkMbPhone()&&checkMail()&&checkSex()&&checkCode()){
						success = true;
						var role = 0;
						
						if(JSON.stringify(sessionStorage) != "{}"&&sessionStorage.getItem("role") != null){
							role = sessionStorage.getItem("role");
							
							sessionStorage.removeItem("role");
						}
						
						var url = "${pageContext.request.contextPath}/user_register.action?role="+role;
						form.attr("action",url);
						
					}
					
					return success;
				}
				function showMessage(e){
					var span = document.getElementById(e.id+"Span");
					span.style.color = "white";
					span.innerHTML = span.getAttribute("mes");
				}
/* ----------------------------------------------------------------------------------------------------------------------------------- */
			  /* 封装相似校验的函数*/
			function checkField(id,reg){
				//获取要校验值
				var val = document.getElementById(id).value;
				//获取显示校验信息的span
				var span = document.getElementById(id+"Span");
				if(val==""||val==null){
					span.innerHTML = "不能为空";
					span.style.color = "red";
					return false;
				}else if(reg.test(val)){
					span.innerHTML = "√";
					span.style.color = "green";
					return true;
				}else{
					span.innerHTML = "不符合规则，请重新输入";
					span.style.color = "red";
					return false;
				}
			}
			</script>
</html>
