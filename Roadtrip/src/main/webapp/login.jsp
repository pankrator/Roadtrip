<%@page import="slbedu.library.context.UserContext"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	Login
	
	<% if (((UserContext)(request.getAttribute("context"))).getProfile() == null) { %>
		<form method="post" action="/Roadtrip/login">
			Username: <input type="text" name="username" />
			Password: <input type="password" name="password" />
			
			<input type="submit" value="Sign in"/> 	
		</form>
	<% } else { %>
		<% out.print(((UserContext)(request.getAttribute("context"))).getProfile().getUsername()); %>
	<% } %>
	
	<% if (request.getAttribute("error") != null) { %>
		<span>
			Wrong username or credentials
		</span>
	<% } %>
	
</body>
</html>