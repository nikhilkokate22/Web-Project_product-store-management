<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.CustomerBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<style>
/* Reset some default styles */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

/* Container styling */
.container {
    width: 80%;
    max-width: 500px;
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

/* Welcome message */
.welcome {
    font-size: 18px;
    font-weight: bold;
    color: #007bff;
    margin-bottom: 20px;
}

/* Button styles */
.nav-links {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.nav-links a {
    display: block;
    text-decoration: none;
    background-color: #007bff;
    color: white;
    padding: 10px;
    border-radius: 5px;
    font-size: 16px;
    transition: background 0.3s ease;
}

.nav-links a:hover {
    background-color: #0056b3;
}

/* Logout button */
.logout {
    background-color: #dc3545;
}

.logout:hover {
    background-color: #a71d2a;
}
</style>
</head>
<body>

<div class="container">
    <h3>Customer Dashboard</h3>
    <%
    CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
    if (cb != null) {
    %>
        <p class="welcome">Welcome, <%= cb.getCustNm() %>..! 🎉</p>
        <div class="nav-links">
            <a href="ViewProfile.html">View Profile</a>
            <a href="view2">View All Products</a>
            <a href="logout2" class="logout">Logout</a>
        </div>
    <%
    } else {
        out.println("<p style='color: red;'>Session expired. Please login again.</p>");
    }
    %>
</div>

</body>
</html>
