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
new CommDAO().delete(request,"gongzhiff"); 
String id = request.getParameter("id"); 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"gongzhiff",ext,true,false); 
HashMap mmm = new CommDAO().getmap(id,"gongzhiff"); 
HashMap map = new HashMap();

%>
<body>
   
  <form  action="gongzhiffxg.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/empmanansys/images/mail_leftbg.gif"><img src="/empmanansys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/empmanansys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">工资信息修改</div></td>
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
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">员工：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("uname","sysuser","uname~无名"," uname in(select uname from gongzhi) ")%><label id='clabeluname' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">基本工资：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class='' id='jbgz'  name='jbgz' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'  /><label id='clabeljbgz' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">绩效工资：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class='' id='jxgz'  name='jxgz' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'  /><label id='clabeljxgz' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">保险扣除：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class='' id='kc'  name='kc' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'  /><label id='clabelkc' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">扣除说明：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='kcbei' name='kcbei' size=35 /><label id='clabelkcbei' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">补贴：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class='' id='bt'  name='bt' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'  /><label id='clabelbt' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">补贴说明：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='btbei' name='btbei' size=35 /><label id='clabelbtbei' />&nbsp;                </td>
                </tr>
                
                
                <tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">发放月份：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class='sfmonth' id="" onchange="getjc();"  name='sfmonth' onclick="WdatePicker({dateFmt:'yyyy-MM'});" />&nbsp;                </td>
                </tr>
                
                 <script type="text/javascript"> 
                function getjc(){ 
                var unameobj = document.getElementById("uname");  
                var sfmonthobj = document.getElementById("sfmonth"); 
                 
				if(unameobj.value!=""){  
				var ajax = new AJAX();
				 
				ajax.post("/empmanansys/factory/getjc.jsp?uname="+unameobj.value+"&month="+sfmonthobj.value+"&ttime=<%=Info.getDateStr()%>") ;
				 
				var msg = ajax.getValue();
				 document.getElementById("jl").value=msg.split("-")[0];
				 document.getElementById("cf").value=msg.split("-")[1];
				 document.getElementById("cd").value=msg.split("-")[2];
				 document.getElementById("zt").value=msg.split("-")[3];
			  
				}
				}  
                </script>
                
                <tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">当月迟到罚款：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='cd'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    />&nbsp; 10元/次               </td>
                </tr>
                
                <tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">当月早退罚款：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='zt'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    />&nbsp; 10元/次               </td>
                </tr>
                
                <tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">当月奖励总额：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='jl'   onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    />&nbsp;                </td>
                </tr>
                
                 <tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">当月处罚总额：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='cf'   onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'   />&nbsp;                </td>
                </tr>
                
                
                
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实发金额：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class='' id='sfje'  name='sfje' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'  /><label id='clabelsfje' />&nbsp;                </td>
                </tr>
 
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实发日期：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='12'   class=''   name='sfdate' onclick='WdatePicker();'  />&nbsp;                </td>
                </tr>

              

             <tr>
              <td class="left_txt2" height="40" colspan="2" align="center">
              
              <input type="submit" value="提交信息" name="B1" />         
              
                &nbsp;&nbsp;&nbsp;
                
                <input type=button value='返回上页' onclick="window.location.replace('gongzhiffcx.jsp') " />             
                
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
document.getElementById("clabeluname").innerHTML="&nbsp;&nbsp;<font color=red>请输入员工</font>";  
return false;  
}else{ 
document.getElementById("clabeluname").innerHTML="  ";  
}  
var jbgzobj = document.getElementById("jbgz");  
if(jbgzobj.value==""){  
document.getElementById("clabeljbgz").innerHTML="&nbsp;&nbsp;<font color=red>请输入基本工资</font>";  
return false;  
}else{ 
document.getElementById("clabeljbgz").innerHTML="  ";  
}  
var jxgzobj = document.getElementById("jxgz");  
if(jxgzobj.value==""){  
document.getElementById("clabeljxgz").innerHTML="&nbsp;&nbsp;<font color=red>请输入绩效工资</font>";  
return false;  
}else{ 
document.getElementById("clabeljxgz").innerHTML="  ";  
}  
var sfjeobj = document.getElementById("sfje");  
if(sfjeobj.value==""){  
document.getElementById("clabelsfje").innerHTML="&nbsp;&nbsp;<font color=red>请输入实发金额</font>";  
return false;  
}else{ 
document.getElementById("clabelsfje").innerHTML="  ";  
}  
var zhwystr = '';  
var zhwystrvalue = '';  
zhwystr+="uname"+",";  
if(document.getElementsByName("uname").length==1){  
zhwystrvalue += document.getElementById("uname").value+",";  
}else{  
for(var i=0;i<document.getElementsByName("uname").length;i++){  
if(document.getElementsByName("uname")[i].checked){  
zhwystrvalue += document.getElementsByName("uname")[i].value+",";  
}  
}  
}  
zhwystr+="sfmonth"+",";  
if(document.getElementsByName("sfmonth").length==1){  
zhwystrvalue += document.getElementById("sfmonth").value+",";  
}else{  
for(var i=0;i<document.getElementsByName("sfmonth").length;i++){  
if(document.getElementsByName("sfmonth")[i].checked){  
zhwystrvalue += document.getElementsByName("sfmonth")[i].value+",";  
}  
}  
}  
var ajax = new AJAX();
ajax.post("/empmanansys/factory/checkno.jsp?table=gongzhiff&id=<%=mmm.get("id")%>&col="+zhwystr+"&value="+zhwystrvalue+"&checktype=zhupdate&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabeluname").innerHTML="&nbsp;&nbsp;<font color=red>员工已存在</font>";  
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
