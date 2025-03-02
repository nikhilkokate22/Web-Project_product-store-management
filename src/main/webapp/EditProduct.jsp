<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
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
    width: 50%;
    margin: 50px auto;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
    text-align: center;
}

/* Heading */
h2 {
    color: #007bff;
    margin-bottom: 20px;
}

/* Form styling */
form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

label {
    font-weight: bold;
    margin-top: 10px;
}

input {
    width: 80%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    width: 50%;
    background: #007bff;
    color: white;
    font-weight: bold;
    border: none;
    cursor: pointer;
    margin-top: 15px;
    padding: 10px;
}

input[type="submit"]:hover {
    background: #0056b3;
}

/* Navigation link */
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
    <h2>🛠 Update Product</h2>
    <%
    AdminBean ab = (AdminBean)session.getAttribute("abean");
    ProductBean pb = (ProductBean)request.getAttribute("pbean");
    out.println("<p>Welcome, <strong>" + ab.getfName() + "</strong></p>");
    %>

    <form action="update" method="post">
        <input type="hidden" name="pcode" value="<%= pb.getCode() %>">

        <label>Product Price:</label>
        <input type="text" name="price" value="<%= pb.getPrice() %>" required>

        <label>Product Quantity:</label>
        <input type="number" name="qty" value="<%= pb.getQty() %>" required>

        <input type="submit" value="Update Product">
    </form>

    <div class="nav-links">
        <a href="view">🔙 Back to Products</a>
        <a href="logout">🚪 Logout</a>
    </div>
</div>

</body>
</html>
