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
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dairy Products</title>
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
	
	

	<div
    id="carouselAutoplaying"
    class="carousel slide carousel-dark mt-3 mb-3"
    data-bs-ride="carousel"
    data-bs-interval="3000"
    data-bs-pause="false"
  >
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="img/b1.jpg" class="d-block w-100" alt="Slide 1" />
      </div>
      <div class="carousel-item">
        <img src="img/b2.jpg" class="d-block w-100" alt="Slide 2" />
      </div>
      <div class="carousel-item">
        <img src="img/b3.jpg" class="d-block w-100" alt="Slide 3" />
      </div>
      <div class="carousel-item">
        <img src="img/b4.jpg" class="d-block w-100" alt="Slide 4" />
      </div>
    </div>
    <button
      class="carousel-control-prev"
      type="button"
      data-bs-target="#carouselAutoplaying"
      data-bs-slide="prev"
    >
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button
      class="carousel-control-next"
      type="button"
      data-bs-target="#carouselAutoplaying"
      data-bs-slide="next"
    >
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
	 


	<div class="container">
		<div
			class="row bg-success text-center p-5 text-white border-bottom shadow">
			<h1>Products</h1>
			<small class="fs-5">We have adopted a Corporate Social
				Responsibility (“CSR”) policy in compliance with the requirements of
				the Companies Act, 2013 and the rules framed there under. Our CSR
				activities are primarily focused on initiatives related to education
				and these activities are centered around the geographical areas near
				our processing plants.</small>
		</div>
	</div>

	<div class="container">
		<h2 class="text-center">Welcome To Our Dairy Products</h2>
		<h3 class="text-center">.....Eat Healthy Stay Healthy.....</h3>
		<br> <br>

		<%-- Milk Products Section --%>
		<section class="product-section">
			<h2 class="text-center">Milk Products</h2>
			<div class="row">
				<%
				ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> milkList = dao.getMilkProduct();
				for (ProductDtls b : milkList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_milkproduct.jsp">
					<button>View All</button>
				</a>
			</div>
		</section>

		<!-- Paneer Products Section -->
		<section class="product-section">
			<h2 class="text-center">Paneer Products</h2>
			<div class="row">
				<%
				ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> paneerList = dao2.getPaneerProduct();
				for (ProductDtls b : paneerList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_paneer.jsp">
					<button>View All</button>
				</a>
			</div>
		</section>

		<!-- Ghee Products Section -->
		<section class="product-section">
			<h2 class="text-center">Ghee Products</h2>
			<div class="row">
				<%
				ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> gheeList = dao3.getGheeProduct();
				for (ProductDtls b : gheeList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_ghee.jsp">
					<button>View All</button>
				</a>
		</section>

		<!-- Curd Products Section -->
		<section class="product-section">
			<h2 class="text-center">Curd Products</h2>
			<div class="row">
				<%
				ProductDAOImpl dao4 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> curdList = dao4.getCurdProduct();
				for (ProductDtls b : curdList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_curd.jsp">
					<button>View All</button>
				</a>
		</section>

		<!-- Ice Creams Products Section -->
		<section class="product-section">
			<h2 class="text-center">Ice Creams</h2>
			<div class="row">
				<%
				ProductDAOImpl dao5 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> iceCreamList = dao5.getIceCreamProduct();
				for (ProductDtls b : iceCreamList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_icecream.jsp">
					<button>View All</button>
				</a>
		</section>

		<!-- Milk Shake Products Section -->
		<section class="product-section">
			<h2 class="text-center">Milk Shakes</h2>
			<div class="row">
				<%
				ProductDAOImpl dao6 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> milkShakeList = dao6.getMilkShakeProduct();
				for (ProductDtls b : milkShakeList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;"
							class="img-responsive center-block" alt="<%=b.getProductName()%>">
						<p><%=b.getProductName()%>/-
						</p>
						<p class="price">
							Rs.<%=b.getPrice()%></p>
						<a href="view_products.jsp?pid=<%=b.getProductId()%>"
							class="btn btn-primary btn-sm ml-2">Details</a>
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_milkshakes.jsp">
					<button>View All</button>
				</a>
		</section>

		<!-- Lassi Products Section -->
		<section class="product-section">
			<h2 class="text-center">Lassi Products</h2>
			<div class="row">
				<%
				ProductDAOImpl dao7 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> lassiList = dao7.getLassiProduct();
				for (ProductDtls b : lassiList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_lassi.jsp">
					<button>View All</button>
				</a>
		</section>

		<!-- Ice Bars Products Section -->
		<section class="product-section">
			<h2 class="text-center">Ice Bars</h2>
			<div class="row">
				<%
				ProductDAOImpl dao8 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> iceBarList = dao8.getIceBarProduct();
				for (ProductDtls b : iceBarList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_icebars.jsp">
					<button>View All</button>
				</a>
		</section>

		<!-- Cheese Products Section -->
		<section class="product-section">
			<h2 class="text-center">Cheese Products</h2>
			<div class="row">
				<%
				ProductDAOImpl dao9 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> cheeseList = dao9.getCheeseProduct();
				for (ProductDtls b : cheeseList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to wishlist</a>

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
				<a href="all_cheese.jsp">
					<button>View All</button>
				</a>
		</section>

		<!-- Other Products Section -->
		<section class="product-section">
			<h2 class="text-center">Other Products</h2>
			<div class="row">
				<%
				ProductDAOImpl dao0 = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> othersList = dao0.getOtherProduct();
				for (ProductDtls b : othersList) {
				%>
				<div class="col-md-3">
					<div class="product-card">
						<img src="products/<%=b.getPhotoName()%>"
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
							Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							to Wishlist</a>
						<%
						} else {
						%>
						<a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-2">Add to Cart</a> <a
							href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success btn-sm ml-2">Add to Wishlist</a>

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
		</section>
</body>
</html>
