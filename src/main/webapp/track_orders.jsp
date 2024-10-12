<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <c:choose>
                    <c:when test="${empty orderList}">
                        <tr>
                            <td colspan="5">No orders found.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="order" items="${orderList}">
                            <tr>
                                <td class="order-id">${order.orderId}</td>
                                <td>${order.userName}</td>
                                <td>${order.productName}</td>
                                <td>${order.price}</td>
                                <td>${order.paymentType}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</body>
</html>
