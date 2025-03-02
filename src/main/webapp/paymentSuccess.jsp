<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Successful</title>
<style>
/* Reset styles */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

/* Centered container */
.container {
    width: 50%;
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
}

/* Heading style */
h2 {
    color: #28a745;
    font-size: 24px;
}

/* Message styling */
p {
    font-size: 18px;
    margin: 10px 0;
    color: #333;
}

/* Button styles */
a {
    display: inline-block;
    padding: 10px 15px;
    margin: 10px;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    transition: background 0.3s ease;
}

a:first-of-type {
    background-color: #007bff;
    color: white;
}

a:last-of-type {
    background-color: #28a745;
    color: white;
}

a:hover {
    opacity: 0.8;
}
</style>
</head>
<body>

<%
    String customerName = request.getParameter("customer");
    String amount = request.getParameter("amount");
%>

<div class="container">
    <h2>Payment Successful! 🎉</h2>
    <p>Thank you, <strong><%= customerName %></strong>, for your purchase.</p>
    <p><strong>Amount Paid: ₹<%= amount %></strong></p>
    
    <a href="ViewAllProductsCust.jsp">🛍️ Continue Shopping</a>
    <a href="home.html">🏠 Go to Home</a>
</div>

</body>
</html>
