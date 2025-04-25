<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import= "java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>


<%
	String login= request.getParameter("username");
    String password= request.getParameter("password");

	//Connection con= null;
	//PreparedStatement ps= null;
	//ResultSet rs= null;
	
	try{
		//Class.forName('com.mysql.jdbc.Driver').newInstance();
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		Connection con= DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
		
		if (con!=null) out.print(con);
		PreparedStatement ps= con.prepareStatement("select * from q22 where login_name=? and password=?");
		ps.setString(1, login);
        ps.setString(2, password);
		ResultSet rs= ps.executeQuery();
		
		if(rs.next()){
			out.print("success");
		}
		else{
			out.print("failure");
		
		}
		if (con!=null) {
			con.close();
		}
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	

%>
