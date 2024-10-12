<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Dairy Products</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!-- Center the search form -->
        <form class="form-inline mx-auto">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
        </form>

        <!-- Right-side user options -->
        <ul class="navbar-nav ml-auto">
            <c:if test="${not empty userobj}">
                <li class="nav-item">
                    <a class="nav-link btn btn-success mx-1" href="#">${userobj.name}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-success mx-1" href="#" onclick="return confirmLogout();">Logout</a>
                    <form id="logoutForm" action="../logout" method="post" style="display:none;">
                        <input type="hidden" name="logout" value="true">
                    </form>
                </li>
            </c:if>
            <c:if test="${empty userobj}">
                <li class="nav-item">
                    <a class="nav-link btn btn-success mx-1" href="../login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary mx-1" href="../register.jsp">Register</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="adminHome.jsp">Home 
                <span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>

<script>
    function confirmLogout() {
        if (confirm("Are you sure you want to log out?")) {
            document.getElementById("logoutForm").submit();
        }
        return false;
    }
</script>
