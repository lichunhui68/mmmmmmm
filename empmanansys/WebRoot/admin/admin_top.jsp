<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
HashMap user = new HashMap(); 
String uname = "";
if(session.getAttribute("admin")!=null)
{
user = (HashMap)session.getAttribute("admin");
uname = user.get("uname").toString();
}
 
 %>
<html>
<head>
<title></title>
<script language=JavaScript>
function logout(){
	top.location = "/empmanansys/admin/login.jsp";
	return false;
}
</script>
<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
<meta http-equiv="refresh" content="60">
<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
<base target="main">
<link href="/empmanansys/images/skin.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    
    <td width="100%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      
      <td width="23%" height="38" >
        <font color="white">&nbsp;&nbsp;&nbsp;&nbsp;
        <strong><font size=4>人事管理系统</font></strong></font> </td>
      
        <td width="51%" height="38" class="admin_txt">
         
        
        <b><%=uname %> (<%=user.get("utype") %> - <%=user.get("depart") %>)</b> 您好,感谢登陆使用！</td>
        <td width="22%"><a href="#" onClick="logout();" target="_self"><img src="/empmanansys/images/out.gif" alt="安全退出" width="46" height="20" border="0"></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" colspan="4">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
