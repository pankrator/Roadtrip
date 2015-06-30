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
		
	<div class="container main">
		<div class="heading">
			<h1>Edit trip</h1>
		</div>
		<div class="editTrip">
			<form method="POST" action="${pageContext.request.contextPath}/trip/submitTripChanges" class="form-horizontal">
				<div class="form-group" id="fromField">
					<label class="control-label" for="from">From:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<input class="form-control"type = "text" name = "from" value="From" />
				</div>
								
				<div class="form-group" id="toField">
					<label class="control-label" for="to">To:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<input class="form-control" type = "text" name = "to" value="To" />
				</div>
				
				<div class="form-group" id="fromField">
					<label class="control-label" for="date">Date:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<input class="form-control" type = "text" name = "date" value="Date" />
				</div>
				
				<div class="form-group" id="timeField">
					<label class="control-label" for="time">Time:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<input class="form-control" type = "text" name = "time" value="Time" />
				</div>
				
				<div class="form-group" id="freePlaces">
					<label class="control-label" for="freePlaces">Available seats:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<input type="number" min="0" max="6" name="freePlaces" value="Free Places">
				</div>
				
				<div class="form-group">
					<div class="col-md-4 col-md-offset-4">
						<input type="submit" value="Submit" class="btn btn-success"/>
					</div>
				</div>		
<%--				<%! static void printInCell(JspWriter out, String a) throws IOException {
						out.print("<td>");
							out.print(a);
						out.println("</td>");
					}
					
					static DateFormat formatter = new SimpleDateFormat("dd-MM HH:mm");
					
					static void printTrip(JspWriter out, Trip trip) throws IOException {
						out.println("<tr>");
							printInCell(out, trip.getTravelFrom());
							printInCell(out, trip.getTravelTo());
							printInCell(out, formatter.format(trip.getDepartureTime()));
							out.println("<input type=\"hidden\" name=\"tripId\" value=\"" + trip.getId() + "\"/>");
							out.println("<td><input type=\"number\" min=\"0\" max=\"6\" name=\"freePlaces\" value=\"Free Places\"></td>");
							out.println("<td><input type=\"submit\" value=\"Confirm Changes\" class=\"btn btn-info\"/></td>");
						out.println("</tr>");
					}
				%>
				<table class="table">
					<thead><tr>
						<th>From</th>
			 		    <th>To</th>
			 		  	<th>Date and Time</th>
			   			<th>Free Places</th>
		   			</tr></thead>
		  	    	<tbody>	
						<%
							printTrip(out, (Trip)request.getAttribute("tripToEdit"));
						%>
					</tbody>	
				</table>
 --%>				
			</form>
		</div>
	</div>		
<%--		<h1>PAGE IS UNDER CONSTRUCTION</h1>
		<% out.print("Trip id is: " + request.getAttribute("tripId")); %><!-- to be DELETED -->
--%>
		
	<%@ include file="footer.jsp"%>
</body>
</html>