<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Wishlist"%>
<%@ page import="com.DAO.WishlistDAOImpl"%>
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
<title>Your Wishlist</title>
<style>
/* Your existing styles */
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 20px;
}

.cart, .details {
	width: 60%;
	padding: 20px;
	box-sizing: border-box;
	margin-bottom: 20px;
}

.cart {
	border: 1px solid #ccc;
	padding-bottom: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	background-color: #f9f9f9;
}

h2 {
	text-align: center;
	color: #333;
}

.table-responsive {
	width: 100%;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.remove-btn {
	color: white;
	background-color: red;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 5px;
}

.quantity-btn {
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 5px;
}

.quantity-btn.minus {
	background-color: red;
	color: white;
}

.quantity-btn.plus {
	background-color: green;
	color: white;
}

.form-row {
	display: flex;
	justify-content: space-between;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	margin-bottom: 5px;
	display: block;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}

.form-check-input {
	margin-right: 10px;
}

.btn {
	padding: 10px 20px;
	cursor: pointer;
	border: none;
	color: white;
	border-radius: 5px;
}

</style>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container">
		<!-- Wishlist Section -->
		<div class="cart">
			<h2>Your Items in Wishlist</h2>
			<div class="table-responsive">
				<table>
					<thead>
						<tr>
							<th>Image</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>View</th>
							<th>Action</th>	
						</tr>
					</thead>
					<tbody>

						<%
                        User u = (User) session.getAttribute("userobj");
                        WishlistDAOImpl dao = new WishlistDAOImpl(DBConnect.getConn());
                        ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
                        List<Wishlist> wishlist = dao.getProductbyUser(u.getId());
                        for (Wishlist w : wishlist) {
                        	ProductDtls product = dao2.getProductById(w.getPid());
                        %>
						<tr>
							<td><img src="products/<%=product.getPhotoName()%>" alt="<%=w.getProductname()%>" style="width: 100px; height: 100px;"></td>
							<td><%=w.getProductname()%></td>
							<td>Rs.<%=w.getPrice()%>/-</td>
							<td><a href="view_products.jsp?pid=<%=product.getProductId() %>" class="btn btn-primary">Details</a></td>
							<td><a href="remove_wishlist?pid=<%=w.getPid()%>&amp;uid=<%=w.getUserId()%>" class="remove-btn">Remove</a></td>
						</tr>
						<%
                        }
                        %>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
