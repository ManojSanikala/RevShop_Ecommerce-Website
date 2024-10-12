<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<style>
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
		<!-- Cart Section -->
		<div class="cart">
			<h2>Your Items in Cart</h2>
			<div class="table-responsive">
				<table>
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>

						<%
                    User u=(User)session.getAttribute("userobj");
                    CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
                    List<Cart> cart=dao.getProductbyUser(u.getId());
                    Double totalPrice=0.00;
                    for(Cart c:cart){
                    	totalPrice+=c.getTotalPrice();
                    %>
						<tr>
							<td><%=c.getProductname()%></td>
							<td>
					            <form action="update_cart_quantity" method="post" class="quantity-form">
					                <input type="hidden" name="pid" value="<%= c.getPid() %>">
					                <input type="hidden" name="uid" value="<%= c.getUserId() %>">
					                <button type="submit" name="action" value="decrement" class="quantity-btn minus">-</button>
					                <span><%= c.getQuantity() %></span>
					                <button type="submit" name="action" value="increment" class="quantity-btn plus">+</button>
					            </form>
					        </td>
							<td><%=c.getPrice() * c.getQuantity()%></td>
							<td><a
								href="remove_product?pid=<%=c.getPid()%>&&uid=<%=c.getUserId() %>"
								class="remove-btn">Remove</a></td>
						</tr>
						<%
                    }
                    %>
						<tr>
							<td>Total Price</td>
							<td></td>
							<td></td>
							<td><%=totalPrice%></td>
						</tr>

						<!-- Static Example Row -->

					</tbody>
				</table>
			</div>
		</div>
<div class="text-center form-buttons">
				<a href="checkout.jsp"><button type="submit" class="btn btn-warning">Order Now</button></a>	
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
				</div>