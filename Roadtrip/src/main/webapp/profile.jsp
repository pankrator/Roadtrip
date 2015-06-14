<%@page import="java.util.List"%>
<%@page import="slbedu.library.model.Trip"%>
<%@page import="slbedu.library.model.Profile"%>
<%@page import="slbedu.library.model.Driver"%>
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
			<% if (((UserContext)(request.getAttribute("context"))).getProfile().getPerson() instanceof Driver) { %>
				<%@ include file="driver-info.jsp"%>
			<% } else { %>
				<%@ include file="passanger-info.jsp" %>
			<% } %>
		</div>
		<!-- HERE TO PRINT USER'S ADVERTISEMENT !!! -->
		
		<%
			List<Trip> listOfTrips = (List<Trip>)(request.getAttribute("tripsList"));
			for (Trip trip : listOfTrips) {
				out.print("<div>" + trip.getTravelFrom() + " - " + trip.getTravelTo() + "</div>");
			}
		%>
		
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>