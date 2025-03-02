<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
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
    width: 50%;
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

/* Product details */
.product-details {
    font-size: 18px;
    margin-bottom: 20px;
}

.product-details p {
    margin: 8px 0;
    font-weight: bold;
}

/* Form styling */
form {
    margin-top: 20px;
}

label {
    font-size: 16px;
    font-weight: bold;
}

input[type="number"] {
    width: 50%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    text-align: center;
}

/* Submit button */
input[type="submit"] {
    background-color: #007bff;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 15px;
    transition: background 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Error message */
.error {
    color: red;
    font-size: 18px;
    font-weight: bold;
}
</style>
</head>
<body>

<div class="container">
    <%
    CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
    ProductBean pb = (ProductBean) session.getAttribute("aaaa");

    if (cb != null && pb != null) {
    %>
        <h3>Page Belongs to Customer: <%= cb.getCustNm() %></h3>
        <div class="product-details">
            <p><strong>Product Code:</strong> <%= pb.getCode() %></p>
            <p><strong>Product Name:</strong> <%= pb.getName() %></p>
            <p><strong>Price:</strong> ₹<%= pb.getPrice() %></p>
            <p><strong>Available Quantity:</strong> <%= pb.getQty() %></p>
        </div>

        <form action="billgenerator" method="post">
            <input type="hidden" value="<%= pb.getCode() %>" name="pcode">
            <label>Enter Quantity: </label>
            <input type="number" name="pqty" required min="1"><br><br>
            <input type="submit" value="Generate Bill"> 
        </form>
    <%
    } else {
        out.println("<p class='error'>Product not found. Please try again.</p>");
    }
    %>
</div>

</body>
</html>
