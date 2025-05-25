<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application Login</title>
</head>
<body>
<h2>Application Signup</h2>
<hr/>
<form method="post" action="signup-process.jsp">
<label>First Name</label>
<input type="text" name="txt_firstname" required/><br/>

<label>Last Name</label>
<input type="text" name="txt_lastname" required/><br/>

<label>Username</label>
<input type="text" name="txt_username" required/><br/>
<label>Password</label>
<input type="password" name="txt_password" required/><br/>
<button type="submit">Register</button>
<p> Already have an account?
<a href="login.jsp">Login here</a>
</p>
</form>
</body>
</html>