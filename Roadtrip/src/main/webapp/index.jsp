<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Road trip</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/welcomeStyle.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="welcome" class="container">
		
		
		<form id="loginForm" method="POST" class="fom-horizontal" action="login">
			<div class="form-group">
				<label for="username" class="col-md-2 control-label">Username:</label>
				<div class="col-md-10">
					<input type="text" class="form-control control-field" name="username" placeholder="Enter your username" required="required"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="password" class="col-md-2 control-label">Password:</label>
				<div class="col-md-10">
					<input type="password" class="form-control control-field" name="password" placeholder="Enter your password" required="required"/>
				</div>
			</div>
			<div>
				<input type="submit" value="Submit" class="btn btn-success">
			</div>
		</form>
		
		<a id="forgottenPassword" href="ForgottenPassword" class="text-danger">Forgotten password</a>
		<a id="registerForm" href="register" class="text-info">Create new account</a>
			
		<h3 style="color:red"> ${login_error} </h3>
		<h4>${reg_complete_msg}</h4>	 	
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>