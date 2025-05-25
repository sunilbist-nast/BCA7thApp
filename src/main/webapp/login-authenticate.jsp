
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {

	//data capturing
	String username = request.getParameter("txt_username");
	String password = request.getParameter("txt_password");

	//Loading database driver
	Class.forName("com.mysql.cj.jdbc.Driver");

	//Connection establish
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bca7thapp", "root", "");

	//Sql statement
	String sql = "SELECT * FROM tbl_users WHERE user__name=? AND password=? AND status=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, username);
	stmt.setString(2, password);
	stmt.setInt(3, 1);

	//execute query
	boolean auth = false;
	ResultSet res = stmt.executeQuery();
	while (res.next()) {
		auth = true;
	}
	conn.close();
	if (auth) {
		session.setAttribute("username", username);
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("login.jsp?err=username/password not matched or you are blocked");
	}
} catch (Exception e) {
	out.print(e);
}
%>