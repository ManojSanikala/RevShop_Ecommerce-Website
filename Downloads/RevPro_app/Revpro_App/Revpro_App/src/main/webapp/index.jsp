<%@ page import="java.util.List"%>
<%@ page import="com.entity.Products"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Revshop Products</title>
<%@ include file="all_component/allcss.jsp"%>
<style>
    /* Add your styles here */
</style>
</head>
<body>

    <%
    User u = (User) session.getAttribute("userobj");
    %>

    <%@ include file="all_component/navbar.jsp"%>

    <div class="container">
        <h2 class="text-center">Welcome To Our Revshop Products</h2>
        <h3 class="text-center">.....Eat Healthy Stay Healthy.....</h3>
        <br><br>

        <%-- Electronic Products Section --%>
        <section class="product-section">
            <h2 class="text-center">Electronic Products</h2>
            <div class="row">
                <%
                ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
                List<Products> electronicList = dao.getAllElectronicProduct();
                for (Products b : electronicList) {
                %>
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="products/<%=b.getPhoto()%>" alt="<%=b.getProductName()%>" style="width: 150px; height: 200px;">
                        <p><%=b.getProductName()%></p>
                        <p class="price">Rs.<%=b.getPrice()%>/-</p>
                        <a href="view_products.jsp?pid=<%=b.getProductId()%>" class="btn btn-primary btn-sm ml-2">Details</a>
                        <%
                        if (u == null) {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                        <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add to Wishlist</a>
                        <%
                        } else {
                        %>
                        <a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                        <a href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2">Add to Wishlist</a>
                        <%
                        }
                        %>
                    </div>
                </div>
                <%
                }
                %>
            </div>
            <div class="view-all-button">
                <a href="all_electronic.jsp">
                    <button>View All</button>
                </a>
            </div>
        </section>

        <%-- Home Products Section --%>
        <section class="product-section">
            <h2 class="text-center">Home Products</h2>
            <div class="row">
                <%
                List<Products> homeList = dao.getAllHomeProduct();
                for (Products b : homeList) {
                %>
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="products/<%=b.getPhoto()%>" alt="<%=b.getProductName()%>" style="width: 150px; height: 200px;">
                        <p><%=b.getProductName()%></p>
                        <p class="price">Rs.<%=b.getPrice()%>/-</p>
                        <a href="view_products.jsp?pid=<%=b.getProductId()%>" class="btn btn-primary btn-sm ml-2">Details</a>
                        <%
                        if (u == null) {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                        <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add to Wishlist</a>
                        <%
                        } else {
                        %>
                        <a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                        <a href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2">Add to Wishlist</a>
                        <%
                        }
                        %>
                    </div>
                </div>
                <%
                }
                %>
            </div>
            <div class="view-all-button">
                <a href="all_home.jsp">
                    <button>View All</button>
                </a>
            </div>
        </section>

        <%-- Fashion Products Section --%>
        <section class="product-section">
            <h2 class="text-center">Fashion Products</h2>
            <div class="row">
                <%
                List<Products> fashionList = dao.getAllFashionProduct();
                for (Products b : fashionList) {
                %>
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="products/<%=b.getPhoto()%>" alt="<%=b.getProductName()%>" style="width: 150px; height: 200px;">
                        <p><%=b.getProductName()%></p>
                        <p class="price">Rs.<%=b.getPrice()%>/-</p>
                        <a href="view_products.jsp?pid=<%=b.getProductId()%>" class="btn btn-primary btn-sm ml-2">Details</a>
                        <%
                        if (u == null) {
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                        <a href="login.jsp" class="btn btn-success btn-sm ml-2">Add to Wishlist</a>
                        <%
                        } else {
                        %>
                        <a href="cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add to Cart</a>
                        <a href="wishlist?pid=<%=b.getProductId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2">Add to Wishlist</a>
                        <%
                        }
                        %>
                    </div>
                </div>
                <%
                }
                %>
            </div>
            <div class="view-all-button">
                <a href="all_fashion.jsp">
                    <button>View All</button>
                </a>
            </div>
        </section>
    </div>
</body>
</html>
