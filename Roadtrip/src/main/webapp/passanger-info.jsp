<%@page import="com.ecotravel.context.UserContext"%>
<%@page import="com.ecotravel.model.Passenger"%>
<%@page import="com.ecotravel.model.Profile"%>

<%
	Profile profile = ((UserContext)(request.getAttribute("context"))).getProfile();
	Passenger passenger = (Passenger)profile.getPerson();
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

</table>
