<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="styles/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="styles/library.css" />
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	function register() {
	    var formUrl = $("#register_form").attr("action");
	    var username = $("#userName")[0].value;
	    var password = $("#pwd")[0].value;
	    var email = $("#email")[0].value;
	    
	    if(!isPasswordValid(password)) {
	        return ;
	    }
	    
	    var data = { user : {
		            userName : username,
		            password : password,
		            email : email
    			}
	    }
	    
		$.ajax({
		    url: 'register',
		    type: "POST",
		    contentType: "application/json;charset=UTF-8",
		    data: JSON.stringify(data)
		})
		.success(function(data) {
	//	    $("#register_form").attr("action", "index.html");
		})
		.fail(function(data) {
//		    $("#register_form").attr("action", "register.html");

		})
		.always(function() {
			$("#register_form").submit();
        });
    }

    function isPasswordValid(password) {
        var confirmPassword = $("#conf_pwd")[0].value;

        if (password == "" || confirmPassword == "") {
            alert("Please fill both fields for password and try again.");
            return false;
        }

        if (password != confirmPassword) {
            alert("Two passwords do not match. Please correct the values and try again.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>

	<h1 align="center">
		<b>REGISTRATION FORM</b>
	</h1>

	<form id="register_form" role="form" method="post">
		<div class="form-group">
			<label for="userName">Username:</label> <input type="text"
				class="form-control" name="username" id="userName" value="">
		</div>
		<div class="form-group">
			<label for="pwd">Password:</label> <input type="password"
				class="form-control" name="password" id="pwd" value="">
		</div>
		
		<div class="form-group">
			<label for="conf_pwd">Confirm password:</label> <input type="password"
				class="form-control" name="confirm_password" id="conf_pwd" value="">
		</div>
		
		<div class="form-group">
			<label for="email">Email:</label> <input type="email"
				class="form-control" name="email" id="email" value="">
		</div>
		<button type="reset" class="btn btn-default">Reset</button>
		<button type="button" onclick="register()" class="btn btn-default">Submit</button>
	</form>
	
</body>
</html>