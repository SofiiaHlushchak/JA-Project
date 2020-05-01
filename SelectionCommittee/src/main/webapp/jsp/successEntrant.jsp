<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<title>Welcome</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
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






		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			
		</c:if>

		<!-- Page -->
		<div>
			<div class="w3-container">
				<table class="table table-striped"
					style="margin-top: 2%; padding: 2%; width: 100%; height: 150px">
					<thead>
						<tr>
						    <th>Id</th>
							<th>Name</th>
							<th>Last name</th>
							<th>Faculty</th>
							<th>Image</th>
							
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty entrants}">
							<c:forEach items="${entrants}" var="currentEntrant">
								<c:if test="${currentEntrant.totalMark > 600}">
									<tr style = "background: green">
										<td>${currentEntrant.id}</td>
										<th><h3>${currentEntrant.firstName}</h3></th>
										<th><h3>${currentEntrant.lastName}</h3></th>
										<th><p>${currentEntrant.faculty.getName()}</p></th>
										<th><img
											src="data:image/jpg;base64, ${currentEntrant.encodedImage}"
											alt="Norway" style="width: 100%"></th>
									</tr>
								</c:if>


								<c:if test="${currentEntrant.totalMark < 600}">
									<tr style = "background: red">
										
										
											<th><h3>${currentEntrant.firstName}</h3></th>
											<th><h3>${currentEntrant.lastName}</h3></th>
											<th><p>${currentEntrant.faculty.getName()}</p></th>
											<th><img
											src="data:image/jpg;base64, ${currentEntrant.encodedImage}"
											alt="Norway" style="width: 100%"></th>
										
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
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
