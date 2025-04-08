<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp"%>

<%
	String login= request.getParameter("loginname");
	String pass= request.getParameter("password");
	String email= request.getParameter("email");
	System.out.println(login);
	System.out.println(pass);
	System.out.println(email);
	Connection con= null;
	PreparedStatement ps= null;

	try{
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		con= DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
		ps= con.prepareStatement("insert into q22(login_name, password, email) values (?, ?, ?)");
		ps.setString(1, login);
		ps.setString(2, pass);
		ps.setString(3, email);

		int i= ps.executeUpdate();
		if(i>0){
		out.println("<h3>Register Successful!<a href='page.html'>Login</a></h3>");
		}
		else{
			out.println("<h3>Register failed!</h3>");
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
