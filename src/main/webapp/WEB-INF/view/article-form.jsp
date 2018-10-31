<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Tabs template connection -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

<script type="text/javascript" src='${pageContext.request.contextPath}/resources/editor/tinymce/js/tinymce/tinymce.min.js'></script>
<script type="text/javascript">
	tinymce
			.init({
				// General options
				selector : '#TextEditor',
				branding : false,
				theme : "modern",
				language : "ru",
				browser_spellcheck : true,
				gecko_spellcheck : false,

				plugins : [ 'wordcount visualchars visualblocks textpattern searchreplace preview nonbreaking insertdatetime hr help code image imagetools advlist lists media link autolink textcolor colorpicker table paste autoresize charmap codesample fullscreen' ],
				toolbar : [ 'fullscreen preview help | undo redo cut copy searchreplace code | styleselect bold italic visualblocks visualchars forecolor backcolor alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | image media link table insertdatetime | nonbreaking charmap codesample hr' ],
				menubar : "edit view format",
				
				image_caption : false,
				image_dimensions : false,
				image_class_list : [ {
					title : 'fluid',
					value : 'img-fluid rounded'
				} ],
				
				default_link_target: "_blank",
				link_context_toolbar: true,
				
				table_class_list: [
				    {title: 'white', value: 'table'},
				    {title: 'dark', value: 'table table-dark'},
				    {title: 'white striped', value: 'table table-striped'},
				    {title: 'dark striped', value: 'table table-striped table-dark'},
				    {title: 'white hover rows', value: 'table table-hover'},
				    {title: 'dark hover rows', value: 'table table-hover table-dark'},
				    {title: 'white small', value: 'table table-sm'},
				    {title: 'dark small', value: 'table table-sm table-dark'},
				    {title: 'white small striped', value: 'table table-sm table-striped'},
				    {title: 'dark small striped', value: 'table table-sm table-striped table-dark'},
				    {title: 'white small hover rows', value: 'table table-sm table-hover'},
				    {title: 'dark small hover rows', value: 'table table-sm table-hover table-dark'}
				  ],
			  table_cell_class_list: [
				    {title: 'primary', value: 'bg-primary text-white'},
				    {title: 'secondary', value: 'bg-secondary text-white'},
				    {title: 'success', value: 'bg-success text-white'},
				    {title: 'danger', value: 'bg-danger text-white'},
				    {title: 'warning', value: 'bg-warning text-dark'},
				    {title: 'info', value: 'bg-info text-white'},
				    {title: 'light', value: 'bg-light text-dark'},
				    {title: 'dark', value: 'bg-dark text-white'},
				    {title: 'white', value: 'bg-white text-dark'},
				    {title: 'transparent', value: 'bg-transparent text-dark'}
				  ],
			  table_row_class_list: [
				  	{title: 'primary', value: 'bg-primary text-white'},
				    {title: 'secondary', value: 'bg-secondary text-white'},
				    {title: 'success', value: 'bg-success text-white'},
				    {title: 'danger', value: 'bg-danger text-white'},
				    {title: 'warning', value: 'bg-warning text-dark'},
				    {title: 'info', value: 'bg-info text-white'},
				    {title: 'light', value: 'bg-light text-dark'},
				    {title: 'dark', value: 'bg-dark text-white'},
				    {title: 'white', value: 'bg-white text-dark'},
				    {title: 'transparent', value: 'bg-transparent text-dark'}
				  ],
				  
				  autoresize_max_height: 700,
				  autoresize_min_height: 400,
				  
			  textpattern_patterns: [
				     {start: '*', end: '*', format: 'italic'},
				     {start: '**', end: '**', format: 'bold'},
				     {start: '#', format: 'h1'},
				     {start: '##', format: 'h2'},
				     {start: '###', format: 'h3'},
				     {start: '####', format: 'h4'},
				     {start: '#####', format: 'h5'},
				     {start: '######', format: 'h6'},
				     {start: '1. ', cmd: 'InsertOrderedList'},
				     {start: '* ', cmd: 'InsertUnorderedList'},
				     {start: '- ', cmd: 'InsertUnorderedList'}
				  ],

				skin : "lightgray",
				height : 700,
				max_height : 700
			});
</script>

<title>Travellena - Article Form</title>

<style type="text/css">
.fixed-top{
	position: static;
	top: 0;
  	right: 0;
  	left: 0;
  	z-index: 1030;
}
</style>

</head>

<body>

	<header>
		<t:menu />
	</header>

	<div class=container-fluid>

		<div class="form-row justify-content-center my-4">

			<div class="col col-md-10 col-lg-10">

				<h1 class="display-4 text-center my-3">Article Form</h1>

				<form:form action="saveArticle" modelAttribute="article" method="POST">

					<form:hidden path="id" />
					<form:hidden path="publishDate" />
					<input type="hidden" name="fromPage" value='${fromPage}' />

					<form:input class="form-control form-control-lg" placeholder="Article title" path="title" />
					<small><form:errors path="title" cssClass="error" /></small>
					<br>
					<br>

					<form:input class="form-control" placeholder="Link to a cover image" path="coverLink" />
					<small><form:errors path="coverLink" cssClass="error" /></small>
					<br>

					<p class="h3 my-3">
						Article content: <small><form:errors path="body" cssClass="error" /></small>
					</p>
					<form:textarea path="body" id="TextEditor" />
					<br>
			
					<div class="form-check my-1">
						<form:checkbox class="form-check-input" path="readyToPublish" />
						<label class="form-check-label">
							Ready to be published?
						</label>
					</div>
					
					<div class="form-check my-1">
						<form:checkbox class="form-check-input" path="info" />
						<label class="form-check-label">
							"About" article
						</label>
					</div>					

					<input class="btn btn-lg btn-outline-success btn-block my-3" type="submit" value="Save Article">

				</form:form>

				<br> <input type="button" class="btn btn-lg btn-outline-secondary btn-block" value="<<--- Go Back" onclick="history.go(-1)" />

			</div>

		</div>

	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

</html>