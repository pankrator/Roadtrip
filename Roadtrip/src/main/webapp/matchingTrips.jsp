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
	<%@ include file="header.jsp" %>
	<div id="welcome" class="container">
	<%! static void printInCell(JspWriter out, String a) throws IOException{
			out.print("<div class=\"col-lg-2\">");
				out.print(a);
			out.print("</div>");
		}
	
		static void printAnAdvertisment(JspWriter out, Trip trip) throws IOException{
			out.print("<div class=\"row trip-row\">");
				String driverUsername = trip.getDriver().getName();
				//printInCell(out,"<input class=\"btn btn-primary\" type=\"radio\" name=\"driverUsername\" value=" + driverUsername + ">");
				printInCell(out, driverUsername);
				printInCell(out, trip.getTravelFrom());
				printInCell(out, trip.getTravelTo());
				printInCell(out, trip.getDepartureTime().toString());
				printInCell(out, String.valueOf(trip.getFreePlaces())+ " places left   " + "<input class=\"btn btn-primary\" type=\"radio\" name=\"driverUsername\" value=" + driverUsername + ">");
			out.print("</div>");
		}
	%>
	<div id="parent_div_1">
		<form method="GET" name="selectedAdvertisment" action="SubscribeForTrip">
				<% 
					out.print(  "<div class=\"row\">"
							 		+ "<div class=\"col-lg-2\">Driver</div>"
					 		  		+ "<div class=\"col-lg-2\">From</div>"
					 		        + "<div class=\"col-lg-2\">To</div>" 
					 		  	    + "<div class=\"col-lg-2\">Date</div>"
					 		  		+ "<div class=\"col-lg-2\">Time</div>"
					 		  		+ "<div class=\"col-lg-2\">Joint trip</div>"
					 			+ "</div>");
				ArrayList<Trip> matchingTrips = (ArrayList<Trip>)session.getAttribute("matchingTrips");	
				for(Trip a : matchingTrips) 
					{
						printAnAdvertisment(out, a);
					}
				
					if(!matchingTrips.isEmpty())
						out.print("<ul class=\"pager\"><li class=\"next\"><input class=\"btn btn-primary\" type=\"submit\" value=\"Connect this driver\"></li></ul>");
					else{
						out.print("<div  class=\"text-danger\">No matching trips</div>");
					}
				%>
		</form>
		</div>
		<div id="parent_div_2">
			<% if(!matchingTrips.isEmpty()){
				printInCell(out, "Profiles"); 
				for(Trip a : matchingTrips) 
					{%>
						<div class="row trip-row" class="child_div_1">
							<form action="ViewDriversProfile" method="GET">
								<div class="col-lg-1">
									<input type="hidden" name="driverUsername" value=<%=a.getDriver().getName()%> />
									<input type="submit"class="btn btn-warning" value="View Driver Profile"/></div>
							</form>
						</div>
			<%}	}%>
		</div>
		<h4>${trip_not_selscted_msg}</h4>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>