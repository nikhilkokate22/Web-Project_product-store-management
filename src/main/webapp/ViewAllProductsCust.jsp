<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Products</title>
<style>
/* Reset styles */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

/* Container styling */
.container {
    width: 80%;
    max-width: 700px;
    margin: 50px auto;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
}

/* Heading styles */
h3 {
    color: #333;
    margin-bottom: 15px;
}

/* Customer info */
.customer-info {
    font-size: 18px;
    font-weight: bold;
    color: #007bff;
    margin-bottom: 20px;
}

/* Table styling */
.product-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.product-table th, .product-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.product-table th {
    background-color: #007bff;
    color: white;
}

.product-table td a {
    text-decoration: none;
    background-color: #28a745;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    transition: background 0.3s ease;
}

.product-table td a:hover {
    background-color: #218838;
}

/* Logout button */
.logout {
    display: block;
    text-decoration: none;
    background-color: #dc3545;
    color: white;
    padding: 10px;
    margin-top: 15px;
    border-radius: 5px;
    font-size: 16px;
    transition: background 0.3s ease;
}

.logout:hover {
    background-color: #a71d2a;
}
</style>
</head>
<body>

<div class="container">
    <h3>Available Products</h3>
    <%
    CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
    ArrayList<ProductBean> al = (ArrayList<ProductBean>) session.getAttribute("alist1");
    
    if (cb != null) {
    %>
        <p class="customer-info">Page belongs to Customer: <%= cb.getCustNm() %></p>
    <%
        if (al == null || al.isEmpty()) {
            out.println("<p style='color: red; font-size: 18px;'>Products not available...</p>");
        } else {
    %>
        <table class="product-table">
            <tr>
                <th>Product Code</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
            <%
            for (ProductBean pb : al) {
            %>
                <tr>
                    <td><%= pb.getCode() %></td>
                    <td><%= pb.getName() %></td>
                    <td>₹<%= pb.getPrice() %></td>
                    <td><%= pb.getQty() %></td>
                    <td><a href="buy?pcode=<%= pb.getCode() %>">Buy</a></td>
                </tr>
            <%
            }
            %>
        </table>
    <%
        }
    } else {
        out.println("<p style='color: red;'>Session expired. Please login again.</p>");
    }
    %>
    
    <a href="logout" class="logout">Logout</a>
</div>

</body>
</html>
