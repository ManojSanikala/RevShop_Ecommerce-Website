<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- Combined Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <div class="container-fluid p-3">
        <!-- Left side with "Revshop" text -->
        <a class="navbar-brand" href="#"><h3>RevShop</h3></a>
        
        <!-- Centered search form -->
        <c:if test="${not empty userobj}">
            <form class="form-inline my-2 my-lg-0 d-flex justify-content-center" action="search.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" name="ch" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </c:if>

        <!-- Right-side login/register/logout buttons -->
        <div class="d-flex justify-content-end">
            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn btn-success ml-2">Login</a>
                <a href="register.jsp" class="btn btn-primary ml-2">Register</a>
            </c:if>
            <c:if test="${not empty userobj}">
                <a href="cart.jsp" class="btn ml-2" style="font-size: 1rem; color: black; text-decoration: none;">
                    <i class="fas fa-cart-shopping"></i>
                </a>
                <a href="profile.jsp" class="btn btn-success ml-2">${userobj.name}</a>
                <a href="logout" class="btn btn-success ml-2" onclick="confirmLogout()">Logout</a>
            </c:if>
        </div>
    </div>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false"> Products </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="all_electronicproduct.jsp">Electronics</a>
                   
                    <a class="dropdown-item" href="all_fashion.jsp">Fashion</a>
                    
                  
                    <a class="dropdown-item" href="all_home.jsp">Home</a>
         
                    
                    <a class="dropdown-item" href="all_others.jsp">Others</a>
                </div>
            </li>
        </ul>
        
    </div>
</nav>

<script>
    function confirmLogout() {
        if (confirm("Are you sure you want to log out?")) {
            window.location.href = 'logout'; // Change this to your logout URL if needed
        }
    }
</script>
