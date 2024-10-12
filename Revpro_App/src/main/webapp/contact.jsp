<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Dairy Products</title>
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
        <p><strong>Address:</strong> 123 Dairy Lane, Milk City, CA 90210</p>
        <p><strong>Phone:</strong> +1 (555) 123-4567</p>
        <p><strong>Email:</strong> <a href="mailto:info@dairyproducts.com">info@dairyproducts.com</a></p>
    </div>

    <div class="social-media">
        <p>Follow us on social media:</p>
        <a href="https://www.facebook.com/dairyproducts" target="_blank"><img src="images/facebook-icon.png" alt="Facebook"></a>
        <a href="https://www.twitter.com/dairyproducts" target="_blank"><img src="images/twitter-icon.png" alt="Twitter"></a>
        <a href="https://www.instagram.com/dairyproducts" target="_blank"><img src="images/instagram-icon.png" alt="Instagram"></a>
    </div>
</div>

</body>
</html>
