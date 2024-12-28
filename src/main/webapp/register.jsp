<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
.card-header {
	background-color: #2E4750;
	color: #F7F7F7;
}
</style>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card m-4">
					<div class="card-header text-center">
						<i class="fa fa-user-plus  p-2 fs-2" aria-hidden="true"></i>
						<h2>Registration</h2>
						
						 <!-- Success Alert-->
						<%
						String successMsg = (String) session.getAttribute("reg-success");
						if (successMsg != null) {
						%>
						<div class="alert alert-success" role="alert"><%= successMsg %></div>
						<%
						session.removeAttribute("reg-success");
						}
						%>
						<!-- Failed Alert-->
						<%
						String failedMsg = (String) session.getAttribute("reg-failed");
						if (failedMsg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%= failedMsg %></div>
						<%
						session.removeAttribute("reg-failed");
						}
						%>

					</div>
					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group py-3">
								<input type="text" class="form-control" id="inputEmail3"
									placeholder="Username" name="name">
							</div>
							<div class="form-group py-3">
								<input type="email" class="form-control" id="inputEmail3"
									placeholder="Email" name="email">
							</div>
							<div class="form-group py-3">
								<input type="password" class="form-control" id="inputPassword3"
									placeholder="Password" name="password">
							</div>

							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-warning px-5">Sign
									in</button>
							</div>

						</form>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>