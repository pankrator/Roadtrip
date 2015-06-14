<%@page import="slbedu.library.context.UserContext"%>
<%@page import="slbedu.library.model.Profile"%>
<%@page import="slbedu.library.model.Driver"%>

<%
	Profile profile = ((UserContext)(request.getAttribute("context"))).getProfile();
	Driver driver = (Driver)profile.getPerson();
%>

<p>Name: <strong><% out.print(profile.getPerson().getName()); %></strong> <p>
<p>Username: <% out.print(profile.getUsername()); %> </p>
<p>Year of birth: <% out.print(profile.getPerson().getBirthYear()); %></p>
<p>E-mail: <% out.print(profile.getEmail()); %></p>
<p>Phone: <% out.print(profile.getPerson().getTelephone()); %> </p>
<p>Driving License: Yes</p>
<p>License year: <% out.print(driver.getLicenseYear()); %></p>
<p>Is smoking in car allowed: <% out.print(driver.isSmoking()); %></p>
<p>Music: <% out.print(driver.getMusicInTheCar()); %></p>
<p>Number of travels: <% out.print(driver.getNumberOfTravels()); %></p>
<p>Rating: <% out.print(driver.getRating()); %></p>