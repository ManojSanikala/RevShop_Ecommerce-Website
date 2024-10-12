<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Products"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Electronic Products</title>
<%@ include file="all_component/allcss.jsp"%>

<style>
/* Your existing CSS styling */
</style>
</head>
<body>
    <!-- Debugging cart messages -->
    <c:if test="${not empty addCart}">
        <div id="toast">${addCart}</div>
        <script type="text/javascript">
            showToast();
            function showToast(content) {
                $('#toast').addClass("display");
                $('#toast').html(content);
                setTimeout(() => {
                    $("#toast").removeClass("display");
                }, 2000);
            }    
        </script>
        <c:remove var="addCart" scope="session" />
    </c:if>

    <!-- Debugging session user object -->
    <%
        User u = (User) session.getAttribute("userobj");
        if (u == null) {
            out.println("User not logged in");
        } else {
            out.println("User logged in: " + u.getId());
        }
    %>

    <%@ include file="all_component/navbar.jsp"%>

    <section class="product-section">
        <h2 class="text-center">All Electronic Products</h2>

        <!-- Debugging database retrieval -->
        <div class="row">
            <%
                ProductDAOImpl dao9 = new ProductDAOImpl(DBConnect.getConn());
                List<Products> electronicList = dao9.getAllElectronicProduct();
                out.println("Products size: " + electronicList.size()); // Check if products are fetched
                for (Products b : electronicList) {
                    out.println("Product Name: " + b.getProductName()); // Check if each product is being iterated
            %>
                <div class="col-md-3">
                    <div class="product-card">
                        <!-- Debugging image paths -->
                        <img src="products/<%=b.getPhoto()%>" alt="<%=b.getProductName()%>" onerror="this.src='default.jpg'">
                        <p class="product-name"><%=b.getProductName()%></p>
                        <p class="price">Rs.<%=b.getPrice()%>/-</p>
                        <div class="button-group">
                            <a href="view_products.jsp?pid=<%=b.getProductId()%>" class="btn-details">Details</a>
                            <%
                                if (u == null) {
                            %>
                                <a href="login.jsp" class="btn-cart">Add to Cart</a> 
                                <a href="login.jsp" class="btn-wishlist">Add to Wishlist</a>
                            <%
                                } else {
                            %>
                                <a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn-cart">Add to Cart</a> 
                                <a href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn-wishlist">Add to Wishlist</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </section>
</body>
</html>
