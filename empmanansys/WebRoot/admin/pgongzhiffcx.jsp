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
  
 
  <form  action="pgongzhiffcx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/empmanansys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">员工工资发放查看</div></td>
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
                <td colspan=12 height="45" align="left" bgcolor="#f2f2f2" class="left_txt2">                &nbsp;&nbsp;&nbsp;
<% 
String puname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
String startuname = request.getParameter("startuname")==null?"":request.getParameter("startuname"); 
String enduname = request.getParameter("enduname")==null?"":request.getParameter("enduname"); 
String psfdate = request.getParameter("sfdate")==null?"":request.getParameter("sfdate"); 
String startsfdate = request.getParameter("startsfdate")==null?"":request.getParameter("startsfdate"); 
String endsfdate = request.getParameter("endsfdate")==null?"":request.getParameter("endsfdate"); 
   %>

<%
 HashMap mmm = new HashMap();%> 
 &nbsp;&nbsp; 
&nbsp;&nbsp;实发日期 &nbsp;:&nbsp; <input type=text class=''  size=12 name='startsfdate' onclick='WdatePicker();' />&nbsp;&nbsp;至&nbsp;&nbsp;
<input type=text class=''  size=12 name='endsfdate' onclick='WdatePicker();' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp; &nbsp; &nbsp; <br></td>
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">员工</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">基本工资</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">绩效工资</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">保险扣除</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">扣除说明</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">补贴</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">补贴说明</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实发金额</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">发放月份</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实发日期</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">姓名</td>
 
                </tr>
              
             
              <% 
new CommDAO().delete(request,"gongzhiff"); 
if(request.getParameter("unameid1")!=null){ 
 new CommDAO().commOper("update gongzhiff set uname ='' where id="+request.getParameter("unameid1"));  
} 
if(request.getParameter("unameid2")!=null){ 
 new CommDAO().commOper("update gongzhiff set uname ='' where id="+request.getParameter("unameid2"));  
} 
String sql = "select * from gongzhiff where uname='"+Info.getUser(request).get("uname")+"' " ;
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
 if(!psfdate.equals("")){ 
 sql+= " and sfdate like'%"+psfdate+"%' " ;
 }  
 if(!startsfdate.equals("")){  
 mmm.put("startsfdate",startsfdate) ;
 sql+= " and sfdate >'"+startsfdate+"' " ;
 }  
 if(!endsfdate.equals("")){  
 mmm.put("endsfdate",endsfdate) ;
 sql+= " and sfdate <'"+Info.getDay(endsfdate,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "pgongzhiffcx.jsp?1=1&uname="+puname+"&sfdate="+psfdate+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("uname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("jbgz")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("jxgz")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("kc")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("kcbei")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("bt")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("btbei")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("sfje")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("sfmonth")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("sfdate")%></td>
               
                <td height="30" align="center" class="left_txt2">
<%String insql1="";%>
<%String ins1 = map.get("uname").toString().replaceAll("~","','").replaceAll("-","','").replaceAll(":","','").replaceAll(" ","");%>
<% insql1 += "and uname in('"+ins1+"') "; %>
<% List<HashMap> tnamelist = new CommDAO().select("select * from sysuser where 1=1 "+insql1+"");  %> 
<% if(tnamelist.size()>0){  %>
<%=tnamelist.get(0).get("tname")  %>
<%  }%>
</td> 

               
             
</tr>
<%}%>
                
             <tr>
              <td colspan=12 class="left_txt2" height="30"  align="center">${page.info}</td>
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
<% 
mmm.put("uname",puname); 
mmm.put("sfdate",psfdate); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/empmanansys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/empmanansys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('gongzhiffxg.jsp?id='+no,'信息修改',550,427) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('gongzhifftj.jsp','信息添加',550,427) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
