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
  
 
  <form  action="zkaoqcx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/empmanansys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">考勤查看</div></td>
      </tr>
    </table></td>
    <td class="left_txt2" width="22" valign="top" background="/empmanansys/images/mail_rightbg.gif"><img src="/empmanansys/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td class="left_txt2" height="71" valign="middle" background="/empmanansys/images/mail_leftbg.gif">&nbsp;</td>
    <td class="left_txt2" valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp; 请输入查询信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td colspan=6 height="45" align="left" bgcolor="#f2f2f2" class="left_txt2">                &nbsp;&nbsp;&nbsp;
<%
 HashMap mmm = new HashMap();%>
 
 
考勤人 &nbsp;:&nbsp; <%=Info.getselect("uname","sysuser","uname"," 1=1 ")%>
 
 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考勤日 &nbsp;:&nbsp; <input type=text class=''  size=12 name='startkqday' onclick='WdatePicker();' />&nbsp;&nbsp;至&nbsp;&nbsp;<input type=text class=''  size=12 name='endkqday' onclick='WdatePicker();' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;&nbsp;&nbsp;</td>
                </tr>
              
 
              
              
            </table></td>
          </tr>
        </table>
		
		
		
		
		
		
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">考勤人</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">考勤日</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">出勤时间</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">退勤时间</td>
 
                </tr>
              
             
              <% 
String puname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
String startuname = request.getParameter("startuname")==null?"":request.getParameter("startuname"); 
String enduname = request.getParameter("enduname")==null?"":request.getParameter("enduname"); 
String pkqday = request.getParameter("kqday")==null?"":request.getParameter("kqday"); 
String startkqday = request.getParameter("startkqday")==null?"":request.getParameter("startkqday"); 
String endkqday = request.getParameter("endkqday")==null?"":request.getParameter("endkqday"); 
new CommDAO().delete(request,"kaoq"); 
if(request.getParameter("unameid1")!=null){ 
 new CommDAO().commOper("update kaoq set uname ='' where id="+request.getParameter("unameid1"));  
} 
if(request.getParameter("unameid2")!=null){ 
 new CommDAO().commOper("update kaoq set uname ='' where id="+request.getParameter("unameid2"));  
} 
String sql = "select * from kaoq where 1=1 " ;
 if(!puname.equals("")){ 
 sql+= " and uname like'%"+puname+"%' " ;
 }  
 if(!startuname.equals("")){  
 mmm.put("startuname",startuname) ;
 sql+= " and uname >'"+startuname+"' " ;
 }  
 if(!enduname.equals("")){  
 mmm.put("enduname",enduname) ;
 sql+= " and uname <'"+Info.getDay(enduname,1)+"' " ;
 }  
 if(!pkqday.equals("")){ 
 sql+= " and kqday like'%"+pkqday+"%' " ;
 }  
 if(!startkqday.equals("")){  
 mmm.put("startkqday",startkqday) ;
 sql+= " and kqday >'"+startkqday+"' " ;
 }  
 if(!endkqday.equals("")){  
 mmm.put("endkqday",endkqday) ;
 sql+= " and kqday <'"+Info.getDay(endkqday,1)+"' " ;
 } 
   
 
  sql +=" order by id desc ";
String url = "zkaoqcx.jsp?1=1&uname="+puname+"&kqday="+pkqday+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("uname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("kqday")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("kqstime")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("kqetime")%></td>
                
</tr>
<%}%>
                
             <tr>
              <td colspan=6 class="left_txt2" height="30" colspan="6" align="center">${page.info}</td>
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
<% 
mmm.put("uname",puname); 
mmm.put("kqday",pkqday); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript src='/empmanansys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/empmanansys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('kaoqxg.jsp?id='+no,'信息修改',500,245) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('kaoqtj.jsp','信息添加',500,245) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
