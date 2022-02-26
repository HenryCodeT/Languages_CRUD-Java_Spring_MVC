<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title> Languages </title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
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
	<!-- //// MAIN AREA /////////////////////////////////////////////// -->
	<main role="main">
		<div class="container mt-4">
			<h1>Languages</h1>
			<br>
			<!-- //// ALL EXPENSES TABLE ////////////////////////////// -->
			<div class="row card bg-dark">
				<div class="col">
					<table class="table table-dark">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Creator</th>
								<th scope="col">Version</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="language" items="${ languages }">
								<tr>
									<td><c:out value="${ language.getId() }"></c:out></td>
									<td><a href="/languages/${ language.getId() }"><c:out value="${ language.getName() }"></c:out></a></td>
									<td><c:out value="${ language.getCreator() }"></c:out></td>
									<td><c:out value="${ language.getVersion() }"></c:out></td>
									<td class="row align-items-center">
										<a class = "btn btn-warning col m-2"href="/languages/${ language.getId() }/edit">Edit</a>
										<form class="col m-2" action="/languages/${ language.getId() }" method="post">
											<!-- ### Converts method of form to DELETE ### -->
											<input type="hidden" name="_method" value="delete">
											<button class="btn btn-danger">Delete</button>
										</form>
									</td>
								</tr>							
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<div class="col bg-info p-3">
				<h1>Add an Expense:</h1>
				<!-- //// CREATE FORM ////////////////////////////////// -->
				<form:form action="/languages" method="post" modelAttribute="language">
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
		</div>
	</main>
	



	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>