<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	Login
	
	Username: <input type="text" name="username" />
	Password: <input type="password" name="password" />
		
	<% if (request.getAttribute("error").equals("WRONG_CREDENTIALS")) { %>
		<span>
			Wrong username or credentials
		</span>
	<% } %>
	
</body>
</html>