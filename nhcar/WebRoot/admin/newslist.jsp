<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.nh.utils.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻列表</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>

<body id="frmain">

	<div id="main">
    	<div class="sharp color1">
           <div class="content">
           <form action="" method="" enctype="multipart/form-data">
           	<div class="tbl">
           		<h1><strong>当前位置：</strong>新闻列表</h1>
               
                <div class="optlist"><a href="#"><img src="images/tb.gif" />发布新闻</a></div>
                <table  class="tbllist">
  <tr>
    <th scope="col">新闻ID</th>
    <th scope="col">标题</th>
    <th scope="col">发布日期</th>
    <th scope="col">操作</th>
    </tr>
    
    <%
    JdbcUtils j=new JdbcUtils();
    int pno=request.getParameter("pno")==null?1:Integer.valueOf(request.getParameter("pno"));
    int pre=pno>1?pno-1:1;
    int next=pno+1;
    int ps=2;
    int start=(pno-1)*ps;
    String sql="select nid,ntitle,ndate from news order by nid desc limit "+start+",2";
    ResultSet rs=j.query(sql);
    while(rs.next()){
     /*
     pno(页码)    start(开始位置)  ps(每页条数)
     1               0             2
     2               2             2
     3               4             2
     */
     %>
    
  <tr >
    <td><%=rs.getString("nid") %></td>
    <td><%=rs.getString("ntitle") %></td>
    <td><%=rs.getString("ndate") %></td>
    <td><a href="#"><img src="images/icon_delete.gif" />删除</a><a href="#"><img src="images/icon_edit.gif" />修改</a><a href="#">添加flash展示</a></td>
    </tr>
    
    <%
    }
     %>
  
</table>
<div class="pagenav"><a href="newslist.jsp?pno=1">首页</a><a href="newslist.jsp?pno=<%=pre%>">上一页</a><a href="newslist.jsp?pno=<%=next%>">下一页</a><a href="newslist.jsp?pno=<%=pno=3%>">未页</a></div>
                  </div>
            </form>
           </div>
		</div>
	</div>
    
</body>
</html>