<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
			<h1>Select a role</h1>
		</div>
		<div class="text-center">
			<div>
				<img class="driverImg" src = "${pageContext.request.contextPath}/images/driverImg.gif" >
				<img class="driverImg" src = "${pageContext.request.contextPath}/images//passengerImg.jpg">
			</div>
			
			<div>
				<a href="trip"><img src = "${pageContext.request.contextPath}/images/driver.png" class="arrows"></a>
				<a href="trip/tripSearch"><img src = "${pageContext.request.contextPath}/images/passenger.png" class="arrows"></a>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>