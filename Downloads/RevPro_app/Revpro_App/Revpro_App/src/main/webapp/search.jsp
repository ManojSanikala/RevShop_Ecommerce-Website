<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.ProductDtls"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Cheese Products</title>
<%@ include file="all_component/allcss.jsp"%>

<style>
    body{
    	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.product-section {
	padding: 50px 0;
	background-color: #fff;
}

.text-center {
	text-align: center;
	margin-bottom: 50px;
	font-size: 2.5rem;
	color: #333;
	font-weight: bold;
	text-transform: uppercase;
}

.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 20px; /* Consistent gap between cards */
	margin: 0 auto;
	max-width: 1600px; /* Ensures larger cards fit in a row */
}

.col-md-3 {
	flex: 1;
	min-width: 220px; /* Ensures five cards fit on larger screens */
	max-width: 260px; /* Uniform width */
	margin: 15px; /* Consistent margin */
}

.product-card {
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 15px;
	text-align: center;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 420px; /* Increased card height */
	width: 100%; /* Ensures the card fills its container */
	box-sizing: border-box;
	/* Include padding in height and width calculations */
}

.product-card img {
	width: 100%;
	height: 160px; /* Consistent image height */
	object-fit: cover; /* Ensures images are cropped uniformly */
	border-radius: 8px;
	margin-bottom: 12px;
	transition: transform 0.3s ease;
}

.product-card .product-name {
	font-size: 1.2rem;
	font-weight: bold;
	color: #333;
	margin-bottom: 10px;
	height: auto; /* Allows product names to wrap if necessary */
	overflow: hidden;
	text-overflow: ellipsis;
}

.product-card .description {
	font-size: 0.9rem;
	color: #555;
	height: auto; /* Allows description to wrap if necessary */
	overflow: hidden;
	text-overflow: ellipsis;
	margin-bottom: 15px;
	/* Added margin to create space between description and price */
}

.product-card .price {
	font-size: 1.4rem;
	color: #e67e22;
	font-weight: bold;
	margin: 15px 0; /* Increased margin for better spacing */
}

.product-card button {
	background-color: #e67e22;
	color: #fff;
	padding: 10px 20px; /* Increased padding */
	border: none;
	border-radius: 4px;
	font-size: 1rem; /* Slightly increased font size */
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-top: auto; /* Push button to the bottom of the card */
}

.product-card button:hover {
	background-color: #d35400;
}
</style>

<script>
function showNoProductsFound() {
    alert("No such products found.");
}
</script>

</head>
<body>

<%
User u=(User)session.getAttribute("userobj"); 
%>

<%@ include file="all_component/navbar.jsp"%>
<section class="product-section">
    <h4 class="text-center">Your Search Results</h4>
    <div class="row">
        <% 
        String ch=request.getParameter("ch");
        ProductDAOImpl dao9 = new ProductDAOImpl(DBConnect.getConn());
        List<ProductDtls> list = dao9.getProductBySearch(ch);
        
        if (list.isEmpty()) {
        %>
        <script>
            showNoProductsFound();
        </script>
        <% } else { 
            for(ProductDtls b : list) {
        %>
        <div class="col-md-3">
            <div class="product-card">
                <img src="products/<%= b.getPhotoName() %>"
                    style="width: 150px; height: 200px;"
                    class="img-responsive center-block"
                    alt="<%= b.getProductName() %>">
                <p class="product-name"><%= b.getProductName() %></p>
                <p class="description"><%= b.getDescription() %></p>
                <p class="price">$<%= b.getPrice() %></p>
                <% if(u==null) {%>
                <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                <% } else { %>
                <a href="cart?pid=<%=b.getProductId() %>&&uid=<%=u.getId() %>"
                    class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                <% } %>
            </div>
        </div>
        <% } } %>
    </div>
</section>
</body>
</html>
