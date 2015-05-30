<!DOCTYPE html>
<%@page import="slbedu.library.context.UserContext"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/site.css">
	<title>Road trip</title>
</head>
<body>
	<div class="navbar navbar-default">
	  <div class="navbar-header">
	    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </button>
	    <a class="navbar-brand" href="#">RoadTrip</a>
	  </div>
	  <div class="navbar-collapse collapse navbar-responsive-collapse">
	    <ul class="nav navbar-nav">
	    
	    	<li><a href="Home">Home</a></li>
	      	<li><a href="AboutUs">About Us</a></li>
			<li><a href="History">History</a></li>		
	    </ul>
	    <ul class="nav navbar-nav pull-right">
	    <% if (((UserContext)(request.getAttribute("context"))).getProfile() != null) { %>
				<li><a href="Statistics">Statistics</a></li>	
				<li><a href="Profile" class="text-info">My Profile</a></li>
				<li><form method="POST" action="Logout">
					<input type="submit" value="Logout" class="btn btn-danger" />
				</form>
				</li>
		<% } %>
	    </ul>
		</div>
	  </div>	
</body>
</html>