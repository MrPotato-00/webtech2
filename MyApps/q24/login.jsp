<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import= "java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<%
	String login= request.getParameter("login");
	String password= request.getParameter("pass");
	System.out.println(login);
	System.out.println(password);
	boolean isvalid= false;

	try{
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		Connection conn=  DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
		PreparedStatement st= conn.prepareStatement("select * from q22 where login_name=? and password=?");
		if(conn!=null) System.out.println(conn);
		st.setString(1, login);
		st.setString(2, password);
		ResultSet rs= st.executeQuery();
		//System.out.println(rs.getStatement());
		if(rs.next()){
			out.println("<h3>Register Successful!<a href='home.html'>Login</a></h3>");
			//System.out.println("success");
		}
		
		if(conn!=null) conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		//if(rs!=null) rs.close();
		//if(st!=null) st.close();
		//if(conn!=null) conn.close();

		//if(isvalid) out.print("success");
		//else out.print("failed");
	}
%>
