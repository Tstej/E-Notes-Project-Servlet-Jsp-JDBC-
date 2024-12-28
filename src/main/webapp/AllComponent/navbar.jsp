<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom bg-custom">
	<div class="container-fluid m-2">
		<a class="navbar-brand" href="#"><i class="fa fa-book p-2"
			aria-hidden="true"></i>E-Notes</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="home.jsp"><i class="fa fa-home p-2" aria-hidden="true"></i>Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="addNotes.jsp"><i
						class="fa fa-plus p-2" aria-hidden="true"></i>Add Notes</a></li>
				<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
						class="fa fa-eye p-2" aria-hidden="true"></i>Show Notes</a></li>
			</ul>
			<form class="d-flex ">
				<%
				UserDetails user = (UserDetails) session.getAttribute("userD");
				if (user != null) {
				%>
				<a href="" class="btn btn-light m-2" data-toggle="modal"
					data-target="#exampleModa" type="submit"><i
					class="fa fa-user-circle  p-2" aria-hidden="true"></i><%=user.getName()%></a>
				<a href="LogoutServlet" class="btn btn-light m-2" type="submit"><i
					class="fa fa-user-plus  p-2" aria-hidden="true"></i>Logout</a>

				<%
				} else {
				%>
				<a href="login.jsp" class="btn btn-light m-2" type="submit"><i
					class="fa fa-user-circle  p-2" aria-hidden="true"></i>Login</a> <a
					href="register.jsp" class="btn btn-light m-2" type="submit"><i
					class="fa fa-user-plus  p-2" aria-hidden="true"></i>Register</a>

				<%
				}
				%>
			</form>
		</div>

	</div>
</nav>