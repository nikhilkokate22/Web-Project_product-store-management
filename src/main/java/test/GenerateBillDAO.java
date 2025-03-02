package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GenerateBillDAO {
    
    public static ProductBean getProductDetails(String productCode) {
        ProductBean pb = null;
        try {Connection conn = DBConnection.getCon();
             PreparedStatement ps = conn.prepareStatement("SELECT name, price, qty FROM product70 WHERE code = ?");
            
            ps.setString(1, productCode);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                pb = new ProductBean();
                pb.setCode(productCode);
                pb.setName(rs.getString("Name"));
                pb.setPrice(rs.getInt("Price"));
                pb.setQty(rs.getInt("Qty"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pb;
    }

    public static boolean updateStock(String productCode, int requestedQty) {
        try {Connection conn = DBConnection.getCon();
             PreparedStatement ps = conn.prepareStatement("UPDATE product70 SET qty = qty - ? WHERE code = ?");
            
            ps.setInt(1, requestedQty);
            ps.setString(2, productCode);
            int updated = ps.executeUpdate();
            
            return updated > 0; // Return true if stock is updated successfully
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean insertOrder(String customerName, String productCode, String productName, int requestedQty, float totalAmount) {
       
    	try {
    		Connection conn = DBConnection.getCon();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO orders (customerName, pCode, pName, pqty, totalAmount) VALUES (?, ?, ?, ?, ?)");
            		
            
            ps.setString(1, customerName);
            ps.setString(2, productCode);
            ps.setString(3, productName);
            ps.setInt(4, requestedQty);
            ps.setFloat(5, totalAmount);
            int inserted = ps.executeUpdate();
            
            return inserted > 0; // Return true if order is inserted successfully
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
