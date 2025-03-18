<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import= "java.sql.*"%>
<%@ include file="dbconfig.jsp"%>

<%
	String login= request.getParameter("login");
	if(login==null || login.trim().isEmpty()){
		out.print("<span style='color: red;'>Enter a login name!</span>");
		//return;
	}

	Connection con= null;
	PreparedStatement ps= null;
	ResultSet rs= null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection(dbURL, dbUser, dbPass);
		if (con!=null) out.print(con);
		ps= con.prepareStatement("select * from q22 where login_name=?");
		ps.setString(1, login);
		rs= ps.executeQuery();

		if(rs.next()){
			out.print("<span style='color:red;'>Login name is taken.</span>");
		}
		else{
			out.print("<span style='color: green;'>Login name is available.</span>");
		
		}

	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}

%>
