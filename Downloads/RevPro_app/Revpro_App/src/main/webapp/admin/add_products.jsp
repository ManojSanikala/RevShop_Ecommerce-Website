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
	max-width: 90%; /* Adjusts the width to fit the screen size */
	margin: 20px auto; /* Reduces top margin */
	background-color: white;
	padding: 20px; /* Reduces padding to make the form less bulky */
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Reduces shadow for a cleaner look */
}

.form-title {
	text-align: center;
	margin-bottom: 20px; /* Reduces the space below the title */
	font-weight: bold;
	color: #007bff;
	font-size: 24px; /* Reduces font size for smaller screens */
}

.form-label {
	font-weight: bold;
	color: #495057;
}

.form-control, .form-select {
	height: 40px; /* Adjusts the input height */
	border-radius: 8px; /* Slightly reduces corner radius */
	margin-bottom: 15px; /* Reduces margin between inputs */
	padding: 8px;
	font-size: 14px; /* Slightly smaller font */
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
	height: 45px; /* Reduces button height */
	border-radius: 8px; /* Slightly reduces corner radius */
	font-size: 16px; /* Reduces font size */
	font-weight: bold;
}

/* Responsive Design */
@media (min-width: 768px) {
	.form-container {
		max-width: 60%; /* Increases width for larger screens */
		padding: 30px; /* Adds more padding on larger screens */
	}
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
					<option value="electronics">Electronics</option>
					<option value="home">Home Appliances</option>
					
					<option value="fashion">Fashion</option>
					
					<option value="others">Others</option>
				</select>
			</div>

			<!-- Product Stock -->
<div class="form-group mb-3">
    <label for="stock" class="form-label">Product Stock</label> 
    <input type="number" class="form-control" name="stock" id="stock" min="0" required>
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