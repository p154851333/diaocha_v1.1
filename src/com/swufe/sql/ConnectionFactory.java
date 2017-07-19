package com.swufe.sql;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	private ConnectionFactory() {
	}
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/diaocha?"
					+ "user=root&password=123456&useUnicode=true&characterEncoding=utf-8";
			Connection conn = DriverManager.getConnection(url);
			return conn;
		} catch (Exception e) {
			System.out.print("数据库连接异常");
		}
		return null;
	}
}
