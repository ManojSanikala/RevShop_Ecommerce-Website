<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.ProductDtls"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Milk Products</title>
<%@ include file="all_component/allcss.jsp"%>

<style>
body {
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
    gap: 20px;
    margin: 0 auto;
    max-width: 1600px;
}

.col-md-3 {
    flex: 1 1 calc(25% - 20px);
    box-sizing: border-box;
}

.product-card {
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 420px;
    width: 100%;
    box-sizing: border-box;
}

.product-card img {
    width: 150px;
    height: 200px;
    object-fit: cover;
    border-radius: 8px;
    margin: 0 auto 15px;
    display: block;
}

.product-card .product-name {
    font-size: 1.2rem;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
    height: auto;
    overflow: hidden;
    text-overflow: ellipsis;
}

.product-card .description {
    font-size: 0.9rem;
    color: #555;
    height: auto;
    overflow: hidden;
    text-overflow: ellipsis;
    margin-bottom: 15px;
}

.product-card .price {
    font-size: 1.4rem;
    color: #e67e22;
    font-weight: bold;
    margin: 15px 0;
}

.product-card .button-group {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin-top: auto;
}

.product-card .button-group a {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    font-size: 1rem;
    text-decoration: none;
    text-align: center;
    display: inline-block;
    transition: background-color 0.3s ease;
}

.product-card .btn-details {
    background-color: #3498db;
    color: #fff;
}

.product-card .btn-details:hover {
    background-color: #2980b9;
}

.product-card .btn-cart {
    background-color: #e67e22;
    color: #fff;
}

.product-card .btn-cart:hover {
    background-color: #d35400;
}

.product-card .btn-wishlist {
    background-color: #2ecc71;
    color: #fff;
}

.product-card .btn-wishlist:hover {
    background-color: #27ae60;
}
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
<%
User u=(User)session.getAttribute("userobj"); 
%>

<c:if test="${not empty addCart }">

<div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>

</c:if>



	<%@ include file="all_component/navbar.jsp"%>
	<%-- Milk Products Section --%>
	<section class="product-section">
		<h2 class="text-center">Milk Products</h2>
		<div class="row">
			<% 
                ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
                List<ProductDtls> milkList = dao.getAllMilkProduct();
                for(ProductDtls b : milkList) {
            %>
			<div class="col-md-3">
				<div class="product-card">
					<img src="products/<%=b.getPhotoName()%>"
						alt="<%=b.getProductName()%>">
					<p class="product-name"><%=b.getProductName()%></p>
					<p class="price">
						Rs.<%=b.getPrice()%>/-
					</p>
					<div class="button-group">
						<a href="view_products.jsp?pid=<%=b.getProductId()%>"
							class="btn-details">Details</a>
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn-cart">Add to Cart</a> <a
							href="login.jsp" class="btn-wishlist">Add to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn-cart">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn-wishlist">Add to Wishlist</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<% } %>
		</div>
	</section>
</body>
</html>
