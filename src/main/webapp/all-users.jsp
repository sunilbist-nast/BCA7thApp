<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="np.edu.nast.bca7th.db.MyConnector"%>
<%@page import="java.sql.Connection"%>
<%
if (session.getAttribute("username")== "" ||session.getAttribute("username")==null) {
	response.sendRedirect("login.jsp?err=Please login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users Page</title>
</head>
<body>
	<h1>
		Welcome
		<%
	out.print(session.getAttribute("username"));
	%>
	</h1>
	
	<h1>All Users Profile</h1>
	<%
	try{
	int id =Integer.parseInt(session.getAttribute("userId").toString());
	String role=session.getAttribute("role").toString();
	Connection conn = MyConnector.connect();
	String sql="SELECT * FROM tbl_users WHERE id=? AND status=?";
	
	if(role.equals("ADM")){
	sql="SELECT * FROM tbl_users WHERE NOT id=? AND status=?";
	}
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, id);
	stmt.setInt(2, 1);
	ResultSet rs = stmt.executeQuery();
	while(rs.next()){
		out.print("User Id:"+rs.getInt("id") +"<br/>");
		out.print("Name:"+rs.getString("first_name")+" "+rs.getString("last_name")+"<br/>");
		out.print("Email: "+rs.getString("user__name")+"<br/>");
		out.print("Role: "+rs.getString("role")+"<hr/>");
	}
	conn.close();
	
	}catch(Exception e){
		out.print(e.getMessage());
	}
	%>
	
	<a href="logout.jsp">Logout</a>
	
</body>
</html>