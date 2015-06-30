<!DOCTYPE html>
<%@page import="com.ecotravel.context.UserContext"%>
<%
	UserContext context	= (UserContext)(request.getAttribute("context"));
	boolean isUserLoggedIn = context.getProfile() != null;
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/site.css">
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<title>Road trip</title>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container">
	  <div class="navbar-header">
	    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </button>
	    <span class="navbar-brand">RoadTrip</span>
	  </div>
	  <div class="navbar-collapse collapse navbar-responsive-collapse">
	    <ul class="nav navbar-nav">
	    
	    	<li><a href="${pageContext.request.contextPath}/">Home</a></li>
	    	<li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
			<li><a href="${pageContext.request.contextPath}/history">History</a></li>
	    </ul>

	    <ul class="nav navbar-nav navbar-right">
	    <% if (isUserLoggedIn) { %>
				<li><a href="${pageContext.request.contextPath}/profile" class="text-info">My Profile</a></li>
				<li><form method="GET" action="${pageContext.request.contextPath}/logout">
					<input type="submit" value="Logout" class="btn btn-danger" />
				</form>
				</li>
		<% } %>
	    </ul>
		</div>
	  </div>	
	  </nav>
</body>
</html>