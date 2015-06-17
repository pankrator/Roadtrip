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

	<div id="welcome" class="container">
		<h1>My Profile:</h1>
		<hr>
		<div class="text-success">
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
		</div>
		<!-- HERE TO PRINT USER'S ADVERTISEMENT !!! -->

		<form method="GET" action="profile/profileEdit" class="form-horizontal">
			<input type="submit" value="Edit Profile" class="btn btn-info"/>
		</form>

		<%
			if (isDriver) {
				List<Trip> listOfTrips = (List<Trip>) (request
						.getAttribute("tripsList"));

				out.print("<div class=\"row\">"
						+ "<div class=\"col-lg-2\">From</div>"
						+ "<div class=\"col-lg-2\">To</div>"
						+ "<div class=\"col-lg-2\">Depature time</div>"
						+ "<div class=\"col-lg-2\">Free places</div>"
						+ "</div>");

				for (Trip trip : listOfTrips) {
					printAnAdvertisment(out, trip);
				}
			}
		%>

	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>