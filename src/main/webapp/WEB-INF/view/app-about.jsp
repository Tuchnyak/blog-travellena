<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- Tabs template connection -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<title>Travellena - Информация</title>

<style type="text/css">
.logo-header {
	background-image: url('${infoArticle.coverLink}');
	height: 530px;
	background-size: cover;
	background-attachment: scroll;
	position: relative;
	background-position: center center;
}

.hide-in-article {
	color: rgba(0, 0, 0, 0.0);
}

</style>

</head>

<t:page-template>

	<jsp:body>

		<h2>${infoArticle.title}</h2>
		
		<!--  Security content -->
		<security:authorize access="hasRole('ADMIN')">
			<!-- create update link variable -->
			<c:url var="updateLink" value="/article/showFormForUpdate">
				<c:param name="articleId" value="${infoArticle.id}" />
			</c:url>
				<a href="${updateLink}">[Update]</a>
			<br>
		</security:authorize>
		<img alt="${infoArticle.title} article image" src="${infoArticle.coverLink}" width=50% align="middle">
		<hr>
	
		${infoArticle.body}
	
	</jsp:body>

</t:page-template>

</html>