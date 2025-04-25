<%@ page import="java.sql.*, java.utils.*"%>

<%
    String username= request.getParameter("username");
    String old_password= request.getParameter("old_password");
    String new_password= request.getParameter("new_password");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
        PreparedStatement ps= conn.prepareStatement("SELECT * FROM q22 WHERE login_name=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, old_password);

        ResultSet rs= ps.executeQuery();

        if (rs.next()){
            ps= conn.prepareStatement("UPDATE q22 SET password=? WHERE login_name=?");
            ps.setString(1, new_password);
            ps.setString(2, username);
            
            int result= ps.executeUpdate();
            
            if(result>0){
                out.print("Password change success !!");
            }
            else{
                out.print("Password change failed !!");
            }
        }
        else{
            out.print("Username or Old Password is incorrect !! Check again.")
        }
    }
    catch(Exception e){
        out.print(e.printStackTrace());

    }
    finally{
        if(conn!=null) conn.close();
    }
%>