package test;
import java.sql.*;
public class CustomerLoginDAO {
	public CustomerBean cb = null;
	public CustomerBean login( String uPh) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from customer70 where phno=?");
			
			ps.setString(1, uPh);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				cb = new CustomerBean();
				cb.setCustPhno(rs.getLong(1));
				cb.setCustNm(rs.getString(2));
				cb.setCustCt(rs.getString(3));
				cb.setCustMid(rs.getString(4));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cb;
	}
}
