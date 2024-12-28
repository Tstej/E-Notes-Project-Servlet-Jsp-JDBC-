<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.Database.DBConnect"%>
<%@page import="com.DAO.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- If User tries to see notes without login then it will redirect to Login page -->
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
<title>Show Notes Page</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	<div class="container">
		<h2 class="text-center">All Notes</h2>

		<div class="row">
			<div class="col-md-12">
				<%
				if (userLogin != null) {
					PostDao postDao = new PostDao(DBConnect.getConnection());
					List<Post> post = postDao.getData(userLogin.getId());
					for (Post list : post) {
				%>
				<div class="card m-3">
					<img alt="" src="Images/pen.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 50px;">

					<div class="card-body p-4">

						<h5 class="card-title"><%=list.getTitle()%></h5>
						<p><%=list.getContent()%></p>

						<p>
							<b class="text-success">Published By: <%=userLogin.getName()%></b>
							<br> <b class="text-primary"></b>
						</p>
						<p>
							<b class="text-success">Date: <%=list.getPdate()%></b> <br>
							<b class="text-primary"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="editNote.jsp?note_id=<%=list.getId()%>"
								class="btn btn-warning">Edit</a> <a
								href="DeleteServlet?note_id=<%=list.getId()%>" class="btn btn-danger">Delete</a>
						</div>

					</div>
				</div>
				<%
				}

				}
				%>


			</div>
		</div>
	</div>

	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>