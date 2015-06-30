<%@page import="slbedu.library.model.Profile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Profile</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	
	<%
		Profile profile = (Profile)request.getAttribute("profile");
		Driver driver = (Driver)profile.getPerson();
	%>

	<div class="container main">
		<div class="heading">
			<h1>Driver profile:</h1>
		</div>
		
		<table class="table">
			<caption>Personal Information</caption>
			<thead>
			<tr>
				<td><strong>Name: </strong></td>
				<td><strong><% out.print(profile.getPerson().getName()); %></strong></td>
			</tr>
			</thead>
			<tr>
				<th>Year of birth:</th>
				<td><% out.print(profile.getPerson().getBirthYear()); %></td>
			</tr>
			<tr>
				<th>E-mail: </th>
				<td><% out.print(profile.getEmail()); %></td>
			</tr>
			<tr>
				<th>Phone: </th>
				<td><% out.print(profile.getPerson().getTelephone()); %></td>
			</tr>
			<tr>
				<th>License year: </th>
				<td><% out.print(driver.getLicenseYear()); %></td>
			</tr>
			<tr>
				<th>Is smoking in car allowed: </th>
				<td><% out.print(driver.isSmoking() ? "Yes" : "No"); %></td>
			</tr>
			<tr>
				<th>Music: </th>
				<td><% out.print(driver.getMusicInTheCar() != null ? driver.getMusicInTheCar() : ""); %></td>
			</tr>

		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>