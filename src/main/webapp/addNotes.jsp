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
<title>Add Notes Page</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid">
		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group mt-3">
						
							<%
							UserDetails details = (UserDetails) session.getAttribute("userD");
							if (details != null) {
							%>
							<input type="hidden" value="<%=details.getId()%>" name="uid">
							<%
							}
							%>


							<label>Enter Title</label> <input type="text"
								class="form-control" name="title" required="required">
						</div>
						<div class="form-group mt-3">
							<label>Enter Content</label>
							<textarea rows="10" cols="" class="form-control" name="content"
								required="required"></textarea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary m-3">Add
								Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="AllComponent/footer.jsp"%>
</html>