<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
/* Reset and basic styles */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

/* Container for dashboard */
.container {
    width: 50%;
    max-width: 500px;
    margin: 100px auto;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
    text-align: center;
}

/* Welcome text */
h2 {
    color: #dc3545;
    font-size: 24px;
    margin-bottom: 20px;
}

/* Links as buttons */
.nav-links {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.nav-links a {
    text-decoration: none;
    color: white;
    background-color: #dc3545;
    padding: 12px;
    border-radius: 5px;
    font-size: 18px;
    font-weight: bold;
    transition: 0.3s ease;
}

.nav-links a:hover {
    background-color: #c82333;
}
</style>
</head>
<body>

<%
AdminBean ab = (AdminBean) session.getAttribute("abean");
%>

<div class="container">
    <h2>👨‍💼 Welcome, Admin <%= ab.getfName() %>!</h2>
    
    <div class="nav-links">
        <a href="Product.html">➕ Add Product</a>
        <a href="view">📋 View All Products</a>
        <a href="logout">🚪 Logout</a>
    </div>
</div>

</body>
</html>
