<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'exam_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${pageContext.request.contextPath }/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/exam-list.css"/>
  <style type="text/css">
  	table{table-layout: fixed;word-break: break-all; word-wrap: break-word;}
  	td{width:400px;}
  	tr[name='tr-main']{
  		height:65px;
  	}
  	
  </style>
  </head>
  
  <body>
   <div class="list-div">
			<div class="list-div-head">
				<label class="list-div-head-bar1 checked" onclick="changeToJava()">java</label>
				<label class="list-div-head-bar2 unchecked" onclick="changeToJavaScript()">javascript</label>
			</div> 
			<div class="list-div-main">
				<table border="1px" class="show-paper">
					<tr id="tr-head">
						<th>题目</th>
						<th>答案A</th>
						<th>答案B</th>
						<th>答案C</th>
						<th>答案D</th>
						<th>正确答案</th>
						<th>操作</th>
					</tr>
				</table>
			</div>
		</div>
  </body>
  <script type="text/javascript">
  var paperTypes = [];
  paperTypes[0] = 0;
  paperTypes[1] = 1;
  var paperList_java = null;
  var paperList_javaScript = null;
  var paperTr = $("#tr-head");
  function getPaperList(){
	  $.ajax({
		  type:"post",
		  url:"${pageContext.request.contextPath}/paper_getPaperList.action?paperTypes="+paperTypes,
		  dataType: "json",
		  success:function(data){
			  paperList_java = data[0].obj;
			  paperList_javaScript = data[1].obj;
			  var length = paperList_java.length;
			  var str = "";
			  for(var i = 0;i<length;i++){
				  str += "<tr name='tr-main'><td>"+paperList_java[i].questionName+"</td><td>"+paperList_java[i].answerA+"</td><td>"+paperList_java[i].answerB+"</td><td>"+paperList_java[i].answerC+"</td>";
				  str += "<td>"+paperList_java[i].answerD+"</td><td>"+paperList_java[i].correctAnswer+"</td><td><a href=''>删除</a>/<a href=''>更新</a></td></tr>";
			  }
			  paperTr.after(str);
		  }
	  });
  }
  /* function changeBarStyle(label_now){
		var labels = $("label");
		var label_java = labels.eq(0);
		var label_javascript = labels.eq(1);
		var str = $(label_now).attr("class");
		if(str.indexOf("unchecked") != -1){
			label_java.attr("class","list-div-head-bar1 checked");
			label_javascript.attr("class","list-div-head-bar2 unchecked");
		}else{
		label_java.attr("class","list-div-head-bar1 unchecked");
			label_javascript.attr("class","list-div-head-bar2 checked");
		}
	} */
  function changeToJava(){
	  var labels = $("label");
	  var label_javaScript = labels.eq(1);
	  var label_java = labels.eq(0);
	  var str = label_javaScript.attr("class");
	  if(str.indexOf("unchecked") == -1){
		  label_java.attr("class","list-div-head-bar1 checked");
		  label_javaScript.attr("class","list-div-head-bar2 unchecked");
		  showPaperList(paperList_java);
	  }
  }
	function changeToJavaScript(){
		  var labels = $("label");
		  var label_javaScript = labels.eq(1);
		  var label_java = labels.eq(0);
		  var str = label_java.attr("class");
		  if(str.indexOf("unchecked") == -1){
			  label_javaScript.attr("class","list-div-head-bar2 checked");
			  label_java.attr("class","list-div-head-bar1 unchecked");
			  showPaperList(paperList_javaScript);
		  }
	  }
  function showPaperList(paperList){
	  
	  var length = paperList.length;
	  var str = "";
	  $("tr[name='tr-main']").detach();
	  for(var i = 0;i<length;i++){
		  str += "<tr name='tr-main'><td>"+paperList[i].questionName+"</td><td>"+paperList[i].answerA+"</td><td>"+paperList[i].answerB+"</td><td>"+paperList[i].answerC+"</td>";
		  str += "<td>"+paperList[i].answerD+"</td><td>"+paperList[i].correctAnswer+"</td><td><a href=''>删除</a>/<a href=''>更新</a></td></tr>";
	  }
	  $("table").append(str);
  }
  getPaperList();
  </script>
</html>
