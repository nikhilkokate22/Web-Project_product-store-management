package test;

import java.sql.*;

public class CustomerBeanDAO {
	public CustomerBean cb = null;
	public static int k = 0;
	public static int reg(CustomerBean cb) {
		try {
			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into customer70 values (?,?,?,?)");
			ps.setLong(1, cb.getCustPhno());
			ps.setString(2, cb.getCustNm());
			ps.setString(3, cb.getCustCt());
			ps.setString(4, cb.getCustMid());
			k = ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}
