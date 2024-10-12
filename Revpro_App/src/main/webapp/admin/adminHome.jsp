<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<%@include file="allcss.jsp" %>
    <style>
        .container {
            margin-top: 50px;
        }
        .card {
            text-align: center;
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            background-color: #f8f9fa;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card .fa {
            font-size: 3rem;
            color: #007bff;
            margin-bottom: 15px;
            transition: color 0.3s;
        }
        .card:hover .fa {
            color: #0056b3;
        }
        .card-title {
            font-weight: bold;
            color: #333;
        }
        .card-body {
            padding: 30px 20px;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
</c:if>

<div class="container text-center">
    <h1 class="mb-5">Hello Admin</h1>
    <div class="row">
        <!-- Add Product Card -->
        <div class="col-md-3">
            <a href="add_products.jsp">
                <div class="card">
                    <div class="card-body">
                        <i class="fa fa-plus-square"></i>
                        <h5 class="card-title mt-3">Add Product</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- All Products Card -->
        <div class="col-md-3">
            <a href="all_products.jsp">
                <div class="card">
                    <div class="card-body">
                        <i class="fa fa-list"></i>
                        <h5 class="card-title mt-3">All Products</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- Order Card -->
        <div class="col-md-3">
            <a href="orders.jsp">
                <div class="card">
                    <div class="card-body">
                        <i class="fa fa-shopping-cart"></i>
                        <h5 class="card-title mt-3">Order</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- Logout Card -->
        <div class="col-md-3">
            <div class="card" onclick="return confirmLogout();">
                <div class="card-body">
                    <i class="fa fa-sign-out-alt"></i>
                    <h5 class="card-title mt-3">Logout</h5>
                </div>
            </div>
            <form id="logoutForm" action="../logout" method="post" style="display:none;">
                <input type="hidden" name="logout" value="true">
            </form>
        </div>
    </div>
</div>

<script>
    function confirmLogout() {
        if (confirm("Are you sure you want to log out?")) {
            document.getElementById("logoutForm").submit();
        }
        return false;
    }
</script>

<!-- Bootstrap JS (including Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
