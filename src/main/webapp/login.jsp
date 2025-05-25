<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application Login</title>
</head>
<body>
	<h2>Application Login</h2>
	<hr />
	<%
	if (request.getParameter("err") != "") {
		out.print(request.getParameter("err"));
	}
	%>
	
	<form method="post" action="login-authenticate.jsp">
	<br/>
		<label>Username</label> <input type="text" name="txt_username"
			required /><br /> <label>Password</label> <input type="password"
			name="txt_password" required /><br />
		<button type="submit">Login</button>
		<p>
			Dont have an account? <a href="signup.jsp">Signup here</a>
		</p>
	</form>
</body>
</html>