<%@page import="slbedu.library.context.UserContext"%>
<%@page import="slbedu.library.model.Profile"%>
<%@page import="slbedu.library.model.Passenger"%>

<%
	Profile profile = ((UserContext)(request.getAttribute("context"))).getProfile();
	Passenger passenger = (Passenger)profile.getPerson();
%>

<p>Name: <strong><% out.print(profile.getPerson().getName()); %></strong> <p>
<p>Username: <% out.print(profile.getUsername()); %> </p>
<p>Year of birth: <% out.print(profile.getPerson().getBirthYear()); %></p>
<p>E-mail: <% out.print(profile.getEmail()); %></p>
<p>Phone: <% out.print(profile.getPerson().getTelephone()); %> </p>
<p>Driving License: No</p>
<p>Rating: <% out.print(passenger.getRating()); %></p>
