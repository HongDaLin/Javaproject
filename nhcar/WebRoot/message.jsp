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
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/jquery.js"></script>
<script language="javascript" src="js/nhcar.js"></script>
<script language="javascript">
function refresh() {
	document.getElementById("check_id").src="checkno.jsp?t="+Math.random();
}
function checkdate() {
	var mUserName=g("mUserName").value;
	var mTitle=g("mTitle").value;
	var mContent=g("mContent").value;
	if(mUserName==""){
		show("ckmUserName");
		return false;
	}
	if(mTitle==""){
		show("ckmTitle");
		return false;
	}
	if(mContent==""){
		show("ckmContent");
		return false;
	}
	return true;
}
function g(id){
	return document.getElementById(id);
}
function show(id){
	g(id).style.display="inline";
}
</script>
</head>

<body>

<%@ include file="header.jsp" %>

        <div id="main-right">
        <h2>在线留言</h2>
          
        <div id="form">
      	<form action="addmessage.jsp" method="post" onsubmit="return checkdate();">
        	<p><label>*昵称：</label><input type="text"  id="mUserName" class="txt" name="mname"/><span class="errorinfo" id="ckmUserName">不能为空</span></p>
            <p><label>*主题：</label><input type="text" class="ltxt" id="mTitle" name="mtitle"/><span class="errorinfo" id="ckmTitle">不能为空</span></p>
            <p><label>*内容：</label><textarea class="mltxt" id="mContent" name="mcontent"></textarea><span class="errorinfo" id="ckmContent">不能为空</span></p>
            <p><label class="lblcheckno">*验证码：</label><input type="text" name="mcheckno" id="checkno" class="txt"/><img src="checkno.jsp" id="check_id" src="images/comment-verifycode.gif" /><img src="images/checknoshow.gif" onclick="refresh()" /><span class="errorinfo" id="ckcheckno">不能为空</span></p>
            <p><input type="submit" class="bt" value="提交" /></p>
            
        </form>
        
      </div>
      <div id="messagelist">
      <ul>
      <% 
      	JdbcUtils j=new JdbcUtils();
      	String sql="select * from message order by mdate desc";
      	ResultSet rs=j.query(sql);
      	while(rs.next()){
      %>
**********      	<li>
        	<h3>网友：<%=rs.getString("mname") %></h3>
            <h4><span><%=rs.getString("mdate") %></span><%=rs.getString("mtitle") %></h4>
        	<div class="messagecontent">
            	<p><%=rs.getString("mcontent") %></p>
           
            </div>
             <h4><span>2018-10-16</span></h4>
        </li>
        <%
        }
         %>
      </ul>
       <div class="pagenav"><a href="#">&lt;</a><a href="#">1</a><a href="#">2</a><a href="#">3</a><span>…</span><a href="#">&gt;</a></div>
      </div>
      </div>
      
 
<%@ include file="footer.jsp" %>
</body>
</html>
