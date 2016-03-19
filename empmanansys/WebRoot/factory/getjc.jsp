<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%
String uname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
 String month = request.getParameter("month")==null?"":request.getParameter("month"); 
uname = Info.getGBKStr(uname); 
int jl = new CommDAO().getInt("select sum(cast(je as int)) as total from jiangc where jcllb='奖励' and jcdate like'%"+month+"%' and uname like'%"+uname.split(" - ")[0]+"%'");
int cf = new CommDAO().getInt("select sum(cast(je as int)) as total from jiangc where jcllb='处罚' and jcdate like'%"+month+"%'  and uname like'%"+uname.split(" - ")[0]+"%'");
int cd = 0;
int zt = 0;

for(HashMap map:new CommDAO().select("select * from kaoq where kqday like'%"+month+"%' and uname like'%"+uname.split(" - ")[0]+"%'"))
{
String kqstime = map.get("kqstime").toString();
String kqetime = map.get("kqetime").toString();
if(!kqstime.equals(""))
{ 
int stime = Integer.parseInt(kqstime.substring(11,13)) ;
if(stime>=9)cd+=10;
}
if(!kqetime.equals(""))
{ 
int etime = Integer.parseInt(kqetime.substring(11,13)) ;
if(etime<=6)zt+=10;
}
}

out.println(jl+"-"+cf+"-"+cd+"-"+zt);
%>