<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
-->
</style>
 
<link href="/empmanansys/images/skin.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  
 
  <form  action="gongzhicx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/empmanansys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">员工工资管理</div></td>
      </tr>
    </table></td>
    <td class="left_txt2" width="22" valign="top" background="/empmanansys/images/mail_rightbg.gif"><img src="/empmanansys/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td class="left_txt2" height="71" valign="middle" background="/empmanansys/images/mail_leftbg.gif">&nbsp;</td>
    <td class="left_txt2" valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="141" valign="top"> 
		
		
		
		
		
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td ><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td  class="left_bt2">&nbsp;&nbsp;&nbsp; 信息列表</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td  height="90"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">员工</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">基本工资</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">绩效工资</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">保险扣除</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">扣除说明</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">每月补贴</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">补贴说明</td>
 
                </tr>
              
             
              <% 
new CommDAO().delete(request,"gongzhi"); 
if(request.getParameter("unameid1")!=null){ 
 new CommDAO().commOper("update gongzhi set uname ='' where id="+request.getParameter("unameid1"));  
} 
if(request.getParameter("unameid2")!=null){ 
 new CommDAO().commOper("update gongzhi set uname ='' where id="+request.getParameter("unameid2"));  
} 
String sql = "select * from gongzhi where uname='"+Info.getUser(request).get("uname")+"' " ;
  
  sql +=" order by id desc ";
 
ArrayList<HashMap> list = PageManager.getPages("",5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("uname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("jbgz")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("jxgz")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("kc")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("kcbei")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("bt")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("btbei")%></td>
               
              
</tr>
<%}%>
                
             <tr>
              <td colspan=9 class="left_txt2" height="30"   align="center">&nbsp;</td>
              </tr>
              
              
            </table></td>
          </tr>
        </table>
		
		
		
		
		
		
          </td>
      </tr>
    </table></td>
    <td class="left_txt2" background="/empmanansys/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td class="left_txt2" valign="middle" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/buttom_left2.gif" width="17" height="17" /></td>
      <td class="left_txt2" height="17" valign="top" background="/empmanansys/images/buttom_bgs.gif"><img src="/empmanansys/images/buttom_bgs.gif" width="17" height="17" /></td>
    <td class="left_txt2" background="/empmanansys/images/mail_rightbg.gif"><img src="/empmanansys/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</form>
  </body>
</html>
<script language=javascript src='/empmanansys/js/ajax.js'></script>
 
<script language=javascript src='/empmanansys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/empmanansys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('gongzhixg.jsp?id='+no,'信息修改',550,334) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('gongzhitj.jsp','信息添加',550,334) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
