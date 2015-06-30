<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Road trip</title>
</head>
<body>
	<%@ include file="header.jsp" %>
		<div class="container main">
			<div class="heading">
				<h1>Login</h1>
			</div>
			
			<div class="login">
				<form method="POST" class="form-horizontal" action="${pageContext.request.contextPath}/login">
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
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a id="forgottenPassword" href="${pageContext.request.contextPath}/register/forgottenPassword" class="text-danger">Forgotten password</a>
						</div>
						<div class="col-sm-offset-2 col-sm-10">
							<a id="registerForm" href="register" class="text-info">Create new account</a>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-10">
							<input type="submit" value="Submit" class="btn btn-success">
						</div>
					</div>
				</form>
					
				<h3 style="color:red"> ${login_error} </h3>
				<h4>${reg_complete_msg}</h4>	 	
			</div>
		</div>
	<%@ include file="footer.jsp" %>
</body>
</html>