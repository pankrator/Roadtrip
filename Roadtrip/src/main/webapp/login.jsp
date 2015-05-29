<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	Login
	
	<form method="post" action="/Roadtrip/login">
		Username: <input type="text" name="username" />
		Password: <input type="password" name="password" />
		
		<input type="submit" value="Sign in"/> 	
	</form>
	
	<% if (request.getAttribute("error") != null) { %>
		<span>
			Wrong username or credentials
		</span>
	<% } %>
	
</body>
</html>