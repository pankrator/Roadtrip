<%@page import="com.ecotravel.model.Trip"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Road trip</title>
</head>
<body>
	<%@ include file="header.jsp"%>
			<%! static void printInCell(JspWriter out, String a) throws IOException {
				out.print("<td>");
				out.print(a);
				out.print("</td>");
			}
			
			static DateFormat formatter = new SimpleDateFormat("dd-MM HH:mm"); 
		
			static void printAnAdvertisment(JspWriter out, Trip trip) throws IOException{
				out.print("<tr>");
					printInCell(out, trip.getTravelFrom());
					printInCell(out, trip.getTravelTo());
					printInCell(out, formatter.format(trip.getDepartureTime()));
					printInCell(out, String.valueOf(trip.getFreePlaces()));
			}
			%>
	<%
		boolean isDriver = ((UserContext) (request.getAttribute("context")))
				.getProfile().getPerson() instanceof Driver;
	%>

	<div class="container main">
		<div class="heading">
			<h1>My Profile:</h1>
		</div>
		<div class="row">
			<div class="col-xs-4  personalInfo">
				<%
					if (isDriver) {
				%>
				<%@ include file="driver-info.jsp"%>
				<%
					} else {
				%>
				<%@ include file="passanger-info.jsp"%>
				<%
					}
				%>
			
	
				<form method="GET" action="profile/profileEdit" class="form-horizontal">
					<input type="submit" value="Edit Profile" class="btn btn-info"/>
				</form>
			</div>
		
			<!-- HERE TO PRINT USER'S TRIPS -->
			<div class="col-xs-8 listingTrips">
					
			<%
				if (isDriver) {
					List<Trip> listOfTrips = (List<Trip>) (request
							.getAttribute("tripsList"));
	
					out.print("<table class=\"table\"><caption> List of trips: </caption><thead><tr>"
							+ "<th>From</th>"
							+ "<th>To</th>"
							+ "<th>Depature time</th>"
							+ "<th>Free places</th>"
							+ "</tr></thead>");
	
					for (Trip trip : listOfTrips) {
						printAnAdvertisment(out, trip);
			%>
						<td><form method="GET" action="${pageContext.request.contextPath}/trip/editTrip" class="form-horizontal">
							<input type="hidden" name="tripId" value="<% out.print(trip.getId()); %>"/>
							<input type="submit" value="Edit Trip" class="btn btn-warning"/>
						</form></td>
				
						<td><form method="POST" action="${pageContext.request.contextPath}/trip/deleteTrip" class="form-horizontal">
							<input type="hidden" name="tripId" value="<% out.print(trip.getId()); %>"/>
							<input type="submit" value="Delete Trip" class="btn btn-danger"/>
						</form></td>
			<% 
						out.print("</tr>");
					}// end for loop
					out.print("</table>");
				}
			%>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>