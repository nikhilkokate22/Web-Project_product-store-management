<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.CustomerBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>
<style>
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}
.container {
    width: 50%;
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
}
h3 {
    color: #333;
}
.profile-info {
    font-size: 18px;
    margin-bottom: 10px;
}
a {
    display: block;
    text-decoration: none;
    background-color: #007bff;
    color: white;
    padding: 10px;
    border-radius: 5px;
    margin-top: 15px;
    transition: background 0.3s ease;
}
a:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>

<div class="container">
    <h3>Customer Profile</h3>
    <%
    CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
    if (cb != null) {
    %>
        <p class="profile-info"><strong>Name:</strong> <%= cb.getCustNm() %></p>
        <p class="profile-info"><strong>Phone:</strong> <%= cb.getCustPhno() %></p>
        <p class="profile-info"><strong>City:</strong> <%= cb.getCustCt() %></p>
        <p class="profile-info"><strong>Email:</strong> <%= cb.getCustMid() %></p>
        <a href="CustomerLoginSuccess.jsp">Back to Dashboard</a>
    <%
    } else {
        out.println("<p style='color: red;'>Session expired. Please login again.</p>");
    }
    %>
</div>

</body>
</html>
