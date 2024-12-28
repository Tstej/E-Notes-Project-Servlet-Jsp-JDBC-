<%@page import="com.User.Post"%>
<%@page import="com.Database.DBConnect"%>
<%@page import="com.DAO.PostDao"%>
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
<title>Edit Note Page</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<%
	Integer noteId = Integer.parseInt(request.getParameter("note_id"));

	PostDao postDao = new PostDao(DBConnect.getConnection());
	Post post = postDao.getDataById(noteId);
	%>

	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid">
		<h1 class="text-center">Edit Your Note</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="EditNoteServlet" method="post">
						<input type="hidden" value="<%=noteId%>" name="noteId">
						<div class="form-group mt-3">

							<label>Enter Title</label> <input type="text"
								class="form-control" name="title" required="required"
								value="<%=post.getTitle()%>">
						</div>
						<div class="form-group mt-3">
							<label>Enter Content</label>
							<textarea rows="10" cols="" class="form-control" name="content"
								required="required" ><%=post.getContent()%></textarea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary m-3 px-5">Edit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>