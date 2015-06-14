<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Road trip</title>
</head>
<body>

	<%@ include file="header.jsp" %>
	<div class="container">
		<form id="registerForm" method="POST" action="" class="form-horizontal">
			<div class="form-group" id="nameField">
				<label class="control-label" for="name">Name:</label>
				<h6 style="color:red; display:inline; margin-left:5px;">${short_name_msg}</h6>
				<input class="form-control" id="name" type = "text" name="name" required="true"/>
			</div>
			
			<div class="form-group" id="age">
				<label class="control-label" for="birthYear">Birth Year:</label>
				<input class="form-control" id="birthYear" type="number" name="birthYear" min="1950" max="2000">
			</div>
			
			<div class="form-group" id="phoneField">
				<label class="control-label" for="telephone">Phone:</label>
				<h6 style="color:red; display:inline; margin-left:5px;">${invalid_phone_msg}</h6>
				<input class="form-control" id="telephone" type = "tel" name = "telephone" required="true"/>
			</div>
			
			<div class="form-group" id="emailField">
				<label class="control-label" for="email">Email:</label>
				<h6 style="color:red; display:inline; margin-left:5px;">${invalid_email_msg}</h6>
				<input class="form-control" id="email"  type = "email" name = "email" required="true"/>
			</div>
			<h4 style="color:red">${email_taken_msg}</h4>
			
			<div class="form-group" id="usernameFiled">
				<label class="control-label" for="username">Username:</label>
				<h6 style="color:red; display:inline; margin-left:5px;">${short_username_msg}</h6>
				<input id="username" class="form-control" type = "text" name = "username" required="true"/>
			</div>
			<h4 style="color:red">${username_taken_msg}</h4>
			
			<div class="form-group" id="passwordField">
				<label class="control-label" for="password">Password:</label>
				<h6 style="color:red; display:inline; margin-left:5px;">${weak_password_msg}</h6>
				<input id="password" class="form-control" type = "password" name = "password" required="true"/>
			</div>
			
			<div class="form-group" id="rePasswordField">
				<label class="control-label" for="retype-password">Confirm Password:</label>
				<input id="retype-password" class="form-control" type = "password" name = "confirm_password" required="true"/>
			</div>
			<h4 style="color:red">${confirm_error_msg}</h4>
			
			<div class="form-group">
				<label class="control-label" for="personType">Are you driver or passanger:</label>
				<select class="form-control" name="personType" id="personType"">
					<option value="DRIVER">Driver</option>
					<option value="PASSANGER">Passanger</option>
				</select>
			</div>
				
			<div class="form-group" id="hasDriverLicense">
				<label class="control-label" for="driverOption">Do you have a driving license?</label>
				<div class="row">
					<label class="control-label">Yes</label>
					<input type="radio" name="driverLicense" value="Yes"/>
				</div>
				<div class="row">
					<label class="control-label">No</label>
					<input type="radio" name="driverLicense" value="No" checked="checked" />
				</div>
			</div>
			
			<input type="reset" value="reset" class="btn btn-warning"/>
			<input type="submit" name="registerSubmit" value="submit" class="btn btn-primary"/>
		</form>	
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>