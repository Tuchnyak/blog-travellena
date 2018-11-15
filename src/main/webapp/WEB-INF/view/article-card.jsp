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

<meta name="title" content="${article.title}" />
<meta name="description" content="${article.title}. Статья о самостоятельных путешествиях по юго-восточной Азии и дауншифтинге.">
<link rel="image_src" href="${article.coverLink}" />

<meta property="og:title" content="${article.title}" />
<meta property="og:type" content="article" />
<meta property="og:image" content="${article.coverLink}" />
<meta property="vk:image" content="${article.coverLink}" />

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />

<title>Travellena - ${article.title}</title>

<style type="text/css">
.logo-header {
	background-image: url('${article.coverLink}');
	height: 750px;
	background-size: cover;
	background-attachment: scroll;
	position: relative;
	background-position: center center;
}

.hide-in-article {
	color: rgba(0, 0, 0, 0.0);
}
</style>

<script src="https://yastatic.net/share2/share.js" async="async"></script>

</head>

<t:page-template>
	<jsp:body>
	
		<div class="container-fluid">
		
			<div class="row justify-content-center no-gutters my-2">
			
				<div class="col">
				
					<article>
					
						<div class="text-center my-2">
							<h1 class="display-3 word-break">${article.title}</h1>
							
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
								
								<a class="btn btn-sm btn-outline-info" href="${updateLink}">UPDATE</a>
								<a class="btn btn-sm btn-outline-danger" href="${deleteLink}"
									onclick="if (!(confirm('Are you sure you want to delete this article?'))) return false">DELETE</a>
							</security:authorize>
							
							<span class="text-muted font-italic">опубликовано: <t:time timeTag="${article.publishDate}" /></span>														
						</div>
						
						<p class="text-justify my-4">${article.body}</p>
						
						<div class="text-center">
							<script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
							<script src="//yastatic.net/share2/share.js"></script>
							<div class="ya-share2" data-services="vkontakte,facebook,telegram,collections,whatsapp,pinterest"
							 data-image="${article.coverLink}" data-description="Блог о самостоятельных путешествияхх по Азии"></div>
						</div>
					
					</article>									
				
				</div>
			
			</div>
		
		</div>	
			
	</jsp:body>
</t:page-template>

</html>