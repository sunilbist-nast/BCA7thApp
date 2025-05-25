
<%
if (session.getAttribute("username") == "" || session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp?err=Please login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	<h1>
		Welcome
		<%
	out.print(session.getAttribute("username"));
	%>
	</h1>

	<a href="logout.jsp">Logout</a>
</body>
</html>