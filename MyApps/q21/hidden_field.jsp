<%@ page import="java.util.*"%>
<html>
    <head><title>Hidden field</title></head>
    <body>
        <%
            int current=0;
            String lastval= request.getParameter("value");
            String button= request.getParameter("button");

            if(button!=null){
                if(button.equals("next")){
                    current= Integer.parseInt(lastval)+1;
    
                }
                else{
                    current= Integer.parseInt(lastval)-1;

                }
                
            }
        %>
        <%=current%>

        <br><br>
        <form method="post">
            <input type="hidden" name="value" value="<%=current%>">
            <input type="submit" name="button" value="prev">
            <input type="submit" name="button" value="next">
            
        </form>
    </body>
</html>