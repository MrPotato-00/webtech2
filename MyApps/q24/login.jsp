<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp"%>

<%
	String login= request.getParameter("login");
	String password= request.getParamter("password");
	boolen isvalid= false;

	try{
		Connection conn= DriverManager.getConnection(dbURL, dbUser, dbPass);
		PreparedStatement st= conn.preparedStatement("select * from login_table where login_name=? and passoword=?");
		st.setString(1, login);
		st.setString(2, password);
		ResultSet rs= st.executeQuery();

		if(rs.next()){
			isvalid=true;
		}
	}
	catch(Exception e){
		e.printStaceTrace();
	}
	finally{
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		if(conn!=null) conn.close();

		if(isvalid) out.print("success");
		else out.print("failed");
	}
%>
