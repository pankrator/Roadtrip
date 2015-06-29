<%@ page import="java.io.IOException"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.List"%>
<%@ page import="slbedu.library.model.Trip"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Road trip</title>
</head>
<body>
	<%@ include file="header.jsp"%>
		
		<h1>PAGE IS UNDER CONSTRUCTION</h1>
		<% out.print("Trip id is: " + request.getAttribute("tripId")); %><!-- to be DELETED -->
		
		<div>
			<form method="POST" action="${pageContext.request.contextPath}/trip/submitTripChanges" class="form-horizontal">
				
			<%! static void printInCell(JspWriter out, String a) throws IOException {
					out.print("<div class=\"col-lg-1\">");
						out.print(a);
					out.println("</div>");
				}
				
				static DateFormat formatter = new SimpleDateFormat("dd-MM HH:mm");
				
				static void printTrip(JspWriter out, Trip trip) throws IOException {
					out.println("<div class=\"row\">");
						printInCell(out, trip.getTravelFrom());
						printInCell(out, trip.getTravelTo());
						printInCell(out, formatter.format(trip.getDepartureTime()));
						out.println("<div class=\"col-lg-2\">");
							out.println("<input type=\"hidden\" name=\"tripId\" value=\"" + trip.getId() + "\"/>");
							out.println("<input type=\"number\" min=\"0\" max=\"6\" name=\"freePlaces\" value=\"Free Places\">");
							out.println("<input type=\"submit\" value=\"Confirm Changes\" class=\"btn btn-info\"/>");
						out.println("</div>");
					out.println("</div>");
				}
			%>
				<div class="row">
					<div class="col-lg-1">From</div>
		 		    <div class="col-lg-1">To</div>
		 		  	<div class="col-lg-1">Date and Time</div>
		   			<div class="col-lg-1">Free Places</div>
		  	    </div>
			<%
				printTrip(out, (Trip)request.getAttribute("tripToEdit"));
			%>
				
			</form>
		</div>
		
	<%@ include file="footer.jsp"%>
</body>
</html>