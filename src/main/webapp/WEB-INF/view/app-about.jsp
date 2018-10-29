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

<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
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
		
		<div class="container-fluid">
		
			<div class="row justify-content-center no-gutters my-2">
			
				<div class="col">
				
					<article>
					
						<div class="text-center my-2">
							<h1 class="display-3 word-break">${infoArticle.title}</h1>
							
							<!--  Security content -->
							<security:authorize access="hasRole('ADMIN')">
							
								<!-- create update link variable -->
								<c:url var="updateLink" value="/article/showFormForUpdate">
									<c:param name="articleId" value="${infoArticle.id}" />
								</c:url>
								
								<a class="btn btn-sm btn-outline-info" href="${updateLink}">UPDATE</a>
								
							</security:authorize>													
						</div>						
						
						<p class="text-justify my-4">${infoArticle.body}</p>
					
					</article>									
				
				</div>
			
			</div>
		
		</div>
	
	</jsp:body>

</t:page-template>

</html>