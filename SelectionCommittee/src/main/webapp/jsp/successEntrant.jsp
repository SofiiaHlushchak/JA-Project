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
    <!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/menu.css">
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="container">


		

			
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
<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="../js/menu.js"></script>
</body>
</html> 