<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
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
	<%@ include file="header.jsp"%>
	<div class="body">
	<%! static void printInCell(JspWriter out, String a) throws IOException {
			out.print("<div class=\"col-lg-2\">");
				out.print(a);
			out.print("</div>");
		}
		
		static DateFormat formatter = new SimpleDateFormat("dd-MM HH:mm"); 
	
		static void printAnAdvertisment(JspWriter out, Trip trip) throws IOException{
			out.print("<div class=\"row\">");
				printInCell(out, trip.getTravelFrom());
				printInCell(out, trip.getTravelTo());
				printInCell(out, formatter.format(trip.getDepartureTime()));
				printInCell(out, String.valueOf(trip.getFreePlaces()));
			out.print("</div>");
		}
	%>

	<%
		boolean isDriver = ((UserContext) (request.getAttribute("context")))
				.getProfile().getPerson() instanceof Driver;
	%>

	<div class="container">
		<div class="heading">
			<h1>My Profile:</h1>
		</div>
		<div class="row">
			<div class="col-xs-6">
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
			<div class="col-xs-6">
			<%
				if (isDriver) {
					List<Trip> listOfTrips = (List<Trip>) (request
							.getAttribute("tripsList"));
	
					out.print("<table class=\"table\"><caption> List of trips: </caption><thead><tr>"
							+ "<th>From</th>"
							+ "<th>To</th>"
							+ "<th>Depature time</th>"
							+ "<th>Free places</th>"
							+ "</tr></thead></table>");
	
					for (Trip trip : listOfTrips) {
						printAnAdvertisment(out, trip);
			%>
						<form method="GET" action="trip/editTrip" class="form-horizontal">
							<input type="hidden" name="tripId" value="<% out.print(trip.getId()); %>"/>
							<input type="submit" value="Edit Trip" class="btn btn-warning"/>
						</form>
				
						<form method="POST" action="trip/deleteTrip" class="form-horizontal">
							<input type="hidden" name="tripId" value="<% out.print(trip.getId()); %>"/>
							<input type="submit" value="Delete Trip" class="btn btn-danger"/>
						</form>
			<% 
					} // end for loop
				}
			%>
			
			<!-- ЗАБЕЛЕЖКА: 
					методът printAnAdvertisment() принти всяка обява в отделен <div>
					обаче за всяка обява трябва да има 1 бутон Edit и 1 бутон Delete
					те са съответно във формичките във for цикъла, обаче НЕ влизат в <div>-а на
					съответстващата им обява. Май тр да се сложат вътре ??  -->
			</div>
		</div>
	</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>