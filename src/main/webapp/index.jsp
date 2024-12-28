<%@page import="com.Database.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background : url("Images/enote-home.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="UTF-8">
<title>E-Notes</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	
	<div class="container-fluid back-img text-center">
	<h1 class="text-dark fw-bold shadow">Save, Organize, and Access Your Notes Anytime</h1>
	</div>
	
	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>