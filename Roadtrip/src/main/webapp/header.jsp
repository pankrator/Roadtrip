<!DOCTYPE html>
<%@page import="slbedu.library.model.Driver"%>
<%@page import="slbedu.library.context.UserContext"%>
<%
	UserContext context	= (UserContext)(request.getAttribute("context"));
	boolean isUserLoggedIn = context.getProfile() != null;
	String homePagePath = "/trip/tripSearch";
	if(isUserLoggedIn &&	context.getProfile().getPerson() instanceof Driver)
	{
		homePagePath = "/trip/driverMainPage";
	}
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/site.css">
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
	    <a class="navbar-brand" href="#">RoadTrip</a>
	  </div>
	  <div class="navbar-collapse collapse navbar-responsive-collapse">
	    <ul class="nav navbar-nav">
	    
	    	<li><a href="<%=homePagePath%> " >Home</a></li>
	    	<li><a href="about.jsp">About Us</a></li>
			<li><a href="history.jsp">History</a></li>
	    </ul>

	    <ul class="nav navbar-nav navbar-right">
	    <% if (isUserLoggedIn) { %>
				<li><a href="statistics">Statistics</a></li>
				<li><a href="profile" class="text-info">My Profile</a></li>
				<li><form method="GET" action="logout">
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