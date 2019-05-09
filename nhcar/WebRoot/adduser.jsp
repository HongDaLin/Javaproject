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
    
    <title>My JSP 'adduser.jsp' starting page</title>
    
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
   String upwd=request.getParameter("upwd");
   String urepwd=request.getParameter("urepwd");
   String uemail=request.getParameter("uemail");
   
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
   /* if(urepwd.isEmpty()){
   		//out.println("<script language='javascript'>alert('请确认密码');history.back();</script>");
   		JsUtils.jsAlertBack(out, "请确认密码");
   		return;
   }*/
   if(!upwd.equals(urepwd)){
   		//out.println("<script language='javascript'>alert('两次密码不一致');history.back();</script>");
   		JsUtils.jsAlertBack(out, "两次密码不一致");
   		return;
   }
   /* if(!uemail.isEmpty()){
   		out.println("<script language='javascript'>alert('邮箱为空');history.back();</script>");
   		return;
   }*/
   
   String erg="^[a-zA-Z0-9]+@[a-zA-Z0-9.]+[a-zA-Z0-9]{2,3}$";
   if(!uemail.matches(erg)){
   		//out.println("<script language='javascript'>alert('邮箱格式错误');history.back();</script>");
   		JsUtils.jsAlertBack(out,"邮箱格式错误");
   		return;
   }
   
   //加载驱动
   /*
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/nhcar?useUnicode=true&characterEncoding=utf8";
   String dbUser = "root";
   String dbPwd = " ";
   Connection conn = DriverManager.getConnection(url,dbUser,dbPwd);
   */
   JdbcUtils j=new JdbcUtils();
  //编写sql语句
   /* String sql= "select uid from users where uname='"+uname+"' and upwd='"+upwd+"'"; */

   String sql = "insert into users(uname,upwd,uemail,udate) values('"+uname+"', '"+upwd+"', '"+uemail+"', now())";
   
   //执行
   /* Statement stmt = conn.createStatement();
   ResultSet rs=stmt.executeQuery(sql); */
   int result=j.update(sql);
   if(result>0){
   		JsUtils.jsAlertGo(out,"注册成功!","index.jsp");
   }
   else{
		JsUtils.jsAlertBack(out,"注册失败!");
   }
   %>
  </body>
</html>
