<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Road trip</title>
<style>
	body {
		padding-top: 40px;
		text-align: center;
	}
	img {
		padding: 50px;
		width: 300px;
		height: 300px;
	}
	.arrows {
		padding: 10px;
		width: 30%;
		height: 30%;
	}
	body {
		/* 
		background-color: limegreen;*/
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="welcome" class="container">
		<div>
			<img src = "${pageContext.request.contextPath}/images/driverImg.gif" >
			<img src = "${pageContext.request.contextPath}/images//passengerImg.jpg">
		</div>
		
		<div>
			<a href="trip/trip"><img src = "${pageContext.request.contextPath}/images/driverLogo.png" class="arrows"></a>
			<a href="trip/tripSearch"><img src = "${pageContext.request.contextPath}/images/passengerLogo.png" class="arrows"></a>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>