<%@ page language="java" import="com.nh.utils.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南华汽车网</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/jquery.js"></scrzipt>
<script language="javascript" src="js/nhcar.js"></script>
<script language="javascript" src="js/banner.js"></script>
</head>
  <body>
    <div id="header">
	<div id="header-content">
        <a href="#" id="logo"><img src="images/logo.gif" alt="南华汽车网" /></a>
        <div id="header-right">
        <ul id="subnav">
            <li class="login">
            
            <%
             String uid=CookieUtils.getCookie("uid",request);
             if(uid.isEmpty()){
                out.print("<a href='login.jsp'>登录</a>");
             }
             else{
             String uname=CookieUtils.getCookie("uname",request);
                 out.print(uname+"您好！<a href='logout.jsp'>注销</a>");
             }
             %>
            </li>
            <li class="mobile"><a href="#">手机版</a></li>
            <li class="car"><a href="#">购物车</a></li>
            <li class="message"><a href="message.jsp">在线留言</a></li>
        </ul>
        <form id="search">
            <p><label>输入你要搜索的车型名称</label><input type="text"  value="" class="skey"/><input type="submit" value="搜索" class="searchbt" /></p>
            <dl>
                <dt>热门：</dt>
                <dd><a href="#">速腾</a></dd>
                <dd><a href="#">奥迪A3</a></dd>
                <dd><a href="#">宝马X6</a></dd>
                <dd><a href="#">速腾</a></dd>
                <dd><a href="#">奥迪A3</a></dd>
                <dd><a href="#">宝马X6</a></dd>
            </dl>
        </form>
        </div>
      <div id="nav">
        	<div class="catelist">
            	<h2>汽车分类</h2>
            	<ul>
            	  <li><a href="#">大众</a></li>
            	  <li><a href="#">丰田</a></li>
            	  <li><a href="#">吉利</a></li>
            	  <li><a href="#">海马</a></li>
            	  <li><a href="#">奥迪</a></li>
            	  <li><a href="#">劳斯莱斯</a></li>
            	  <li><a href="#">雷克萨斯</a></li>
            	  <li><a href="#">本田</a></li>
            	  <li><a href="#">英菲尼迪</a></li>
            	  <li><a href="#">凯迪拉克</a></li>
            	  <li><a href="#">奇瑞</a></li>
              </ul>
       	  </div>
          <ul id="navlist">
          	<li><a href="#">首页</a></li>
            <li><a href="#">新车上市</a></li>
            <li><a href="#">热销汽车</a></li>
            <li><a href="#">豪车推荐</a></li>
            <li><a href="#">汽车资讯</a></li>
          </ul>
      </div>
    </div>
</div>
  </body>
</html>
