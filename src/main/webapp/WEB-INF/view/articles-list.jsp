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

<meta name="description" content="Все статьи блога о самостоятельных путешествиях по юго-восточной Азии и дауншифтинге.">

<meta property="og:title" content="Travellena" />
<meta property="og:type" content="blog" />
<meta property="og:image" content="http://176.57.215.249/resources/img/header-img.jpeg" />
<meta property="vk:image" content="http://176.57.215.249/resources/img/header-img.jpeg" />

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />

<title>Travellena - Все статьи</title>

<script src="https://yastatic.net/share2/share.js"></script>
<script type="text/javascript" src="https://vk.com/js/api/openapi.js?159"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<style>
.cat {
	display: none;
}
</style>

<script type="text/javascript">
	var $jqPageLocal = jQuery.noConflict();

	$jqPageLocal(function() {
		$jqPageLocal(".cat").slice(0, 5).show();
		$jqPageLocal("#loadMore").on('click', function(e) {
			e.preventDefault();
			$jqPageLocal(".cat:hidden").slice(0, 10).slideDown();
		});
	});
</script>

</head>

<t:page-template>

	<jsp:body>
	
		<div class="container-fluid">
			
			<div class="row no-gutters">
				<div class="col">
					<h1 class="display-4 my-2">Все статьи:</h1>
					<span class="text-muted font-italic">всего статей: ${amountOfArticles}</span>
					<hr class="my-3">
				</div>
			</div>
			
			<!-- Set variable to count article rows -->
			<c:set var="rowCount" value="${0}" />
			
			<c:forEach var="tempArticle" items="${articles}">
			
				<div class="cat">
					<div class="row justify-content-center no-gutters my-2">
					
						<!-- rowCount++ -->
						<c:set var="rowCount" value="${rowCount + 1}" />
					
						<!-- create link variable to open Article -->
						<c:url var="openArticle" value="/article/showArticle">
							<c:param name="articleId" value="${tempArticle.id}"></c:param>
						</c:url>
					
						<div class="col-12 col-sm-12 col-md-5 col-lg-4 px-1">
						
							<a href="${openArticle}">
								<img class="img-fluid rounded" alt="${tempArticle.title}: article image" src="${tempArticle.coverLink}">
							</a>
							
						</div>
						
						<div class="col-12 col-sm-12 col-md-7 col-lg-8 px-1">
						
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
							
							<div class="trim my-2">
								${tempArticle.body}
							</div>
							
							<a class="badge badge-pill badge-success text-uppercase" style="font-size: small" href="${openArticle}">читать полностью</a>
						
						</div>
					
					</div>
					<hr>
				</div>
			
			</c:forEach>
			
			
			<div class="cat row my-2">
				
				<div class="col text-center h4">
					
					Скоро будет ещё больше статей! Чтобы ничего не пропустить подписывайтесь на нас ВКонтакте! 
					
					<!-- VK Widget -->
					<div class="row justify-content-center my-4">
																
						<div class="col offset-sm offset-md-2 offset-lg-3 offset-xl-4">
							<div id="vk_subscribe"> </div>
							<script type="text/javascript">
								VK.Widgets.Subscribe("vk_subscribe", {}, -96126446);
							</script>
						</div>
						
					</div>
					
				</div>
				
			</div>
			
			<a href="#" id="loadMore" class="btn btn-outline-info btn-lg btn-block text-uppercase">показать больше...</a>
			
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