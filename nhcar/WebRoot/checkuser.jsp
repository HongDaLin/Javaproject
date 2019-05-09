<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.nh.utils.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkuser.jsp' starting page</title>
    
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
   String uname=request.getParameter("uname");
   //out.println(uname);
   String upwd=request.getParameter("upwd");
   //out.println(upwd);
   String udate=request.getParameter("udate");
   
   
   if(uname.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "用户名不能为空");
   		return;
   }
   if(upwd.isEmpty()){
   		//out.println("<script language='javascript'>alert('密码不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "密码不能为空");
   		return;
   }
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/nhcar?useUnicode=true&characterEncoding=utf8";
   String dbUser = "root";
   String dbPwd = "123456";
   Connection conn = DriverManager.getConnection(url,dbUser,dbPwd);
   
   //Statement stmt = conn.createStatement();
   String sql = "select  uid from users where uname='"+uname+"' and  upwd='"+upwd+"'";
   Statement comm= conn.createStatement();
   ResultSet rs=comm.executeQuery(sql);
   if(rs.next()){
      String uid=rs.getString("uid");
      CookieUtils.addCookie("uid",uid, response, Integer.valueOf(udate));
      CookieUtils.addCookie("uname", uid, response, Integer.valueOf(udate));
       JsUtils.jsAlertGo(out, "登录成功!","index.jsp");
   	}else{
   		JsUtils.jsAlertBack(out, "登陆失败,用户名或密码不对");
   	}
    %>
  </body>
</html>
