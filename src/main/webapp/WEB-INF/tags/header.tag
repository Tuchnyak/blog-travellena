<%@tag description="Header page block with Add button and Search" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- Tabs template connection -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<header>

	<!-- Show menu block -->
	<t:menu />

	<!-- Main Logo with search -->
	<div class="container-fluid bg-dark text-center logo-header">
		<div class="row">
			<div class="card-img-overlay d-flex flex-column justify-content-center text-black-50">
				<h1 class="hide-in-article card-title display-2 beauty-title">Hello, Asia!</h1>
				<p class="hide-in-article card-text h4 beauty-title">downshifting</p>
			</div>
		</div>
		<div class="card-img-overlay h-80 d-flex flex-column justify-content-end">
			<!-- Add a search box -->
			<form:form action="searchArticle" method="GET">
				<input class="form-control-sm my-1" type="text" name="searchString" />
				<input class="btn btn-success btn-sm my-1" type="submit" value="Поиск по слову">
			</form:form>
		</div>
	</div>

</header>