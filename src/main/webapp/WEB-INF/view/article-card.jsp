<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travellena - ${article.id}</title>
</head>
<body>

	<h2>${article.title}</h2>
	<hr>
	<p>
		${article.body}
	</p>

</body>
</html>