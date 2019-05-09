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
    
    <title>My JSP 'addmessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
   //设置中文编码
   request.setCharacterEncoding("utf-8");
   //接收数据
   String mname=request.getParameter("mname");
   String mtitle=request.getParameter("mtitle");
   String mcontent=request.getParameter("mcontent");
   String mcheckno=request.getParameter("mcheckno");
   
   //服务器端数据验证
      if(mname.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "昵称不能为空!");
   		return;
       }
       if(mtitle.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "标题不能为空!");
   		return;
        }
        if(mcontent.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "内容不能为空!");
   		return;
        }
        
        String rand=String.valueOf(session.getAttribute("rand"));
        if(!mcheckno.equalsIgnoreCase(rand)){
   		JsUtils.jsAlertBack(out, "验证码不对！");
   		return;
        }
        
        //加载驱动
        JdbcUtils j=new JdbcUtils();
        
        //编写sql语句
        String sql= "insert into message(mname,mtitle,mcontent,mdate) values('"+mname+"','"+mtitle+"','"+mcontent+"',now())";
        //执行
        int result=j.update(sql);
        if(result>0){
   			JsUtils.jsAlertGo(out,"发布成功!","message.jsp");
   		}	
        else{
        	JsUtils.jsAlertBack(out,"发布失败");
        }
   %>
  <body>
    
  </body>
</html>
