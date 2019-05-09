<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.nh.utils.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkadmin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    //设置中文编码
   request.setCharacterEncoding("utf-8");
   
   //接收数据
   String aname=request.getParameter("aname");
   //out.println(uname);
   String apwd=request.getParameter("apwd");
   //out.println(upwd);
   String acheckno=request.getParameter("acheckno");
   
  //服务器端数据验证
      if(aname.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "账号不能为空!");
   		return;
       } 
       if(apwd.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "密码不能为空!");
   		return;
       } 
       String rand=String.valueOf(session.getAttribute("rand"));
        if(!acheckno.equalsIgnoreCase(rand)){
   		JsUtils.jsAlertBack(out, "验证码不对！");
   		return;
        }
       
       
       JdbcUtils j=new JdbcUtils();
       String sql="select aid from admin where aname='"+aname+"' and apwd='"+apwd+"'";
       ResultSet result=j.query(sql);
       if(result.next()){
       String aid=result.getString("aid");
       CookieUtils.addCookie("aid", aid, response);
       		JsUtils.jsAlertGo(out, "登陆成功！", "index.jsp");
       }
       else{
       		JsUtils.jsAlertBack(out, "账号或密码错误，登陆失败！");
       }
     %>
  </body>
</html>
