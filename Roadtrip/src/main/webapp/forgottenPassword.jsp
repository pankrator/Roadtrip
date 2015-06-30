<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container main">
		<div class="heading">
			<h1>Forgotten Password</h1>
		</div>
		
		<form class="forgottenPass form-horizontal" action="${pageContext.request.contextPath}/register/resetPassword" method="Post">
			<div class="form-group">
				<label for="username" class="col-md-1">Hello</label>
				<input class="col-md-3" name="username" type="text" placeholder="Username"/>
			</div>
			<div class="form-group">
				<div class="col-md-4 col-md-offset-3">
					<input type="submit" value="Send new password"  class="btn btn-success" />
				</div>
			</div>
		</form>
	</div>	
	<%@ include file="footer.jsp" %>		
</body>
</html>