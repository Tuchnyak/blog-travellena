<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Tabs template connection -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<title>Travellena - Login</title>

<style type="text/css">
.fixed-top{
	position: static;
	top: 0;
  	right: 0;
  	left: 0;
  	z-index: 1030;
}
</style>

</head>

<body>

	<header>
		<t:menu />
	</header>

	<div align="center">
	
		<h2 class="my-4">Logint to Travallena blog</h2>

		<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">

			<c:if test="${param.error != null}">
				<b><i>*** Sorry! You entered invalid username/password ***</i></b>
			</c:if>

			<c:if test="${param.logout != null}">
				<b><i>*** You have been logged out ***</i></b>
			</c:if>

			<p>
				User name: <input type="text" name="username">
			</p>
			<p>
				Password: <input type="password" name="password">
			</p>
			<p>
				<input type="submit" value="Login">
			</p>

		</form:form>
	</div>
	
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>