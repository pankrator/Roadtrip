<%@page import="java.util.List"%>
<%@page import="slbedu.library.model.Trip"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Road trip</title>
</head>
<body>
	<%@ include file="header.jsp" %>

	<div id="welcome" class="container">
		<h1>My Profile:</h1>
		<hr>
		<div class="text-success">
			<p>Name: <strong>${name}</strong> <p>
			<p>Username: ${username} </p>
			<p>Year of birth: ${birthYear}</p>
			<p>E-mail: ${email} </p>
			<p>Phone: ${phone} </p>
			<p>Driving License: Yes</p>
			<p>License year: ${licenseYear}</p>
			<p>Is smoking in car allowed: ${isSmoking}</p>
			<p>Music: ${music} </p>
			<p>Number of travels: ${numberOfTravels}</p>
			<p>Rating: ${rating }</p>
		</div>
		<!-- HERE TO PRINT USER'S ADVERTISEMENT !!! -->
		
		${tripsList}
		<% List<Trip> listOfTrips = (List<Trip>)(request.getAttribute("tripsList")); %>
		
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>