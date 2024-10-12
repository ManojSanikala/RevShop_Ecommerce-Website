<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.entity.Products"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Products</title>
    <%@include file="allcss.jsp"%>
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
    
    <!-- Redirect to login if user not logged in -->
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>

    <!-- Success Message -->
    <c:if test="${not empty succMsg}">
        <h4 class="text-center text-success">${succMsg}</h4>
        <c:remove var="succMsg" scope="session" />
    </c:if>

    <!-- Error Message -->
    <c:if test="${not empty failedMsg}">
        <h4 class="text-center text-danger">${failedMsg}</h4>
        <c:remove var="failedMsg" scope="session" />
    </c:if>

    <div class="container">
        <!-- Heading -->
        <h1 class="heading">All Products</h1>

        <!-- Table -->
        <div class="table-container">
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Image</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    // Fetching products from the database
                    ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
                    List<Products> list = dao.getAllProducts();
                    
                    if(list != null && !list.isEmpty()) {
                        // Loop through the list and display products
                        for (Products b : list) {
                    %>
                    <tr>
                        <td><%=b.getProductId()%></td>
                        <td><img src="../products/<%=b.getPhoto()%>" style="width: 50px; height: 50px;" alt="No Image"></td>
                        <td><%=b.getProductName()%></td>
                        <td><%=b.getDescription()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><%=b.getProductCategory()%></td>
                        <td><%=b.getStock()%></td>
                        <td>
                            <a href="edit_products.jsp?id=<%=b.getProductId()%>" class="btn btn-sm btn-primary">Edit</a>
                            <a href="delete?id=<%=b.getProductId()%>" class="btn btn-sm btn-danger">Delete</a> <!-- Updated delete link -->
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No Products Available</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS (including Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
