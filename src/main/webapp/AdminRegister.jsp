<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.welcome{
	color: green;
}
</style>
</head>
<body>
<div class="container">
    <h3>Admin Dashboard</h3>
    <%
    AdminBean ab = (AdminBean) session.getAttribute("Abean");
    if (ab != null) {
    %>
        <p class="welcome">Registered Successfully! 🎉</p>
        <%@include file="AdminLogin.html" %>
        
    <%
    } else {
        out.println("<p style='color: red;'>Session expired. Please register again.</p>");
        
    }
    %>
</div>
</body>
</html>