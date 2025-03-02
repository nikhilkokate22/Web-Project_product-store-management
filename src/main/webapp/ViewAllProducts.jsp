<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Manage Products</title>
<style>
/* Reset and basic styling */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

/* Container styling */
.container {
    width: 70%;
    margin: 50px auto;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
    text-align: center;
}

/* Heading */
h2 {
    color: #dc3545;
    margin-bottom: 20px;
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background-color: #dc3545;
    color: white;
}

/* Action buttons */
.action-btn {
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 5px;
    margin: 2px;
    display: inline-block;
    font-size: 14px;
    font-weight: bold;
}

.edit-btn {
    background-color: #ffc107;
    color: black;
}

.delete-btn {
    background-color: #dc3545;
    color: white;
}

.action-btn:hover {
    opacity: 0.8;
}

/* Navigation links */
.nav-links {
    margin-top: 20px;
}

.nav-links a {
    text-decoration: none;
    padding: 10px 15px;
    background: #28a745;
    color: white;
    font-weight: bold;
    border-radius: 5px;
    margin: 5px;
    display: inline-block;
}

.nav-links a:hover {
    background: #218838;
}
</style>
</head>
<body>

<div class="container">
    <h2>📦 Admin - Manage Products</h2>
    <%
    AdminBean ab = (AdminBean)session.getAttribute("abean");
    ArrayList<ProductBean> al = (ArrayList<ProductBean>)session.getAttribute("alist");
    out.println("<p>Welcome, <strong>" + ab.getfName() + "</strong></p>");

    if(al.size() == 0) {
        out.println("<p><strong>No Products Available.</strong></p>");
    } else {
    %>
    <table>
        <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        <%
        for (ProductBean pb : al) {
        %>
        <tr>
            <td><%= pb.getCode() %></td>
            <td><%= pb.getName() %></td>
            <td><%= pb.getPrice() %></td>
            <td><%= pb.getQty() %></td>
            <td>
                <a href="edit?pcode=<%= pb.getCode() %>" class="action-btn edit-btn">✏ Edit</a>
                <a href="delete?pcode=<%= pb.getCode() %>" class="action-btn delete-btn">🗑 Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
    <% } %>

    <div class="nav-links">
        <a href="Product.html">➕ Add Product</a>
        <a href="logout">🚪 Logout</a>
    </div>
</div>

</body>
</html>
