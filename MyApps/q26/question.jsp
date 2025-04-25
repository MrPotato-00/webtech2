<@page import="java.sql.*, java.util.*"%>

<html>
    
    <body>
        <h2>Quiz !!</h2>
        <form action="evaluate_answers.jsp" method="POST">
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
                Statement stmt = conn.createStatement();

                Resultset rs = stmt.executeQuery("SELECT * FROM question_bank_26;");

                while(rs.next()) {
                    int ques_id = rs.getInt("qid");
                    String questionText = rs.getString("questions");
        %>
                    <p><b><%= questionText %></b></p>
                    <%
                        Statement stmt2 = conn.createStatement();
                        ResultSet rs2 = stmt2.executeQuery("SELECT * FROM option_bank_26 WHERE qid=" + ques_id);
                        while(rs2.next()) {
                    %>
                        <input type="radio" name="<%= qid %>" value="<%= rs2.getInt("option_id") %>" required>
                        <%= rs2.getString("option_text") %><br>
                    <%
                        }
                        rs2.close();
                        stmt2.close();
                    %>
                    <br>
        <%
                }
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }
        %>
        <input type="submit" value="Submit">
        </form>
    </body>
</html>
