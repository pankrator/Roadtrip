<%@page import="com.ecotravel.model.Trip"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="${pageContext.request.contextPath}/js/trip.js"></script>
<title>Road trip</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%!static void printInCell(JspWriter out, String a, int cellSize) throws IOException {
			out.print("<td>");
				out.print(a);
			out.print("</td>");
		}
	
	static DateFormat formatter = new SimpleDateFormat("dd-MM HH:mm");

	static void printAnAdvertisment(JspWriter out, Trip trip)
			throws IOException {
		out.print("<tr>");
		String driverUsername = trip.getDriver().getName();
		printInCell(out, driverUsername, 2);
		printInCell(out, trip.getTravelFrom(), 2);
		printInCell(out, trip.getTravelTo(), 1);
		printInCell(out, formatter.format(trip.getDepartureTime()), 1);
		printInCell(out, String.valueOf(trip.getFreePlaces()) + " places left", 2);
		printInCell(
				out,
				"<input class=\"btn btn-primary\" data-trip-id="
						+ trip.getId()
						+ " onclick='subscribeForTrip(this)' type=\"button\" value='Join'>", 2);
		printInCell(
				out,
				"<input class=\"btn btn-warning\" data-driver-id="
						+ trip.getDriver().getId()
						+ " onclick='gotoViewProfile(this)' type=\"button\" value='View profile'>", 2);
			
		out.println("</tr>");
	}%>
	<div class="container main">
		<div class="heading">
			<h1>Search Results</h1>
		</div>
		
		<div class="searchResults">
				<table class="table">
					<thead>
						<tr>
							<th>Driver</th>
							<th>From</th>
							<th>To</th>
							<th>Date and Time</th>
							<th>Available seats</th>
							<th>Join</th>
						</tr>
					</thead>
					<tbody>								
						<%
						
							List<Trip> matchingTrips = (List<Trip>)request.getAttribute("matchingTrips");
			
							for (Trip a : matchingTrips) {
								printAnAdvertisment(out, a);
							}
			
							if (matchingTrips.isEmpty()) {
								out.print("<tr class=\"text-danger\">No matching trips</tr>");
							}
						%>
					</tbody>
				</table>				
		</div>
		<h4>${trip_not_selscted_msg}</h4>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>