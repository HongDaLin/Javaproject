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
    
    <title>My JSP 'insertnews.jsp' starting page</title>
    
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
   String ntitle=request.getParameter("ntitle");
   String nfrom=request.getParameter("nfrom");
   String ncontent=request.getParameter("ncontent");
   
   
        
   //服务器端数据验证
   if(ntitle.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "标题不能为空!");
   		return;
        }
   if(nfrom.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "来源不能为空!");
   		return;
        }
   if(ncontent.isEmpty()){
   		//out.println("<script language='javascript'>alert('用户名不能为空');history.back();</script>");
   		JsUtils.jsAlertBack(out, "内容不能为空!");
   		return;
        }
        
   //加载驱动
        JdbcUtils j=new JdbcUtils();
        String naid=CookieUtils.getCookie("aid",request);
   //编写sql语句
        String sql= "insert into news(ntitle,ncontent,nfrom,ndate,naid) values('"+ntitle+"','"+ncontent+"','"+nfrom+"',now(),'"+naid+"')";
   
   //执行
        int result=j.update(sql);
        if(result>0){
   			JsUtils.jsAlertGo(out,"发布成功!","addnews.jsp");
   		}	
        else{
        	JsUtils.jsAlertBack(out,"发布失败");
        }
     %>
  </body>
</html>
