<%
if(session!=null){
	session.setAttribute("username","");
	session.invalidate();	
}
response.sendRedirect("login.jsp?err=success");

%>