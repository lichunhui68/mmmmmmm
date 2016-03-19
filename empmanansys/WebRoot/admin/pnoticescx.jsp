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
  
 
  <form  action="pnoticescx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/empmanansys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">信息查看</div></td>
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
String ptitle = request.getParameter("title")==null?"":request.getParameter("title"); 
String starttitle = request.getParameter("starttitle")==null?"":request.getParameter("starttitle"); 
String endtitle = request.getParameter("endtitle")==null?"":request.getParameter("endtitle"); 
String pauthor = request.getParameter("author")==null?"":request.getParameter("author"); 
String startauthor = request.getParameter("startauthor")==null?"":request.getParameter("startauthor"); 
String endauthor = request.getParameter("endauthor")==null?"":request.getParameter("endauthor"); 
String excelsql = " where 1=1 " ;
 if(!ptitle.equals("")){ 
 excelsql+= " and title like'%"+ptitle+"%' " ;
 }  
 if(!starttitle.equals("")){  
 excelsql+= " and title >'"+starttitle+"' " ;
 }  
 if(!endtitle.equals("")){  
 excelsql+= " and title <'"+Info.getDay(endtitle,1)+"' " ;
 }  
 if(!pauthor.equals("")){ 
 excelsql+= " and author like'%"+pauthor+"%' " ;
 }  
 if(!startauthor.equals("")){  
 excelsql+= " and author >'"+startauthor+"' " ;
 }  
 if(!endauthor.equals("")){  
 excelsql+= " and author <'"+Info.getDay(endauthor,1)+"' " ;
 }  
  
  excelsql +=" ";%>

<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;标题 &nbsp;:&nbsp; <input type=text class=''  size=15 name='title' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;发布人 &nbsp;:&nbsp; <input type=text class=''  size=15 name='author' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">标题</td>
                 <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">内容</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">发布人</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">发布时间</td>
 
                </tr>
              
             
              <% 
new CommDAO().delete(request,"notices"); 
if(request.getParameter("titleid1")!=null){ 
 new CommDAO().commOper("update notices set title ='' where id="+request.getParameter("titleid1"));  
} 
if(request.getParameter("titleid2")!=null){ 
 new CommDAO().commOper("update notices set title ='' where id="+request.getParameter("titleid2"));  
} 
String sql = "select * from notices where 1=1 " ;
 if(!ptitle.equals("")){ 
 sql+= " and title like'%"+ptitle+"%' " ;
 }  
 if(!starttitle.equals("")){  
 mmm.put("starttitle",starttitle) ;
 sql+= " and title >'"+starttitle+"' " ;
 }  
 if(!endtitle.equals("")){  
 mmm.put("endtitle",endtitle) ;
 sql+= " and title <'"+Info.getDay(endtitle,1)+"' " ;
 }  
 if(!pauthor.equals("")){ 
 sql+= " and author like'%"+pauthor+"%' " ;
 }  
 if(!startauthor.equals("")){  
 mmm.put("startauthor",startauthor) ;
 sql+= " and author >'"+startauthor+"' " ;
 }  
 if(!endauthor.equals("")){  
 mmm.put("endauthor",endauthor) ;
 sql+= " and author <'"+Info.getDay(endauthor,1)+"' " ;
 }  
 
  sql +=" order by id desc ";
String url = "pnoticescx.jsp?1=1&title="+ptitle+"&author="+pauthor+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("title")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("tcontent")%></td>
                
                <td height="30" align="center" class="left_txt2"><%=map.get("author")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("savetime")%></td>
               
 
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
mmm.put("title",ptitle); 
mmm.put("author",pauthor); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/empmanansys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/empmanansys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('noticesxg.jsp?id='+no,'信息修改',500,193) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('noticestj.jsp','信息添加',500,193) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
