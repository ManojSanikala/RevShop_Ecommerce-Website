<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="all_component/allcss.jsp"%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
 html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
    body {
        background-color: #f8f9fa; /* Light gray background */
        padding-top: 50px; /* Space for fixed navbar */
    }
    .card {
        border-radius: 15px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        background-color: #ffffff; /* White background */
    }
    .card-body {
        padding: 2rem; /* Extra padding */
    }
    .form-group label {
        font-weight: bold; /* Bold labels */
    }
    .form-check-label {
        font-size: 0.9rem; /* Slightly smaller font size */
    }
    .btn-primary {
        background-color: #007bff; /* Primary button color */
        border: none;
        border-radius: 25px; /* Rounded button */
        padding: 0.75rem 1.5rem; /* Larger padding */
        font-size: 1rem; /* Font size */
        transition: background-color 0.3s ease; /* Smooth transition */
    }
    .btn-primary:hover {
        background-color: #0056b3; /* Darker button color on hover */
    }
    .container {
        max-width: 600px; /* Max width for the container */
    }
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<h3 class="card-title text-center mb-4">Register</h3>
						
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="fullName">Enter Full Name</label>
								<input type="text" class="form-control" id="fullName" required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="email">Email address</label>
								<input type="email" class="form-control" id="email" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="phone">Phone No.</label>
								<input type="number" class="form-control" id="phone" required="required" name="phno">
							</div>
							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" class="form-control" id="password" required="required" name="password">
							</div>
							<div class="form-check mb-4">
								<input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
								<label class="form-check-label" for="exampleCheck1">I agree to the terms and conditions</label>
							</div>
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
