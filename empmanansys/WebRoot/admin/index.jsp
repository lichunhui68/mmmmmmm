<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理中心</title>
</head>

<%
String url = "";
HashMap user = new HashMap(); 
user = (HashMap)session.getAttribute("admin");

url="kaoqcx.jsp";

if(user==null)response.sendRedirect("/empmanansys/index.jsp");

 %>


<frameset rows="64,*"  frameborder="NO" border="0" framespacing="0">
	<frame src="/empmanansys/admin/admin_top.jsp" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
  <frameset cols="200,*"  rows="560,*" id="frame">
	<frame src="/empmanansys/admin/left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
	<frame src="/empmanansys/admin/<%=url %>" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
  
<noframes>
  <body></body>
    </noframes>
</html>
