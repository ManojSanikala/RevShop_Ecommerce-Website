<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <%@ include file="all_component/allcss.jsp"%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .contact-info {
            margin: 20px 0;
        }
        .contact-info p {
            font-size: 18px;
            color: #555;
            margin: 10px 0;
        }
        .contact-info a {
            color: #4CAF50;
            text-decoration: none;
        }
        .contact-info a:hover {
            text-decoration: underline;
        }
        .social-media {
            margin-top: 20px;
        }
        .social-media a {
            margin: 0 10px;
            display: inline-block;
        }
        .social-media img {
            width: 40px;
            height: 40px;
        }
    </style>
</head>
<body>
<%@ include file="all_component/navbar.jsp"%>
<div class="container">
    <h1>Contact Us</h1>
    <p>We’d love to hear from you! Whether you have a question about our products, want to give feedback, or just want to say hello, you can reach us using the contact details below.</p>

    <div class="contact-info">
        <p><strong>Address:</strong> Nellore</p>
        <p><strong>Phone:</strong> +91-9347026095 </p>
        <p><strong>Email:</strong> <a href="mailto:revshop@rv.com">revshop.com</a></p>
    </div>

    
</div>

</body>
</html>
