<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- First Navbar -->
<div class="container-fluid p-3">
	<div class="row">
		<!-- Left side with "Dairy" text -->
		<div class="col-md-3">
			<h3>Dairy</h3>
		</div>

		<!-- Centered search form -->
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0 d-flex justify-content-center"
				action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>




		<!-- Right-side login/register/logout buttons -->
		<div class="col-md-3 d-flex justify-content-end">
			<c:if test="${empty userobj}">
				<a href="login.jsp" class="btn btn-success ml-2">Login</a>
				<a href="register.jsp" class="btn btn-primary ml-2">Register</a>
			</c:if>
			<c:if test="${not empty userobj}">
				<a href="checkout.jsp" class="btn ml-2"
					style="font-size: 1rem; color: black; text-decoration: none;">
					<i class="fas fa-cart-shopping"></i>
				</a>
				<a href="wishlist.jsp" class="btn ml-2"
					style="font-size: 1rem; color: red; text-decoration: none;"> <i
					class="fas fa-heart"></i>
				</a>
				<a href="login.jsp" class="btn btn-success ml-2">${userobj.name}</a>
				<a href="logout" class="btn btn-success ml-2">Logout</a>
			</c:if>
		</div>
	</div>
</div>

<!-- Second Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-toggle="dropdown" aria-expanded="false"> Products </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="all_milkproduct.jsp">Milk</a> <a
						class="dropdown-item" href="all_paneer.jsp">Paneer</a> <a
						class="dropdown-item" href="all_ghee.jsp">Ghee</a> <a
						class="dropdown-item" href="all_curd.jsp">Curd</a> <a
						class="dropdown-item" href="all_icecream.jsp">Ice Cream</a> <a
						class="dropdown-item" href="all_milkshakes.jsp">Milk Shake</a> <a
						class="dropdown-item" href="all_lassi.jsp">Lassi</a> <a
						class="dropdown-item" href="all_icebars.jsp">Ice Bars</a> <a
						class="dropdown-item" href="all_cheese.jsp">Cheese</a> <a
						class="dropdown-item" href="all_others.jsp">Others</a>
				</div></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="settings.jsp" class="btn btn-light my-2 my-sm-0" type="submit">Setting</a>
			<a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit">Contact
				Us</a>
		</form>
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
