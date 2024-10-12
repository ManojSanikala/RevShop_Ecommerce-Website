<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Products</title>
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
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="form-container">
		<h2 class="form-title">Add New Product</h2>

		<c:if test="${not empty succMsg }">
			<p class="text-center text-success">${succMsg }</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failedMsg }">
			<p class="text-center text-danger">${failedMsg }</p>
			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<form action="../add_products" method="post"
			enctype="multipart/form-data">
			<!-- Product Name -->
			<div class="form-group mb-3">
				<label for="productName" class="form-label">Product Name</label> <input
					name="pname" type="text" class="form-control" id="productName"
					placeholder="Enter product name" required>
			</div>

			<!-- Product Description -->
			<div class="mb-3">
				<label for="description" class="form-label">Product
					Description</label>
				<textarea name="description" class="form-control" id="description"
					rows="3" maxlength="100"
					placeholder="Enter product description (max 100 words)" required></textarea>
			</div>

			<!-- Price -->
			<div class="form-group mb-3">
				<label for="price" class="form-label">Price</label> <input
					name="price" type="number" class="form-control" id="price"
					placeholder="Enter product price" required>
			</div>



			<!-- Product Category -->
			<div class="form-group mb-3">
				<label for="category" class="form-label">Product Category</label> <select
					class="form-select" name="categories" id="category" required>
					<option selected disabled>Choose a category</option>
					<option value="milk">Milk</option>
					<option value="paneer">Paneer</option>
					<option value="ghee">Ghee</option>
					<option value="curd">Curd</option>
					<option value="ice-creams">Ice Creams</option>
					<option value="milk-shake">Milk Shake</option>
					<option value="lassi">Lassi</option>
					<option value="ice-bars">Ice Bars</option>
					<option value="cheese">Cheese</option>
					<option value="others">Others</option>
				</select>
			</div>

			<!-- Product Status -->
			<div class="form-group mb-3">
				<label for="status" class="form-label">Product Status</label> <select
					class="form-select" name="status" id="status" required>
					<option selected disabled>Choose a status</option>
					<option value="available">Available</option>
					<option value="unavailable">Unavailable</option>
				</select>
			</div>

			<!-- Upload Photo -->
			<div class="form-group mb-3">
				<label for="photo" class="form-label">Upload Photo</label> <input
					name="pimg" type="file" class="form-control" id="photo"
					accept="image/*" required>
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary w-100">Add
				Product</button>
		</form>
	</div>

	<!-- Bootstrap JS (including Popper.js) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>