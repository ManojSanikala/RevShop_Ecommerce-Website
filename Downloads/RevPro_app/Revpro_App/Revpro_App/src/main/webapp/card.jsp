<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Card Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .payment-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px 0px #000;
            border-radius: 10px;
        }
        h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <h2>Card Payment</h2>
        <form action="processPayment.jsp" method="POST">
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" maxlength="16" required>
            </div>
            <div class="form-group">
                <label for="cardHolder">Card Holder Name:</label>
                <input type="text" id="cardHolder" name="cardHolder" required>
            </div>
            <div class="form-group">
                <label for="expiryDate">Expiry Date (MM/YY):</label>
                <input type="text" id="expiryDate" name="expiryDate" maxlength="5" placeholder="MM/YY" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV:</label>
                <input type="password" id="cvv" name="cvv" maxlength="3" required>
            </div>
            <button type="submit">Pay Now</button>
        </form>
    </div>
</body>
</html>
