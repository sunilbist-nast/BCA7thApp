
<%@page import="np.edu.nast.bca7th.db.MyConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {

	//data capturing
	String username = request.getParameter("txt_username");
	String password = request.getParameter("txt_password");

	Connection conn = MyConnector.connect();

	//Sql statement
	String sql = "SELECT * FROM tbl_users WHERE user__name=? AND password=? AND status=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, username);
	stmt.setString(2, password);
	stmt.setInt(3, 1);

	//execute query
	boolean auth = false;
	int id=0;
	String role="USR";
	ResultSet res = stmt.executeQuery();
	while (res.next()) {
		auth = true;
		id=res.getInt("id");
		role=res.getString("role");
	}
	conn.close();
	if (auth) {
		session.setAttribute("username", username);
		session.setAttribute("userId", id);
		session.setAttribute("role", role);
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("login.jsp?err=username/password not matched or you are blocked");
	}
} catch (Exception e) {
	out.print(e);
}
%>