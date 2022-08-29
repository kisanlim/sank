package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBmanager {
	
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			System.out.println("안녕");
			return conn;
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패");
		}
		return null;
	}
}
