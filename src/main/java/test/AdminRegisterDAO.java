package test;
import java.sql.*;
public class AdminRegisterDAO {
	public AdminBean ab = null;
	public static int k = 0;
	public static int reg(AdminBean ab) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into admin70 values(?,?,?,?,?,?,?)");
			ps.setString(1, ab.getuName());
			ps.setString(2, ab.getpWord());
			ps.setString(3, ab.getfName());
			ps.setString(4, ab.getlName());
			ps.setString(5, ab.getCity());
			ps.setString(6, ab.getmId());
			ps.setLong(7, ab.getPhNo());
			k = ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}
