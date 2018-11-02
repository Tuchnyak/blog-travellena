<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="Блог о самостоятельных путешествиях по юго-восточной Азии и дауншифтинге.">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

<title>ERROR</title>

</head>

<body>

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col col-md-8">

				<h1 class="display-1">Ошибка!</h1>

				<div class="my-3">
					<h2>Запрашиваемый ресурс:</h2>
					<h2 class="font-weight-bold">${url}</h2>
					<h2>не найден!</h2>
				</div>

				<p>
					<span class="font-weight-bold">ошибка:</span> ${exception}
				</p>
				<p>
					<span class="font-weight-bold">текст ошибки:</span> ${exception.message}
				</p>


				<a class="btn btn-warning text-uppercase my-4 font-weight-bold" href="${pageContext.request.contextPath}/">На главную страницу</a>

			</div>
		</div>
	</div>

</body>

</html>