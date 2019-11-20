<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'List.jsp' starting page</title>
    <script type="text/javascript" src="jquery/jquery.min.js"></script>
    <script type="text/javascript">
    function load(){
    	if(sessionStorage.getItem("loginSuccess")){
    	alert("欢迎登录"+"${existUser.username}");
    	sessionStorage.removeItem("loginSuccess");
    	}
    }
    
    </script>
  </head>
  
  <body onload="load()">
  <label>${sessionScope.existUser.username}</label><a href="user/userHomepage.jsp">进入个人主页</a>
  <br>
  <a href="course/courseAdd.jsp"><input type="button" value="添加" id="add"></a>
  <table>
  </table>
  </body>
</html>
