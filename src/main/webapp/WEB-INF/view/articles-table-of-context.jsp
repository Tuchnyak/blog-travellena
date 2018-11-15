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

<meta name="description" content="Содержание блога о самостоятельных путешествиях по юго-восточной Азии и дауншифтинге.">

<meta property="og:title" content="Travellena" />
<meta property="og:type" content="blog" />
<meta property="og:image" content="http://176.57.215.249/resources/img/header-img.jpeg" />
<meta property="vk:image" content="http://176.57.215.249/resources/img/header-img.jpeg" />

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />

<title>Travellena - Содержание</title>

<script src="https://yastatic.net/share2/share.js" async="async"></script>

</head>

<t:page-template>

	<jsp:body>
	
		<div class="container-fluid">
			
			<div class="row no-gutters">
				<div class="col text-center">
					<h1 class="display-4 my-2">Содержание:</h1>				
					<span class="text-muted font-italic">всего статей: ${amountOfArticles}</span>
					<hr class="my-3">
				</div>
			</div>
			
			<!-- Set variable to count article rows -->
			<c:set var="rowCount" value="${0}" />
			
			<c:forEach var="tempArticle" items="${articles}">
			
				<div class="row justify-content-center no-gutters my-2">
				
					<!-- rowCount++ -->
					<c:set var="rowCount" value="${rowCount + 1}" />
					
					<div class="col px-1 text-center">
					
						<!-- create link variable to open Article -->
						<c:url var="openArticle" value="/article/showArticle">
							<c:param name="articleId" value="${tempArticle.id}"></c:param>
						</c:url>
						
						<h3>
							<a class="text-dark" href="${openArticle}">${rowCount}. ${tempArticle.title}</a>
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
							
							<a class="btn btn-sm btn-outline-info" href="${updateLink}">UPDATE</a> 
							<a class="btn btn-sm btn-outline-danger" href="${deleteLink}"
								onclick="if (!(confirm('Вы точно хотите удалить данную статью? \nЕё нельзя будет восстановить!'))) return false">
								DELETE
							</a>
							
						</security:authorize>
						
						<span class="text-muted font-italic">опубликовано: <t:time timeTag="${tempArticle.publishDate}" /></span>
						<br>
						<a class="badge badge-pill badge-success text-uppercase" style="font-size: small" href="${openArticle}">читать полностью</a>
					
					</div>
				
				</div>
				<hr>
			
			</c:forEach>
			
			<div class="text-center my-3">
				<script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
				<script src="//yastatic.net/share2/share.js"></script>
				Поделиться ссылкой на блог:
				<div class="ya-share2" data-services="vkontakte,facebook,telegram,collections,whatsapp,pinterest"
				 data-image="http://176.57.215.249/resources/img/header-img.jpeg" data-description="Блог о самостоятельных путешествияхх по Азии"></div>
			</div>
		
		</div>
	
	</jsp:body>

</t:page-template>

</html>