<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ecotravel.utils.TownsContainer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Road trip</title>
</head>
<body>

	<%@ include file="header.jsp" %>
	<div class="container main">
		<div class="heading">
			<h1>Create Your Trip</h1>
		</div>	
		<div class="tripForm">	
			<form method="POST" action="trip" class="form-horizontal">
				<div class="form-group">
					<label for="fromCity" class="col-md-2 control-label">From:</label> 
					<div class="col-md-10">
						<select id="fromCity" name="fromCity" class="form-control">
							<!-- use enums here -->
							<% TownsContainer.printTownsInSelectMenu(out);	%>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="toCity" class="col-md-2 control-label">To:</label> 
					<div class="col-md-10">
						<select id="toCity" name="toCity" class="form-control">
							<!-- use enums here -->
							<% TownsContainer.printTownsInSelectMenu(out);	%>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="date" class="col-md-2 control-label">Date:</label> 
					<div class="col-md-10">
						<input id="date" type="date" name="date" required="required" class="form-control">
					</div>
				</div>
				
				<div class="form-group">
					<label for="time" class="col-md-2 control-label">Time:</label> 
					<div class="col-md-10">
						<input id="time" type="time" name="time" required="required" class="form-control">
					</div>
				</div>
				
		  		<div class="form-group">
					<label for="number-of-free-places" class="col-md-2 control-label">Number of free places:</label> 
					<div class="col-md-10">
						<input id="number-of-free-places" type="number" name="freePlaces" min="1" max="6" required="required" class="form-control">
					</div>
				</div>
		  		
		  		<!-- <br> -->
		  		<h4 style="color:red">${trip_creation_error_msg}</h4>
		  		
		  		<input type="reset" value="Reset" class="btn btn-warning"/>
		  		<input type="submit" name="tripCreation" value="Create" class="btn btn-primary">
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>