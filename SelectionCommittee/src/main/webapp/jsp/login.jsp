<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<link rel="stylesheet" href="../css/login.css">

<title><spring:message code="login.title" /></title>


<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
		$(document).ready(function() {
			var selItem = localStorage.getItem("locales");
			$('#locales').val(selItem ? selItem : 'en');
			$("#locales").change(function() {
				var selectedOption = $('#locales').val();
				if (selectedOption) {
					window.location.replace('?lang=' + selectedOption);
					localStorage.setItem("locales", selectedOption);
				}
			});
		});
	</script>

</head>

<body>

	<div class="login-page">
		<div class="form">
			<form method="POST" action="${contextPath}/login" class="login-form">
				<h2 class="form-heading"><spring:message code="login.title1" /></h2>

				<div class="form-group ${error != null ? 'has-error' : ''}">
					<span>${message}</span> 
					<input name="email" type="text"
						class="email" placeholder="<spring:message code="login.email" />"
						autofocus="true" />
				   <input name="password" type="password"
						class="password"
						placeholder="<spring:message code="login.password" />" /> <span>${error}</span>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<button class="login" type="submit">
						<spring:message code="login.login" />
					</button>

					<div class="text-center p-t-12">
						<fieldset>
							<label><spring:message code="login.choose_language" /></label> <select
								class="text-center p-t-12" id="locales">
								<option value="en"><spring:message code='login.english' /></option>
								<option value="uk"><spring:message code='login.ukrainian' /></option>
							</select>
						</fieldset>
					</div>

					<p class="message">
						<a href="${contextPath}/registration"><spring:message
								code="login.create_account" /></a>
					</p>
				</div>

			</form>
		</div>
	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	
</body>
</html>
