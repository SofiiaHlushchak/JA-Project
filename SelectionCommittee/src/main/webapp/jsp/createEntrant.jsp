<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Entrants</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>



	<div class="container">

		<!-- Sidebar -->
		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
			<h3 class="w3-bar-item">Menu</h3>
			<a href="/home" class="w3-bar-item w3-button">Home</a> 
			<a href="/create-entrant" class="w3-bar-item w3-button">Create entrant</a>
			<a href="/success-entrans" class="w3-bar-item w3-button">Rating</a>
		</div>


		<!-- Page Content -->
		<div style="margin-left: 10%">
			<div class="w3-container w3-teal">
				<h1>Create new Entrant</h1>
			</div>
			<div class="w3-container">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<form id="logoutForm" method="POST" action="${contextPath}/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<h2>
						Welcome ${pageContext.request.userPrincipal.name} | <a
							onclick="document.forms['logoutForm'].submit()">Logout</a>
					</h2>
				</c:if>




				<form:form method="POST" action="${contextPath}/addEntrant" enctype="multipart/form-data">
					<table>
						<tr>
							<td>FirstName</td>
							<td><input type="text" name="firstName" /></td>
						</tr>
						<tr>
							<td>LastName</td>
							<td><input type="text" name="lastName" /></td>
						</tr>
				
						<tr>
							<td>Faculty</td>
							<td>
								<%
								    try{
								//Class.forName("com.mysql.jdbc.Driver").newInstance();
								Connection connection = 
								         DriverManager.getConnection
								            ("jdbc:mysql://localhost/selection_committee?user=root&password=1234&serverTimezone=UTC");
								       Statement statement = connection.createStatement() ;
								       resultset = statement.executeQuery("select * from faculty") ;
								%>
								        <select name="faculty">
								        <%  while(resultset.next()){ %>
								            <option value = <%= resultset.getInt(1) %>><%= resultset.getString(2) %></option>
								        <% } %>
								        </select>	
								<%
								//**Should I input the codes here?**
								        }
								        catch(Exception e)
								        {
								             out.println("wrong entry"+e);
								        }
								%>							</td>
						</tr>
						<tr>
							<td>First Subject</td>
							<td><input type="text" name="firstSubject" /></td>
						</tr>
						<tr>
							<td>Second Subject</td>
							<td><input type="text" name="secondSubject" /></td>
						</tr>
						<tr>
							<td>Third Subject</td>
							<td><input type="text" name="thirdSubject" /></td>
						</tr>
						<tr>
							<td>Fourth Subject</td>
							<td><input type="text" name="fourthSubject" /></td>
						</tr>
						
						
						<tr>
							<td>Select an image to upload</td>
							<td><input type="file" name="image" /></td>
						</tr>
												
						<tr>
							<td><input type="submit" value="Submit" /></td>
						</tr>
					</table>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form:form>


			</div>

		</div>


	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>