<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Product_Order"%>
<%@ page import="com.DAO.ProductOrderImpl"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Track My Orders</title>
    <style>
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
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

        .order-id {
            font-weight: bold;
            color: #007bff;
        }
    </style>
    <%@ include file="all_component/allcss.jsp"%>
</head>
<body>
    <%@ include file="all_component/navbar.jsp"%>
    
    <c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

    <div class="container">
        <h2>Track My Orders</h2>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User Name</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Payment Type</th>
                </tr>
            </thead>
            <tbody>
            
            <%
            // Retrieving the user object from the session
            User u = (User) session.getAttribute("userobj");
            
            // Check if the user object is not null
            if (u != null) {
                ProductOrderImpl dao = new ProductOrderImpl(DBConnect.getConn());
                List<Product_Order> blist = dao.getProduct(u.getEmail());
                
                // Check if the order list is not empty
                if (blist != null && !blist.isEmpty()) {
                    for (Product_Order b : blist) {
            %>
                        <tr>
                            <td class="order-id"><%= b.getOrderId() %></td>
                            <td><%= b.getUserName() %></td>
                            <td><%= b.getProductName() %></td>
                            <td><%= b.getPrice() %></td>
                            <td><%= b.getPaymentType() %></td>
                            
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5">No orders found.</td>
                    </tr>
            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="5">User not logged in.</td>
                </tr>
            <%
            }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>
