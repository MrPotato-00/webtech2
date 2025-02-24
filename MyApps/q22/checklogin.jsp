<%@ page import= "java.sql.*"%>
<%@ include file="dbconfig.jsp"%>

<%
	String login= request.getParameter("login");
	if(login==null || login.trim().isEmpty()){
		out.print("<span style='color: red;'>Enter a login name!</span>");
		return;
	}

	Connection con= null;
	PreparedStatement ps= null;
	ResultSet rs= null;

	try{
		con= DriverManager.getConnection(dbURL, dbUser, dbPass);
		ps= con.prepareStatement("select * from users where login_name=?");
		ps.setString(1, login);
		rs= ps.executQuery();

		if(rs.next()){
			out.print("<span style='color:red;'>Login name is taken.</span>");
		}
		else{
			out.print("<span style='color: red;'>Login name is available.</span>");
		
		}

	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs) r.close();
		if(ps) ps.close();
		if(con) con.close();
	}

%>
