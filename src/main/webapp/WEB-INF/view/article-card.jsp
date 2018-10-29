<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<title>Travellena - ${article.title}</title>

<style type="text/css">
.logo-header {
	background-image: url('${article.coverLink}');
	height: 700px;
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
							<h1 class="display-3">${article.title}</h1>
							
							<!--  Security content -->
							<security:authorize access="hasRole('ADMIN')">
							
								<!-- create update link variable -->
								<c:url var="updateLink" value="/article/showFormForUpdate">
									<c:param name="articleId" value="${article.id}" />
								</c:url>
						
								<!-- create delete link variable -->
								<c:url var="deleteLink" value="/article/delete">
									<c:param name="articleId" value="${article.id}" />
								</c:url>
								
								<a class="btn btn-sm btn-outline-info" href="${updateLink}">[Update]</a>
								<a class="btn btn-sm btn-outline-danger" href="${deleteLink}"
									onclick="if (!(confirm('Are you sure you want to delete this article?'))) return false">[Delete]</a>
							</security:authorize>
							
							<span class="text-muted font-italic">опубликовано: <t:time timeTag="${article.publishDate}" /></span>														
						</div>						
						
						<p class="text-justify img-fluid my-4">${article.body}</p>
					
					</article>									
				
				</div>
			
			</div>
		
		</div>	
			
	</jsp:body>
</t:page-template>

</html>