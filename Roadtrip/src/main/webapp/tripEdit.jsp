<%@page import="com.ecotravel.model.Trip"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	Trip trip = (Trip)(request.getAttribute("tripToEdit"));
	
%>
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
					<div class="tripAttr"><% out.println(trip.getTravelFrom()); %></div>
				</div>
								
				<div class="form-group" id="toField">
					<label class="control-label" for="to">To:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<div class="tripAttr"><% out.println(trip.getTravelTo()); %></div>
				</div>
				
				<div class="form-group" id="fromField">
					<label class="control-label" for="date">Date:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<div class="tripAttr"><% out.println(trip.getDepartureTime()); %></div>
				</div>
				
				<div class="form-group" id="freePlaces">
					<label class="control-label" for="freePlaces">Available seats:</label>
					<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
					<input type="hidden" name="tripId" value="<%=trip.getId()%>"/>
					<input type="number" min="0" max="6" name="freePlaces" value="<%=trip.getFreePlaces()%>">
				</div>
				
				<div class="form-group">
					<div class="col-md-4 col-md-offset-4">
						<input type="submit" value="Submit" class="btn btn-success"/>
					</div>
				</div>					
			</form>
		</div>
	</div>		
	<%@ include file="footer.jsp"%>
</body>
</html>