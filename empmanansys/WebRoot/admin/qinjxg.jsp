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
  
  <% 
new CommDAO().delete(request,"qinj"); 
String id = request.getParameter("id"); 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
ext.put("saver",Info.getUser(request).get("uname")); 
new CommDAO().update(request,response,"qinj",ext,true,true); 
HashMap mmm = new CommDAO().getmap(id,"qinj"); 
%>
<body>
   
  <form  action="qinjxg.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/empmanansys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">请假信息修改</div></td>
      </tr>
    </table></td>
    <td class="left_txt2" width="22" valign="top" background="/empmanansys/images/mail_rightbg.gif"><img src="/empmanansys/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td class="left_txt2" height="71" valign="middle" background="/empmanansys/images/mail_leftbg.gif">&nbsp;</td>
    <td class="left_txt2" valign="top" bgcolor="#F7F8F9"><table width="100%" height="101" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="101" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;请输入相关信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请假人：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2">
                
                   
 
<%=Info.getselect("uname","sysuser","uname"," 1=1 ")%>
 
            
                
                
                <label id='clabeluname' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请假日期始：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='qjdates' onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请假日期止：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='qjdatee' onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请假类别：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><span id="qjtypedanx"><label><input type=radio name='qjtype' value='年假' />&nbsp;年假 </label>
<label><input type=radio name='qjtype' value='病假' />&nbsp;病假 </label>
<label><input type=radio name='qjtype' value='事假' />&nbsp;事假 </label>
</span>&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请假说明：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='qjbei' name='qjbei' size=35 /><label id='clabelqjbei' />&nbsp;                </td>
                </tr>

              

             <tr>
              <td class="left_txt2" height="40" colspan="2" align="center">
              
              <input type="submit" value="提交信息" name="B1" />         
              
                &nbsp;&nbsp;&nbsp;
                
                <input type=button value='返回上页' onclick='popclose();' />             
                
                 </td>
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
<script language=javascript src='/empmanansys/js/My97DatePicker/WdatePicker.js'></script> 
<script language=javascript src='/empmanansys/js/ajax.js'></script> 
<script language=javascript src='/empmanansys/js/popup.js'></script> 
<%@page import="util.Info"%> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
</script>  
<script language=javascript >  
 function checkform(){  
var unameobj = document.getElementById("uname");  
if(unameobj.value==""){  
document.getElementById("clabeluname").innerHTML="&nbsp;&nbsp;<font color=red>请输入请假人</font>";  
return false;  
}else{ 
document.getElementById("clabeluname").innerHTML="  ";  
}  
return true;   
}   
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
