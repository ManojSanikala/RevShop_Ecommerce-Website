<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Product_Order"%>
<%@ page import="com.DAO.ProductOrderImpl"%>
<%@ page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Orders</title>
<%@include file="allcss.jsp"%>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	padding: 20px;
}

.container {
	margin-top: 40px;
}

.heading {
	text-align: center;
	margin-bottom: 40px;
	color: #007bff;
}

.table-container {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<!-- Centered Heading -->
		<h1 class="heading">All Orders</h1>

		<!-- Table -->
		<div class="table-container">
			<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th scope="col">Order ID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Phone Number</th>
						<th scope="col">Product Name</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
						
					</tr>
				</thead>
				<tbody>
					<%
					ProductOrderImpl dao = new ProductOrderImpl(DBConnect.getConn());
					List<Product_Order> blist = dao.getAllOrders();
					for (Product_Order b : blist) {
					%>
					<tr>
						<th scope="row"><%=b.getOrderId()%></th>
						<td><%=b.getUserName()%></td>
						<td><%=b.getEmail()%></td>
						<td><%=b.getFulladd()%></td>
						<td><%=b.getPhoneNo()%></td>
						<td><%=b.getProductName()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPaymentType()%></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</div>

	<!-- Bootstrap JS (including Popper.js) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>