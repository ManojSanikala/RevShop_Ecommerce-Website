<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.entity.ProductDtls"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Products</title>
<%@include file="allcss.jsp"%>
<style>
/* Form-Specific Styles */
.form-container {
	max-width: 600px;
	margin: 40px auto 0 auto; /* Adds space between navbar and form */
	background-color: white;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.form-title {
	text-align: center;
	margin-bottom: 30px;
	font-weight: bold;
	color: #007bff;
}

.form-label {
	font-weight: bold;
	color: #495057;
}

.form-control, .form-select {
	height: 45px;
	border-radius: 10px;
	margin-bottom: 20px;
	padding: 10px;
	font-size: 16px;
}

.form-control:focus, .form-select:focus {
	box-shadow: none;
	border-color: #007bff;
}

textarea.form-control {
	height: auto;
	resize: none;
}

button {
	height: 50px;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="form-container">
		<h2 class="form-title">Edit Product</h2>

		<%
		int id = Integer.parseInt(request.getParameter("id"));
		ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
		ProductDtls b = dao.getProductById(id);
		%>

		<form action="../editproducts" method="post">

			<input type="hidden" name="id" value="<%=b.getProductId()%>">
			<!-- Product Name -->
			<div class="form-group mb-3">
				<label for="productName" class="form-label">Product Name</label> <input
					name="pname" type="text" class="form-control" id="productName"
					placeholder="Enter product name" required
					value="<%=b.getProductName()%>">
			</div>

			<!-- Product Description -->
			<div class="mb-3">
				<label for="description" class="form-label">Product
					Description</label>
				<textarea name="description" class="form-control" id="description"
					rows="3" maxlength="100"
					placeholder="Enter product description (max 100 words)" required><%=b.getDescription().trim()%></textarea>
			</div>
			<!-- Price -->
			<div class="form-group mb-3">
				<label for="price" class="form-label">Price</label> <input
					name="price" type="number" class="form-control" id="price"
					placeholder="Enter product price" required
					value="<%=b.getPrice()%>">
			</div>

			<!-- Product Status -->
			<div class="form-group mb-3">
				<label for="status" class="form-label">Product Status</label> <select
					class="form-select" name="status" id="status" required>
					<option value="available"
						<%="Available".equals(b.getStatus()) ? "selected" : ""%>>Available</option>
					<option value="unavailable"
						<%="Unavailable".equals(b.getStatus()) ? "selected" : ""%>>Unavailable</option>
				</select>
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary w-100">Update</button>
		</form>
	</div>

	<!-- Bootstrap JS (including Popper.js) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>