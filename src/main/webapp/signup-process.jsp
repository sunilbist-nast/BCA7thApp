<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {
	//capturing users input

	String firstName = request.getParameter("txt_firstname");
	String lastName = request.getParameter("txt_lastname");
	String username = request.getParameter("txt_username");
	String password = request.getParameter("txt_password");

	//Loading database driver
	Class.forName("com.mysql.cj.jdbc.Driver");

	//Connection establish
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bca7thapp", "root", "");

	//Sql statement
	String sql = "INSERT INTO tbl_users(first_name, last_name, user__name, password, role, status)"
	+ " VALUES (?, ?, ?, ?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, firstName);
	stmt.setString(2, lastName);
	stmt.setString(3, username);
	stmt.setString(4, password);
	stmt.setString(5, "USR");
	stmt.setInt(6, 1);

	//execute query

	int res = stmt.executeUpdate();
	conn.close();
	if (res > 0) {
		response.sendRedirect("login.jsp");
	} else {
		response.sendRedirect("signup.jsp?error=sorry");
	}
} catch (Exception e) {
	out.print(e);
}
%>