<%@ page import="java.sql.*, java.util.*" %>

<%

    int totalquestions = 0;
    int correct= 0;

    try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://172.16.4.234:3306/test", "be2270", "ynDIFtkL");
        stmt = conn.createStatement();

        rs = stmt.executeQuery("SELECT qid FROM question_bank_26");

        while(rs.next()) {
            int qid = rs.getInt("qid");
            String questionNumber = qid;
            String userAnswer = request.getParameter(questionNumber);

            if(userAnswer != null) {
                totalquestion++;

                Statement checkStmt = conn.createStatement();
                ResultSet checkRs = checkStmt.executeQuery(
                    "SELECT is_correct FROM option_bank_26 WHERE option_id=" + userAnswer);

                if(checkRs.next()) {
                    if(checkRs.getBoolean("is_correct")) {
                        correct++;
                    }
                }
                checkRs.close();
                checkStmt.close();
            }
        }

    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>
<html>
<body>
    <h2>Quiz Result</h2>
    <p>Score: <b><%= correct %></b> of <b><%= totalquestion %></b></p>
</body>
</html>
