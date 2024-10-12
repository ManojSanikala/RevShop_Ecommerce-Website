<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <%@ include file="all_component/allcss.jsp"%>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-body i {
            font-size: 2.5rem;
            color: #007bff;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp"%>

    <div class="container mt-5">
        <h1 class="text-center mb-4">Settings</h1>
        <div class="row">
            <!-- My Account -->
            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-user-circle"></i>
                        <h5 class="card-title mt-3">My Account</h5>
                        <p class="card-text">Manage your account details and settings.</p>
                        <a href="#" class="btn btn-primary">Go to My Account</a>
                    </div>
                </div>
            </div>
            <!-- My Orders -->
            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <div class="card-body">
                       <i class="fas fa-box" style="color: green;"></i>
                        <h5 class="card-title mt-3">My Orders</h5>
                        <p class="card-text">View and track your orders.</p>
                        <a href="trackOrders" class="btn btn-primary">Go to My Orders</a>
                    </div>
                </div>
            </div>
            <!-- My Wishlist -->
            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-heart" style="color: red;"></i>
                        <h5 class="card-title mt-3">My Wishlist</h5>
                        <p class="card-text">View items you've saved to your wishlist.</p>
                        <a href="wishlist.jsp" class="btn btn-primary">Go to My Wishlist</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
