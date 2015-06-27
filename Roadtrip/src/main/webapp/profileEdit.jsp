
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ecotravel.utils.MusicTypesContainer"%>
<%@ page import="slbedu.library.model.Person"%>

<%@ page import="slbedu.library.model.Trip"%>
<%@ page import="slbedu.library.model.Profile"%>
<%@ page import="slbedu.library.model.Driver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/site.css">
<title>Road trip</title>
</head>
<body>

	<%@ include file="header.jsp" %>

	<% 
	   Profile profile = ((UserContext)(request.getAttribute("context"))).getProfile();
	   Person currentUser = profile.getPerson();
	%>
	<%
		boolean isDriver = currentUser instanceof Driver;
	%>	
	<div class="body">
		<div class="container">
			<form id="editForm" method="POST" 
				action=" <% if(isDriver) out.print("profileEditDriver"); 
							else out.print("profileEditPassenger"); %>">
				<div class="form-group" id="nameField">
					<label class="control-label" for="name">Name:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<input class="form-control" id="name" type = "text" name = "name" value=<%=String.valueOf(currentUser.getName())%> />
				</div>
				
				<div class="form-group" id="age">
					<label class="control-label" for="birthYear">Birth Year:</label>
					<input class="form-control" id="birthYear" type="number" name="birthYear" min="1990" max="2000" value=<%=currentUser.getBirthYear()%> />
				</div>
				
				<div class="form-group" id="phoneField">
					<label class="control-label" for="telephone">Phone:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${invalid_phone_msg}</h6>
					<input class="form-control" id="telephone" type = "tel" name = "telephone" value=<%=currentUser.getTelephone()%> >
				</div>
				
				<div class="form-group" id="emailField">
					<!-- Can not be changed -->
					<label class="control-label" for="email">Email:</label>
					<div><%=profile.getEmail()%></div>
				</div>
				
				<div class="form-group" id="usernameFiled">
					<!-- Can not be changed -->
					<label class="control-label" for="username">Username:</label>
					<div><%=profile.getUsername()%></div>
				</div>
				
				<div class="form-group" id="passwordField">
					<label class="control-label" for="password">Password:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${weak_password_msg}</h6>
					<input id="password" class="form-control" type = "password" name = "password" required="true"/>
				</div>
				
				<div class="form-group" id="rePasswordField">
					<label class="control-label" for="retype-password">Retype Password:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${confirm_error_msg}</h6>
					<input id="retype-password" class="form-control" type = "password" name = "rePassword" required="true"/>
				</div>
				<h4 style="color:red">${edit_error_msg}</h4>
					
				<% if(isDriver) { %>			
					<div class="form-group" id="SmokingInTheCar">
						<div class="row">
							<label class="control-label">Is smoking in the car allowed:</label>
						</div>
						<div class="row">
							<label for="yes">Yes</label>
							<input id="yes" type="radio" name="isSmoking" value="Yes">
							<label for="no">No</label>
							<input id="no" type="radio" name="isSmoking" value="No" checked="checked">
						</div>
					</div>
					
					<div class="form-group" id="musicInCar">
						<label for="musicInTheCar">What music is allowed in the car:</label>
						<select id="musicInTheCar" name="musicInTheCar" class="form-control">
							<% MusicTypesContainer.printMusicTypes(out);%>
						</select>
					</div>
				<%} %>
				
				<input type="submit" name="registerSubmit" value="Submit" class="btn btn-primary"/>
			</form>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>