<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/sidebar-menu.css">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/sidebar-menu.js"></script> --%>
  </head>
  <body>
  
    <aside class="main-sidebar">
<section  class="sidebar">
	<ul class="sidebar-menu">
	  <li class="header">主导航</li>
	 <!--  <li class="treeview">
		<a href="#">
		  <i class="fa fa-user"></i><span></span> <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <!-- <li><a href="#"><i class="fa fa-caret-square-o-right"></i> </a></li>
		  <li><a href="#"><i class="fa fa-caret-square-o-right"></i> </a></li>
		</ul>
	 </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-user"></i>
		  <span></span>
			<i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu" style="display: none;">
		  <li><a href="#"><i class="fa fa-caret-square-o-right"></i> </a></li>
		  <li><a href="#"><i class="fa fa-caret-square-o-right"></i> </a></li>
		  <li><a href="#"><i class="fa fa-caret-square-o-right"></i> </a></li>
		  <li class=""><a href="#"><i class="fa fa-caret-square-o-right"></i> </a>
		  </li>
		</ul>
	  </li>
	  <li>
		<a href="#">
		  <i class="fa fa-th"></i> <span></span>
		  <i class="fa fa-angle-right pull-right"></i>
			<ul class="treeview-menu">
			  <li><a href="#"><i class="fa fa-circle-o"></i> </a></li>
			  <li><a href="#"><i class="fa fa-circle-o"></i> </a></li>
			</ul>
		</a>
	  </li> -->
  </section>
 </aside>


<script>
$(function () {
    $.ajax({
        url: '${pageContext.request.contextPath }/menu_getMenus.action',
        cache: false,
        dataType: "json",
        success: function (r) {

            var httpMenuList = r.obj;//List<Menu>
            var length = r.obj.length;
            var str = "";
            //一级菜单
            for(var i = 0;i<length;i++){
            	var menu = httpMenuList[i];//Menu
            	if(menu.parent_id==null){
            		/* alert(menu.id); */
            		str += "<li class='treeview' id="+menu.id+"><a href=''><i class='fa "+menu.menuIcon+"'></i><span>"+menu.menuName+"</span> <i class='fa fa-angle-right pull-right'></i></a><ul class='treeview-menu'></ul></li>";
            	}
           	}
            $(".sidebar-menu").append(str);
            //二级目录
            for(var i = 0;i<length;i++){
            	var menu = httpMenuList[i];
            	 var secMenuStr = "";
            	if(menu.parent_id!=null){
            		var parentId = menu.parent_id;
            		secMenuStr += "<li><a href='${pageContext.request.contextPath }"+menu.menuUrl+".action'><i class='fa "+menu.menuIcon+"'></i>"+menu.menuName+"</a></li>";
            		$("#"+parentId+">.treeview-menu").append(secMenuStr);
            	}
            }
            $.sidebarMenu($('.sidebar-menu'));  
        }
    
      });
 });
</script>

  </body>
</html>
