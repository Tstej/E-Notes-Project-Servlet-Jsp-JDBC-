<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- If User tries to add notes without login then it will redirect to Login page -->
<%
UserDetails userLogin = (UserDetails) session.getAttribute("userD");
if (userLogin == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid p-4">
		
		<div class="card mt-2">

			<div class="card-body text-center">
				<img alt="" src="Images/pen.png" class="img-fluid mx-auto" style="max-width:300px; height: 50vh">
				<h2>START TAKING YOUR NOTES</h2>
				<a href="addNotes.jsp" class="btn btn-outline-primary mt-3 ">Start Here</a>
			</div>
		</div>

	</div>

	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>