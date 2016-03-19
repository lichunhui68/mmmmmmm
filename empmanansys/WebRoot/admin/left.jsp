<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%
HashMap user = new HashMap(); 
if(session.getAttribute("admin")!=null)
{
user = (HashMap)session.getAttribute("admin");
} 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>

<script src="/empmanansys/js/prototype.lite.js" type="text/javascript"></script>
<script src="/empmanansys/js/moo.fx.js" type="text/javascript"></script>
<script src="/empmanansys/js/moo.fx.pack.js" type="text/javascript"></script>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(/empmanansys/images/menu_bgs.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/empmanansys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/empmanansys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/empmanansys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(/empmanansys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top"><div id="container">
    
 
  
      
      <%
      if(user.get("utype").equals("管理员"))
      {
       %>
      <h1 class="type" style="display: "><a href="javascript:void(0)">个人信息</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/empmanansys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="kaoqcx.jsp" target="main">个人考勤</a></li>
          <li><a href="zkaoqcx.jsp" target="main">考勤查看</a></li>
          <li><a href="pgongzhicx.jsp" target="main">工资查看</a></li>  
          <li><a href="noticescx.jsp" target="main">信息发布</a></li>
          <li><a href="pnoticescx.jsp" target="main">信息查看</a></li>  
         
           
         
        </ul>
      </div>
      
      
      
      
      <h1 class="type" style="display: "><a href="javascript:void(0)">员工信息</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/empmanansys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">  
          <li><a href="usermange.jsp" target="main">员工信息管理</a></li>  
          
          <li><a href="qinjcx.jsp" target="main">员工请假管理</a></li> 
          <li><a href="jiangccx.jsp" target="main">员工奖惩管理</a></li> 
          <li><a href="peixcx.jsp" target="main">员工培训记录</a></li> 
          
          <li><a href="jiabancx.jsp" target="main">员工加班管理</a></li> 
           <li><a href="bmdzcx.jsp" target="main">员工部门调转</a></li> 
           <li><a href="gongzhicx.jsp" target="main">员工工资管理</a></li> 
           <li><a href="gongzhiffcx.jsp" target="main">员工工资发放</a></li>
          <li><a href="lzusermange.jsp" target="main">已离职员工信息</a></li>
           
         
        </ul>
      </div>
      
        
      
       <h1 class="type"><a href="javascript:void(0)">基本信息维护</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/empmanansys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="departcx.jsp" target="main">部门管理</a></li> 
          <li><a href="asysusercx.jsp" target="main">管理员信息</a></li> 
          <li><a href="psysuserxg.jsp?id=<%=user.get("id")%>" target="main">修改个人信息</a></li>
          <li><a href="uppass.jsp" target="main">修改登录密码</a></li>
        </ul>
      </div>
      <%} %>
      
      
       
      
      
      
         
      
       <%
      if(user.get("utype").equals("职员"))
      {
       %>
      <h1 class="type" style="display: "><a href="javascript:void(0)">员工菜单</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/empmanansys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="kaoqcx.jsp" target="main">个人考勤</a></li> 
          <li><a href="pgongzhicx.jsp" target="main">工资查看</a></li>
          <li><a href="pgongzhiffcx.jsp" target="main">工资发放查看</a></li>
          <li><a href="pjiabancx.jsp" target="main">加班查看</a></li>
          <li><a href="pqinjcx.jsp" target="main">请假查看</a></li> 
          <li><a href="jiangcck.jsp" target="main">奖惩信息查看</a></li> 
          <li><a href="peixck.jsp" target="main">培训记录查看</a></li> 
          <li><a href="pnoticescx.jsp" target="main">信息查看</a></li> 
         <li><a href="ckusermange.jsp" target="main">员工信息查询</a></li>
         
          
         
        </ul>
      </div>
      
        
      
       <h1 class="type"><a href="javascript:void(0)">基本信息维护</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/empmanansys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM"> 
          <li><a href="psysuserxg.jsp?id=<%=user.get("id")%>" target="main">修改个人信息</a></li>
          <li><a href="uppass.jsp" target="main">修改登录密码</a></li>
        </ul>
      </div>
      <%} %>
       
      
       
      
      
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 120}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
</body>
</html>