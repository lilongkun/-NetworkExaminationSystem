<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'exam_test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${pageContext.request.contextPath }/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/quiz.js"></script>
<style type="text/css">
.demo{width:760px; margin:60px auto 10px auto}
</style>

<script type="text/javascript">

$(function(){
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/paper_searchPaper.action",
		data:"",
		success:function(data){
			 var init = {
					"questions":data.obj
			}; 
			
			 $("#quiz-container").jquizzy({
			        questions: init.questions
			    }); 
		}
		
	});
	
});
</script>
</head>

<body>

<div class="demo">
	<div id='quiz-container'></div>
</div>

</body>
  
</html>
