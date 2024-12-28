<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
				<div class="card mt-4 ">
					<div class="card-header text-center">
						<i class="fa fa-user-circle p-2 fs-2" aria-hidden="true"></i>
						<h2>Login</h2>
					</div>
					<%
					 String invalidMsg = (String)session.getAttribute("login-failed");
						if(invalidMsg != null){%>
						
							<div class="alert alert-danger" role="alert"><%=invalidMsg %></div>
						<%
							session.removeAttribute("login-failed");
						}
					%>
					<%
					 String withoutLogin = (String)session.getAttribute("login-error");
						if(withoutLogin != null){%>
						
							<div class="alert alert-danger" role="alert"><%=withoutLogin %></div>
						<%
							session.removeAttribute("login-error");
						}
					%>
					<%
					 String logoutmsg = (String)session.getAttribute("logoutMsg");
						if(logoutmsg != null){%>
						
							<div class="alert alert-success" role="alert"><%=logoutmsg %></div>
						<%
							session.removeAttribute("logoutMsg");
						}
					%>
					<div class="card-body">
						<form action="loginServlet" method="post">
							<div class="form-group py-3">
								<input type="email" class="form-control" id="inputEmail3"
									placeholder="Email" name="email">
							</div>
							<div class="form-group py-3">
								<input type="password" class="form-control" id="inputPassword3"
									placeholder="Password" name="password">
							</div>

							<div class="d-flex justify-content-center">
								<button type="submit"
									class="btn btn-warning px-5">Login</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>