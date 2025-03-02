package test;
import java.sql.*;
public class DBConnection {
	private static Connection con = null;
	private DBConnection() {
		
	}
	static {
		try {
			Class.forName(DBInfo.driver);
			con=DriverManager.getConnection(DBInfo.dbURL,DBInfo.dbUname,DBInfo.dbPwd);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getCon() {
		return con;
	}
}
