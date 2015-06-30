<%@page import="slbedu.library.context.UserContext"%>
<%@page import="slbedu.library.model.Profile"%>
<%@page import="slbedu.library.model.Driver"%>

<%
	Profile profile = ((UserContext)(request.getAttribute("context"))).getProfile();
	Driver driver = (Driver)profile.getPerson();
%>

<table class="table">
	<caption>Personal Information</caption>
	<thead>
	<tr>
		<td><strong>Name: </strong></td>
		<td><strong><% out.print(profile.getPerson().getName()); %></strong></td>
	</tr>
	</thead>
	<tr>
		<th>Username: </th>
		<td><% out.print(profile.getUsername()); %></td>
	</tr>
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
		<th>Driving License: </th>
		<td>Yes</td>
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