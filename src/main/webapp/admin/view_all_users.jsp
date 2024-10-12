<%@ page import="java.util.List" %>
<%@ page import="com.entity.User, com.DAO.UserDAOImpl" %>
<%@ page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Users</title>
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
        <h2 class="text-center">All Users</h2>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Role</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                	UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                    List<User> userList = dao.getAllUsers();
                    if (userList != null) {
                        for (User user : userList) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPhno() %></td>
                    <td><%= user.getState() %></td>
                    
                    
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">No users found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
			</table>
		</div>
	

	<!-- Bootstrap JS (including Popper.js) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>