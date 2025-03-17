<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp"%>

<%
	String login= request.getParameter("login");
	String pass= request.getParameter("pass");
	String email= request.getParameter("email");
	
	Connection con= null;
	PreparedStatement ps= null;

	try{
		con= DriverManager.getConnection(dbURL, dbUser, dbPass);
		ps= con.prepareStatement("insert into users(login_name, password, email) values (?, ?, ?)");
		ps.setString(1, login);
		ps.setString(2, pass);
		ps.setString(3, email);

		int i= ps.executeUpdate();
		if(i>0){
		out.println("<h3>Register Successful!<a href='page.html'>Login</a></h3>");
		}
		else{
			out.println("<h3>Register failed!</h3?");
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}
%>
