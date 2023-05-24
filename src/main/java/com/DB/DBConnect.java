package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection conn;

	public static Connection getConn() /* kết nối với Database */
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mashumashu?useUnicode=true&characterEncoding=UTF-8","root","Tu0336298584");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
