<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Titulo</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- Estilos Locales -->
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<!-- //// HEADER ///////////////////////////////////////////////// -->
	<header>
		<div class="navbar navbar-dark bg-dark box-shadow">
			<div class="container d-flex justify-content-between">
				<a href="/" class="navbar-brand d-flex align-items-center"> <strong
					class="text-warning">Languages</strong>
				</a> <a class="btn btn-secondary " href="/">HOME</a>
			</div>
		</div>
	</header>
	<div class="mx-auto col-5 bg-info p-3">
		<h1>EDIT A LANGUAGE:</h1>
		<!-- //// CREATE FORM ////////////////////////////////// -->
		<form:form action="/languages/${language.getId()}" method="post" modelAttribute="language">
			<input type="hidden" name="_method" value="put">
			<p class="form-group">
				<form:label path="name">Name:</form:label>
				<form:input path="name" class="form-control mb-3" />
				<form:errors path="name" class="alert alert-danger" />
			</p>
			<p class="form-group">
				<form:label path="creator">Creator:</form:label>
				<form:input path="creator" class="form-control mb-3" />
				<form:errors path="creator" class="alert alert-danger" />
			</p>
			<p class="form-group">
				<form:label path="version">Version</form:label>
				<form:input path="version" class="form-control mb-3" />
				<form:errors path="version" class="alert alert-danger" />
			</p>
			<input class="btn btn-success" type="submit" value="Submit" />
		</form:form>
	</div>
	<!-- jQuery (No necesario en Bootstrap 5) -->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/app.js"></script>
</body>
</html>