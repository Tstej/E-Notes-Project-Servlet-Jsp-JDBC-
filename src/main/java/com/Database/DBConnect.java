package com.Database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
private static Connection connection;
	
	public static Connection getConnection() {
		try {
			if(connection == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-notes","root","root123");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}
