<%@ page import="java.util.List"%>
<%@ page import="com.entity.Products"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Revshop</title>
<%@ include file="all_component/allcss.jsp"%>
<style>
body {
	margin: 0;
	padding: 0;
	min-height: 100vh;
	position: relative;
	padding-bottom: 60px; /* Ensure there's space for the footer */
}

footer {
	position: fixed; /* Fixed at the bottom of the viewport */
	bottom: 0;
	left: 0;
	width: 100%;
	background-color: #198754; /* Background color */
	color: white;
	text-align: center;
	padding: 10px 0;
	visibility: hidden; /* Initially hidden */
	opacity: 0; /* Initially transparent */
	transition: visibility 0s, opacity 0.5s ease-in-out;
	/* Smooth transition */
}

.product-section {
	margin: 30px 0; /* Adding some margin to the top and bottom */
}

.product-card {
	border: 1px solid #ddd;
	padding: 20px; /* Increased padding for a more spacious feel */
	text-align: center;
	margin-bottom: 30px;
	background-color: #fff; /* Slightly different background color */
	border-radius: 15px; /* Rounded corners */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); /* Enhanced shadow */
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-card:hover {
	transform: translateY(-5px); /* Subtle lift effect on hover */
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
	/* More pronounced shadow */
}

.product-card img {
	height: 100px; /* Set a fixed height */
	width: 20%; /* Ensure the image spans the width of its container */
	object-fit: cover; /* Maintain aspect ratio and cover the container */
	border-radius: 10px; /* Rounded corners for the image */
	margin-bottom: 15px; /* Space below the image */
}

.product-card p {
	margin-bottom: 10px;
	font-weight: bold; /* Making the product names bolder */
	color: #333; /* Darker text for better readability */
}

.product-card .price {
	font-size: 1.4em; /* Slightly larger font size */
	font-weight: bold;
	color: #28a745;
	margin-bottom: 15px;
}

.product-card button {
	background-color: #007bff;
	border: none;
	color: white;
	padding: 12px 25px; /* Increased padding for a larger button */
	text-align: center;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.product-card button:hover {
	background-color: #0056b3;
	transform: scale(1.05); /* Slightly enlarges the button on hover */
}

.view-all-button {
	text-align: center;
	margin-top: 30px; /* Increased margin for better separation */
}

.view-all-button button {
	background-color: #007bff;
	border: none;
	color: white;
	padding: 12px 25px;
	text-align: center;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.view-all-button button:hover {
	background-color: #0056b3;
	transform: scale(1.05);
}
</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@ include file="all_component/navbar.jsp"%>


	

	<div class="container">
		<h2 class="text-center">Welcome To Our Revshop Products</h2>
		<h3 class="text-center">.....Click, Shop, and Rev Up.....</h3>
		<br> <br>
		</div>



		<%-- Electronic Products Section --%>
		<section class="product-section">
			<h2 class="text-center">Electronics</h2>
			<div class="row">
				<%
				ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
				List<Products> electronicList = dao.getElectronicProduct();
				for (Products b : electronicList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;"
							class="img-responsive center-block" alt="<%=b.getProductName()%>">
						<p><%=b.getProductName()%></p>


						<p class="price">
							Rs.<%=b.getPrice()%>/-
						</p>
						<a href="view_products.jsp?pid=<%=b.getProductId()%>"
							class="btn btn-primary btn-sm ml-2">Details</a>

						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a>
							
						<%
						}
						%>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="view-all-button">
				<a href="all_electronicproduct.jsp">
					<button>View All</button>
				</a>
			</div>
		</section>

		<%-- Home Products Section --%>
		<section class="product-section">
			<h2 class="text-center">Home</h2>
			<div class="row">
				<%
				ProductDAOImpl dao1 = new ProductDAOImpl(DBConnect.getConn());
				List<Products> homeList = dao1.getHomeProduct();
				for (Products b : homeList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;"
							class="img-responsive center-block" alt="<%=b.getProductName()%>">
						<p><%=b.getProductName()%></p>


						<p class="price">
							Rs.<%=b.getPrice()%>/-
						</p>
						<a href="view_products.jsp?pid=<%=b.getProductId()%>"
							class="btn btn-primary btn-sm ml-2">Details</a>

						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a>
							
						<%
						}
						%>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="view-all-button">
				<a href="all_home.jsp">
					<button>View All</button>
				</a>
			</div>
		</section>
		
		<%-- Fashion Products Section --%>
		<section class="product-section">
			<h2 class="text-center">Fashion</h2>
			<div class="row">
				<%
				ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
				List<Products> fashionList = dao2.getFashionProduct();
				for (Products b : fashionList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;"
							class="img-responsive center-block" alt="<%=b.getProductName()%>">
						<p><%=b.getProductName()%></p>


						<p class="price">
							Rs.<%=b.getPrice()%>/-
						</p>
						<a href="view_products.jsp?pid=<%=b.getProductId()%>"
							class="btn btn-primary btn-sm ml-2">Details</a>

						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a>
							
						<%
						}
						%>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="view-all-button">
				<a href="all_fashion.jsp">
					<button>View All</button>
				</a>
			</div>
		</section>

<%-- Others Section --%>
		<section class="product-section">
			<h2 class="text-center">Others</h2>
			<div class="row">
				<%
				ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConn());
				List<Products> otherList = dao3.getOtherProduct();
				for (Products b : otherList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;"
							class="img-responsive center-block" alt="<%=b.getProductName()%>">
						<p><%=b.getProductName()%></p>


						<p class="price">
							Rs.<%=b.getPrice()%>/-
						</p>
						<a href="view_products.jsp?pid=<%=b.getProductId()%>"
							class="btn btn-primary btn-sm ml-2">Details</a>

						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to
							Cart</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a>
							
						<%
						}
						%>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="view-all-button">
				<a href="all_others.jsp">
					<button>View All</button>
				</a>
			</div>
		</section>
		<div class="container">
			<div
				class="row bg-success text-center p-5 text-white border-bottom shadow">
				<h1>About us</h1>
				<small class="fs-5"><p>
                RevShop is an innovative e-commerce platform that offers a wide 
                range of products, focusing on three main categories: electronics, 
                home appliances, and fashion. The platform provides both buyers and
                 sellers with a seamless shopping experience, offering a user-friendly
                  interface for product browsing, secure payment options, and fast delivery services.
            </p></small>
			</div>
		</div>
</body>
</html>
