<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class="container">


		<!-- Sidebar -->
		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
			<h3 class="w3-bar-item">Menu</h3>
			<a href="/home" class="w3-bar-item w3-button">Home</a>
			
			<security:authorize access="hasRole('ROLE_ADMIN')">
			 <a href="/create-entrant" class="w3-bar-item w3-button">Create entrant</a> 
			</security:authorize>
			 	
			 	<a href="/success-entrans" class="w3-bar-item w3-button">Rating</a>
		</div>


		<!-- Page Content -->
		<div style="margin-left: 10%">

			<div class="w3-container w3-teal">
				<h1>Success Entrants</h1>
			</div>

			
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<form id="logoutForm" method="POST" action="${contextPath}/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<h2>
						Welcome ${pageContext.request.userPrincipal.name} |
						<a onclick="document.forms['logoutForm'].submit()">Logout</a>
					</h2>
				</c:if>
				<div class="container">
					<div class="row">
				<c:if test="${not empty entrants}">
					<c:forEach items="${entrants}" var="currentEntrant">
						<c:if test="${currentEntrant.totalMark > 600}">
							<div class="col-sm-6 col-md-4 col-lg-3 mt-4" style="width: 20%; margin:2%; background: green" >
								<img src="data:image/jpg;base64, ${currentEntrant.encodedImage}" alt="Norway" style="width: 100%">
								<div class="w3-container w3-center">
									<h3>${currentEntrant.firstName}</h3>
									<h3>${currentEntrant.lastName}</h3>
									<p>${currentEntrant.faculty.getName()}</p>
								</div>
								<button class="w3-button w3-block w3-dark-grey">+ add to Faculty</button>
							</div>
						</c:if>
						
						<c:if test="${currentEntrant.totalMark < 600}">
							<div class="col-sm-6 col-md-4 col-lg-3 mt-4" style="width: 20%; margin:2%; background: red" >
								<img src="data:image/jpg;base64, ${currentEntrant.encodedImage}" alt="Norway" style="width: 100%">
								<div class="w3-container w3-center">
									<h3>${currentEntrant.firstName}</h3>
									<h3>${currentEntrant.lastName}</h3>
									<p>${currentEntrant.faculty.getName()}</p>
								</div>
								<button class="w3-button w3-block w3-dark-grey">+ add to Faculty</button>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
</div>
		</div>


	</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html> 