<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.UserDAOImpl"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Details</title>
<!--<%@include file="allcss.jsp"%> -->
<style>
/* Form-Specific Styles */
.form-container {
    max-width: 600px;
    margin: 40px auto 0 auto;
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

.form-control {
    height: 45px;
    border-radius: 10px;
    margin-bottom: 20px;
    padding: 10px;
    font-size: 16px;
}

.form-control:focus {
    box-shadow: none;
    border-color: #007bff;
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
    <div class="form-container">
        <h2 class="form-title">Update Your Details</h2>

        <%
        // Get user ID from request
        int id = Integer.parseInt(request.getParameter("id"));
        UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
        User user = dao.getUserById(id); // Assuming you have a method to get user by ID

        if (user != null) {
        %>
        
        <form action="updateUserServlet" method="post">
            <!-- Hidden input to store user ID -->
            <input type="hidden" name="id" value="<%= user.getId() %>">

            <!-- Full Name -->
            <div class="form-group mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input name="name" type="text" class="form-control" id="name" placeholder="Enter full name" required value="<%= user.getName() %>">
            </div>

            <!-- Email -->
            <div class="form-group mb-3">
                <label for="email" class="form-label">Email</label>
                <input name="email" type="email" class="form-control" id="email" placeholder="Enter email" required value="<%= user.getEmail() %>">
            </div>

            <!-- Password -->
            <div class="form-group mb-3">
                <label for="password" class="form-label">Password</label>
                <input name="password" type="password" class="form-control" id="password" placeholder="Enter password" required value="<%= user.getPassword() %>">
            </div>

            

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary w-100">Update</button>
        </form>

        <% } else { %>
            <p>User not found.</p>
        <% } %>

    </div>

    <!-- Bootstrap JS (including Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
