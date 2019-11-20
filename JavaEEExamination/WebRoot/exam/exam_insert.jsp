<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'exam_insert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/exam-insert.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/layout-head.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/sidebar-menu.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"/>
	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/sidebar-menu.js"></script> 
	<style type="text/css">
		 
			.showError{
				font-size:10px;
				color: red;
				position: absolute;
				left:62%;
			} 
	
	</style>
  </head>
  <body>
<jsp:include   page="/layout/head.jsp" flush="true"/><jsp:include   page="/layout/left.jsp" flush="true"/>
		<div class="insert_div">
			<form id="form_savePaper" method="post" >
			<table >
				<tr>
					<td><select name="paperType" id="paperType" onchange="checkType()">
						<option value="2">--选择科目--</option>
						<option value="0">Java</option>
						<option value="1">JavaScript</option>
					</select><span id="paperTypeSpan"></span></td>
				</tr>
				<tr>
					<td><input type="text" name="questionName" id="" value="" placeholder="输入题目"/><span id="questionNameSpan" class="showError"></span></td>
				</tr>
				<tr>
					<td><input type="text" name="answerA" id="" value="" placeholder="输入答案A"/><span id="answerASpan" class="showError"></span></td>
				</tr>
				<tr>
					<td><input type="text" name="answerB" id="" value="" placeholder="输入答案B"/><span id="answerBSpan" class="showError"></span></td>
				</tr>
				<tr>
					<td><input type="text" name="answerC" id="" value="" placeholder="输入答案C"/><span id="answerCSpan" class="showError"></span></td>
				</tr>
				<tr>
					<td><input type="text" name="answerD" id="" value="" placeholder="输入答案D"/><span id="answerDSpan" class="showError"></span></td>
				</tr>
				<tr class="form-radio"><td>设置正确答案:</td>
					<td>A<input type="radio" name="correctAnswer" id="" value="A" onclick="checkCorrectAnswer()"/>
					B<input type="radio" name="correctAnswer" id="" value="B" onclick="checkCorrectAnswer()"/>
					C<input type="radio" name="correctAnswer" id="" value="C" onclick="checkCorrectAnswer()"/>
					D<input type="radio" name="correctAnswer" id="" value="D" onclick="checkCorrectAnswer()"/><span id="correctAnswerSpan"></span></td>
				</tr>
				<tr><td><input type="button" value="提交" onclick="submitData()"/></td></tr>
			</table>
			
					
			</form>
		</div>
	
	</body>
	
	<script type="text/javascript">
		function checkCorrectAnswer(){
			var correctAnswers = document.getElementsByName("correctAnswer");
			var span = document.getElementById("correctAnswerSpan");
			for(var i in correctAnswers){
				if(correctAnswers[i].checked){
					span.innerHTML = "";
					span.className = "fa fa-check-circle";
					return true;
				}
			}
			span.className = "";
			span.innerHTML = "选择一个答案";
			return false;
		}
		function checkType(){
			var types = document.getElementById("paperType");
			var span = document.getElementById("paperTypeSpan");
			if(types.value == 2){
				span.innerHTML = "请选择一个科目";
				span.className = "";
				return false;
			}
			span.innerHTML = "";
			span.className = "fa fa-check-circle";
			return true;
		}
		function checkField(){
			var fields = $("input[type='text']");
			for(var i = 0;i<fields.length;i++){
				var spanName = fields.eq(i).attr("name")+"Span";
				var span = $("#"+spanName);
				if(fields.eq(i).val()==""){	
					span.html("不能为空");
					span.attr("class","");
					return false;
				}
				span.html("");
				span.attr("class","fa fa-check-circle");
			}
			return true;
		}
		 function checkSub(){
			var success = false;
			checkField();
			checkType();
			checkCorrectAnswer();
			if(checkField()&&checkType()&&checkCorrectAnswer()){
				success = true;
			}
			return success;
		} 
		function submitData(){
			if(checkSub()){
				
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/paper_savePaper.action",
				data:$("#form_savePaper").serialize(),
				success:function(data){
					if(data=="true"){
						if(confirm("是否继续添加?")){
			
							window.location.reload();
						}else{
						 window.location.href="${pageContext.request.contextPath }/layout/left.jsp"; 
						}
					}else{
						alert("添加失败,刷新页面重新填写");
					}
				}
				
			});
			}else{
				
			}
		}
	</script>
	
</html>
