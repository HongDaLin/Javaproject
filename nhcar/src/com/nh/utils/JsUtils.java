package com.nh.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.jsp.JspWriter;

public class JsUtils {
	public static void jsAlertBack(PrintWriter out,String msg) throws IOException{
			out.println("<script language='javascript'>alert('"+msg+"');history.back();</script>");
	}


	public static void jsAlertGo(PrintWriter out,String msg,String url) throws IOException{
			out.println("<script language='javascript'>alert('"+msg+"');location.href='"+url+"';</script>");
	}
}