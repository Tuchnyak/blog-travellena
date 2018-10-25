<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- Tabs template connection -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>

<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Travellena</title>

<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> --%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>

<t:page-template>

	<jsp:body>
	
		<h2>Новые статьи</h2>
		<hr>
		<hr>
	
	<table>
			<c:forEach var="tempArticle" items="${articles}">
				
				<tr>
					<td>
						<div align="center">
							<img alt="${tempArticle.title} article image" src="${tempArticle.coverLink}" width=95% align="middle">
						</div>
					</td>
					
					<td>
						<!-- create link variable to open Article -->
						<c:url var="openArticle" value="/article/showArticle">
							<c:param name="articleId" value="${tempArticle.id}"></c:param>
						</c:url>
			
						<h3>
							<a href="${openArticle}">${tempArticle.title}</a>
						</h3>
						
						<!--  Security content -->
						<security:authorize access="hasRole('ADMIN')">
						
							<!-- create update link variable -->
							<c:url var="updateLink" value="/article/showFormForUpdate">
								<c:param name="articleId" value="${tempArticle.id}" />
							</c:url>
					
							<!-- create delete link variable -->
							<c:url var="deleteLink" value="/article/delete">
								<c:param name="articleId" value="${tempArticle.id}" />
							</c:url>
							
							<a href="${updateLink}">[Update]</a> 
							<a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this article?'))) return false">
								[Delete]
							</a>
							
						</security:authorize>
										
						опубликовано: <t:time timeTag="${tempArticle.publishDate}" />
						<div class="trim">
							${tempArticle.body}
						</div>
						<a href="${openArticle}">[читать полностью]</a>
						<hr>
					</td>
				</tr>
		
			</c:forEach>
		</table>
	
	</jsp:body>

</t:page-template>


</html>