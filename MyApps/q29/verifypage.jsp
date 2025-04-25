<%@ page import="java.sql.*, java.utils.*"%>

<%
    String username= request.getParameter("username");
    String password= request.getParameter("password");

    try{
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        Connection conn= DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
    
        PreparedStatement ps= conn.prepareStatement("SELECT * FROM q22 WHERE login_name=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs= ps.executeQuery();
    
        if (rs.next()){
    %>
            <h2>Login Success !!</h2>
    <%
        }
        else{
    %>
            <h2>Login Failed !! Check Username or Password.</h2>
    <%
        }
    }
    catch(Exception e){
        out.print(e.printStackTrace());

    }
    finally{
        if(conn!=null) conn.close();
    }

%>