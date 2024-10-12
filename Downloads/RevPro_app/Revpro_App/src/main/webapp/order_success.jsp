<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .success-container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .success-container h1 {
            color: #28a745;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .success-container p {
            font-size: 1.2em;
            color: #6c757d;
            margin-bottom: 30px;
        }
        .success-container .btn {
            text-decoration: none;
            padding: 12px 30px;
            background-color: #28a745;
            color: #ffffff;
            border-radius: 5px;
            font-size: 1em;
            transition: background-color 0.3s;
        }
        .success-container .btn:hover {
            background-color: #218838;
        }
        .checkmark {
            font-size: 4em;
            color: #28a745;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="checkmark">&#10004;</div> <!-- Simple tick mark -->
        <h1>Order Successful!</h1>
        <p>Thank you for your purchase. Your order has been placed successfully and is being processed.</p>
        <a href="index.jsp" class="btn btn-primary mt-3">Return to Home</a>
        <a href="order.jsp" class="btn btn-danger mt-3">See orders</a>
    </div>
</body>
</html>
