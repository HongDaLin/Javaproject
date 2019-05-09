package com.nh.utils;
import java.sql.*;

public class JdbcUtils {
	private Statement comm; //全局变量
		public JdbcUtils(){ //构造方法，初始化数据
			try {
				Class.forName("com.mysql.jdbc.Driver");
				   //创建连接
				   String url = "jdbc:mysql://localhost:3306/nhcar?useUnicode=true&characterEncoding=utf8";
				   String dbUser = "root";
				   String dbPwd = "123456";
				   Connection conn = DriverManager.getConnection(url,dbUser,dbPwd);
				   //执行
				   comm = conn.createStatement();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public int update(String sql){  //数据插入、修改、删除
			int result=0;
			try {
				result=comm.executeUpdate(sql);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		public ResultSet query(String sql){  //数据查询
			ResultSet rs=null;
			try {
				rs=comm.executeQuery(sql);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
}
