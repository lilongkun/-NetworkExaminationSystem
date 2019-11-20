<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <aside class="headDiv">
		<span id="existUser" class="head-userMessage">
		<c:if test="${empty existUser}">
              			您当前未登录!
              		</c:if>
					<c:if test="${not empty existUser}">
              			当前用户:${existUser.name}
              		</c:if>
		</span>
		<a href="${pageContext.request.contextPath}/user_showLoginViewByDeleteUser.action"><span class="head-exit">退出当前账号</span></a>
	</aside>

