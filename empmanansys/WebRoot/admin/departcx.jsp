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
  
 
  <form  action="departcx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/empmanansys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">部门信息管理</div></td>
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
                <td colspan=5 height="45" align="left" bgcolor="#f2f2f2" class="left_txt2">                &nbsp;&nbsp;&nbsp;<% 
String pdname = request.getParameter("dname")==null?"":request.getParameter("dname"); 
String startdname = request.getParameter("startdname")==null?"":request.getParameter("startdname"); 
String enddname = request.getParameter("enddname")==null?"":request.getParameter("enddname"); 
String excelsql = " where 1=1 " ;
 if(!pdname.equals("")){ 
 excelsql+= " and dname like'%"+pdname+"%' " ;
 }  
 if(!startdname.equals("")){  
 excelsql+= " and dname >'"+startdname+"' " ;
 }  
 if(!enddname.equals("")){  
 excelsql+= " and dname <'"+Info.getDay(enddname,1)+"' " ;
 }  
  excelsql +=" ";%>

<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;部门名称 &nbsp;:&nbsp; <input type=text class=''  size=15 name='dname' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;<input type=button   class=''  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">部门名称</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">部门职能</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系电话</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">部长</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">操作</td>
                </tr>
              
             
              <% 
new CommDAO().delete(request,"depart"); 
if(request.getParameter("dnameid1")!=null){ 
 new CommDAO().commOper("update depart set dname ='' where id="+request.getParameter("dnameid1"));  
} 
if(request.getParameter("dnameid2")!=null){ 
 new CommDAO().commOper("update depart set dname ='' where id="+request.getParameter("dnameid2"));  
} 
String sql = "select * from depart where 1=1 " ;
 if(!pdname.equals("")){ 
 sql+= " and dname like'%"+pdname+"%' " ;
 }  
 if(!startdname.equals("")){  
 mmm.put("startdname",startdname) ;
 sql+= " and dname >'"+startdname+"' " ;
 }  
 if(!enddname.equals("")){  
 mmm.put("enddname",enddname) ;
 sql+= " and dname <'"+Info.getDay(enddname,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "departcx.jsp?1=1&dname="+pdname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("dname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("dbei")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("dtel")%></td>
                
                 <td height="30" align="center" class="left_txt2">
                 
                 <%
                 String buz = "";
                 List<HashMap> blist = new CommDAO().select("select * from sysuser where depart='"+map.get("dname")+"' and utype='部长'");
                 if(blist.size()>0)
                 {
                 buz = blist.get(0).get("uname")+" - "+ blist.get(0).get("tname");
                 }
                  %>
                  
                  <%=buz %>
                 
                 </td>
               
                <td height="30" align="center" class="left_txt2"><a href="javascript:update('<%=map.get("id")%>')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="departcx.jsp?scid=<%=map.get("id")%>">删除</a></td>
</tr>
<%}%>
                
             <tr>
              <td colspan=5 class="left_txt2" height="30" colspan="6" align="center">${page.info}</td>
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
mmm.put("dname",pdname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/empmanansys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/empmanansys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('departxg.jsp?id='+no,'信息修改',500,215) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('departtj.jsp','信息添加',500,215) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
