<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
    text-align: center;
    color: red;
}
</style>
</head>
<body>
<div class="container">
<%
String msg = (String)request.getAttribute("msg");
out.println(msg);
%>
</div>
<%@include file="home.html" %>
</body>
</html>