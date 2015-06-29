<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="slbedu.library.model.Trip"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Road trip</title>
</head>
<body>
	<script src="${pageContext.request.contextPath}/js/trip.js"></script>

	<%@ include file="header.jsp"%>
	<div id="welcome" class="container">
		<%!static void printInCell(JspWriter out, String a, int cellSize) throws IOException {
		out.print("<div class=\"col-lg-" + cellSize + "\">");
		out.print(a);
		out.print("</div>");
	}

	static void printAnAdvertisment(JspWriter out, Trip trip)
			throws IOException {
		out.print("<div class=\"row trip-row\">");
		String driverUsername = trip.getDriver().getName();
		printInCell(out, driverUsername, 2);
		printInCell(out, trip.getTravelFrom(), 2);
		printInCell(out, trip.getTravelTo(), 1);
		printInCell(out, trip.getDepartureTime().toString(), 1);
		printInCell(out, String.valueOf(trip.getFreePlaces()) + " places left", 2);
		printInCell(
				out,
				"<input class=\"btn btn-primary\" data-trip-id="
						+ trip.getId()
						+ " onclick='subscribeForTrip(this)' type=\"button\" value='Join'>", 2);
		printInCell(
				out,
				"<input class=\"btn btn-warning\" data-user-id="
						+ trip.getDriver().getId()
						+ " onclick='gotoProfile(this)' type=\"button\" value='View profile'>", 2);
		out.print("</div>");
	}%>
		
		<div class="container main">
			<div class="heading">
				<h1>Matching trips:</h1>
			</div>
			
			<%
				out.print("<div class=\"row\">"
						+ "<div class=\"col-md-2\">Driver</div>"
						+ "<div class=\"col-md-2\">From</div>"
						+ "<div class=\"col-md-1\">To</div>"
						+ "<div class=\"col-md-2\">Date</div>"
						+ "<div class=\"col-md-1\">Time</div>"
						+ "<div class=\"col-md-2\">Join trip</div>"
						+ "<div class=\"col-md-2\">Profile</div>" + "</div>");
			
				List<Trip> matchingTrips = (List<Trip>) request
						.getAttribute("matchingTrips");

				for (Trip a : matchingTrips) {
					printAnAdvertisment(out, a);
				}

				if (matchingTrips.isEmpty()) {
					out.print("<div  class=\"text-danger\">No matching trips</div>");
				}
			%>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>