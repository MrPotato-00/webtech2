<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import= "java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>


<%
	String login= request.getParameter("login");
	if(login==null || login.trim().isEmpty()){
		out.print("<span style='color: red;'>Enter a login name!</span>");
		//return;
	}

	//Connection con= null;
	//PreparedStatement ps= null;
	//ResultSet rs= null;
	
	try{
		//Class.forName('com.mysql.jdbc.Driver').newInstance();
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		Connection con= DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
		
		/*		
		 Statement st = con.createStatement();
           		 ResultSet rs = st.executeQuery("select * from q22;");

            		while (rs.next()) {
                			String name = rs.getString("login_name");
                			System.out.println(name);
            		}
            		st.close();
            		con.close();
		*/
		if (con!=null) out.print(con);
		PreparedStatement ps= con.prepareStatement("select * from q22 where login_name=?");
		ps.setString(1, login);
		ResultSet rs= ps.executeQuery();

		if(rs.next()){
			out.print("<span style='color:red;'>Login name is taken</span>");
		}
		else{
			out.print("<span style='color:green;'>Login name is available.</span>");
		
		}
		if (con!=null) {
			con.close();
		}
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	

%>
