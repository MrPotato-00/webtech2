<%@ page import="java.util.*" %>
<html>
    <head><title>URL Rewriting</title></head>
    <body>
        <%
            int last=0;
            String param= request.getParameter("value");
            if(param!=null) last=Integer.parseInt(param);
            
        %>
        <%=last%>
        <br><br>
        <a href="intUrl.jsp?int=<%=last-1%>">prev</a>
        <a href="intUrl.jsp?int=<%=last+1%>">next</a>
    </body>
</html>