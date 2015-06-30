<%@page import="com.ecotravel.utils.TownsContainer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Road trip</title>
<style>
	body {
		text-align: center;
		background-color: #FFFFCC;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container main">
		<div class="heading">
			<h1>Search For Advertisements</h1>
		</div>
		<div class="searchTrip">
			<form method="GET" action="${pageContext.request.contextPath}/trip/searchTrip" class="form-horizontal">
				<div class="form-group">
					<label for="fromCity" class="col-md-2 control-label">From:</label> 
					<div class="col-md-10">
						<select id="fromCity" name="fromCity" class="form-control">
							<% TownsContainer.printTownsInSelectMenu(out);	%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="toCity" class="col-md-2 control-label">To:</label> 
					<div class="col-md-10">
						<select id="toCity" name="toCity" class="form-control">
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
					<div class="col-md-4 col-md-offset-4">
						<input type="submit" value="Search!" class="btn btn-primary">
					</div>
				</div>
			</form>
		</div>
		
		<h3>${searching_msg}</h3>
		<h3>${email_sent_msg}</h3>
		
	</div>
	
	<%@ include file="footer.jsp" %>	
</body>
</html>