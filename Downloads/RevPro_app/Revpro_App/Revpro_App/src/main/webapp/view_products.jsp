<%@ page import="java.util.List"%>
<%@ page import="com.entity.ProductDtls"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
<%@ include file="all_component/allcss.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f8f8;
    margin: 0;
    padding: 20px;
}

.container {
    display: flex;
    max-width: 1000px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.left-side {
    width: 40%;
    padding-right: 20px;
    border-right: 1px solid #e0e0e0;
    text-align: center;
}

.left-side img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
}

.left-side h4 {
    margin-top: 15px;
    font-size: 24px;
    color: #333;
}

.left-side p {
    margin-top: 10px;
    font-size: 18px;
    color: #666;
}

.right-side {
    width: 60%;
    padding-left: 20px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.right-side h2 {
    font-size: 26px;
    color: #333;
    margin-bottom: 15px;
}

.right-side p {
    font-size: 16px;
    color: #666;
    margin-bottom: 20px;
    line-height: 1.6;
}

.features {
    margin-bottom: 20px;
}

.features div {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.features i {
    font-size: 20px;
    color: #28a745;
    margin-right: 10px;
}

.buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.buttons a {
    text-align: center;
    text-decoration: none;
    font-size: 18px;
    padding: 12px 0;
    border-radius: 5px;
    color: #fff;
    width: 48%;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.buttons a.add-to-cart {
    background-color: #e67e22;
}

.buttons a.add-to-cart:hover {
    background-color: #d35400;
    transform: translateY(-3px);
}

.buttons a.wishlist {
    background-color: #2ecc71;
}

.buttons a.wishlist:hover {
    background-color: #27ae60;
    transform: translateY(-3px);
}

.contact-info {
    font-size: 16px;
    color: #333;
    display: flex;
    align-items: center;
    margin-top: 20px;
}

.contact-info i {
    margin-right: 10px;
    font-size: 18px;
}
</style>
</head>
<body>

<%
    User u = (User) session.getAttribute("userobj");
%>
<%@ include file="all_component/navbar.jsp"%>

<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
    ProductDtls b = dao.getProductById(pid);
%>

<div class="container">
    <!-- Left Side -->
    <div class="left-side">
        <img src="products/<%=b.getPhotoName()%>" alt="Product Image">
        <h4>Title: <%=b.getProductName()%></h4>
        <p>Category: <%=b.getProductCategory()%></p>
        <p>Price: Rs.<%=b.getPrice()%></p>
    </div>

    <!-- Right Side -->
    <div class="right-side">
        <h2><%=b.getProductName()%></h2>
        <p><%=b.getDescription()%></p>

        <div class="features">
            <div><i class="fas fa-truck"></i> Free Delivery</div>
            <div><i class="fas fa-hand-holding-usd"></i> Cash on Delivery</div>
            <div><i class="fas fa-ban"></i> Return Not Available</div>
        </div>

        <div class="buttons">
            <% if (u == null) { %>
                <a href="login.jsp" class="add-to-cart">Add to Cart</a> 
                <a href="login.jsp" class="wishlist">Add to Wishlist</a> 
            <% } else { %>
                <a href="cart?pid=<%=b.getProductId()%>&uid=<%=u.getId()%>" class="add-to-cart">Add to Cart</a> 
                <a href="wishlist?pid=<%=b.getProductId()%>&uid=<%=u.getId()%>" class="wishlist">Add to Wishlist</a>
            <% } %>
        </div>

        <div class="contact-info">
            <i class="fas fa-envelope"></i> <span>admin@example.com</span>
        </div>
    </div>
</div>
</body>
</html>
