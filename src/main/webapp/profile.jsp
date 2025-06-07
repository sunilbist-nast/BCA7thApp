<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="np.edu.nast.bca7th.db.MyConnector"%>
<%@page import="java.sql.Connection"%>
<%
if (session.getAttribute("username") == "" || session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp?err=Please login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
</head>
<body>
	<h1>
		Welcome
		<%
	out.print(session.getAttribute("username"));
	%>
	</h1>

	<h1>Edit Profile</h1>
	<%
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		Connection conn = MyConnector.connect();
		String sql = "SELECT * FROM tbl_users WHERE id=? AND status=?";

		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, id);
		stmt.setInt(2, 1);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
	%>

	<form method="post" action="#">
		<input type="hidden" name="txt_id" value="<%=rs.getInt("id")%>"
			required /><br /> <label>First Name</label> <input type="text"
			name="txt_firstname" value="<%=rs.getString("first_name")%>"
			required /><br /> <label>Last Name</label> <input type="text"
			name="txt_lastname" value="<%=rs.getString("last_name")%>" required /><br />

		<button name="btn_update" type="submit">Update Profile</button>

	</form>
	<%
	}
	conn.close();

	} catch (Exception e) {
	out.print(e.getMessage());
	}
	%>

	<a href="logout.jsp">Logout</a>


	<%
	try {
		//capturing users input

		if (request.getAttribute("btn_update")!=null || request.getAttribute("btn_update")!="") {

			String firstName = request.getParameter("txt_firstname");
			String lastName = request.getParameter("txt_lastname");
			int id = Integer.parseInt(request.getParameter("txt_id"));

			Connection conn = MyConnector.connect();

			//Sql statement
			String sql = "UPDATE tbl_users SET first_name=?, last_name=? WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setInt(3, id);

			//execute query

			int res = stmt.executeUpdate();
			conn.close();
			if (res > 0) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("profile.jsp?id=" + id + "&err=sorry");
			}
		}
	} catch (Exception e) {
		out.print(e);
	}
	%>

</body>
</html>