<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- Tabs template connection -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />

<title>Travellena - Черновики</title>

</head>

<t:page-template>

	<jsp:body>
	
	<div class="container-fluid">
			
			<h1 class="display-4 my-3">Черновики:</h1>
			<hr class="my-4">
			
			<c:forEach var="tempDraft" items="${drafts}">
			
				<div class="row justify-content-center no-gutters my-2">
					
					<div class="col">
					
						<!-- create link variable to open Article -->
						<c:url var="openDraft" value="/article/showArticle">
							<c:param name="articleId" value="${tempDraft.id}"></c:param>
						</c:url>
						
						<h3>
							<a class="text-dark" href="${openDraft}">${tempDraft.title}</a>
						</h3>
						
						<!--  Security content -->
						<security:authorize access="hasRole('ADMIN')">
						
							<!-- create update link variable -->
							<c:url var="updateLink" value="/article/showFormForUpdate">
								<c:param name="articleId" value="${tempDraft.id}" />
							</c:url>
					
							<!-- create delete link variable -->
							<c:url var="deleteLink" value="/article/delete">
								<c:param name="articleId" value="${tempDraft.id}" />
							</c:url>
							
							<a class="btn btn-sm btn-outline-info" href="${updateLink}">UPDATE</a> 
							<a class="btn btn-sm btn-outline-danger" href="${deleteLink}"
								onclick="if (!(confirm('Вы точно хотите удалить данную статью? \nЕё нельзя будет восстановить!'))) return false">
								DELETE
							</a>
							
						</security:authorize>
						
						<span class="text-muted font-italic">опубликовано: <t:time timeTag="${tempDraft.publishDate}" /></span>
						
						<div class="trim my-2">
							${tempDraft.body}
						</div>
						
						<a class="badge badge-pill badge-success text-uppercase" style="font-size: small" href="${openDraft}">читать полностью</a>
					
					</div>
				
				</div>
				<hr>
			
			</c:forEach>
		
		</div>
	
	</jsp:body>

</t:page-template>

</html>