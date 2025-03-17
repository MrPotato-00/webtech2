<%@ page import="java.util.*"%>
<html>
    <head><title>Cookies</title></head>
    <body>
        <%
            int current=0;
            Cookie cookie=null;
            Cookie[] cookies= request.getCookies();
            if(cookies!=null){
                for(int i=0;i<cookies.length;i++){
                    if(cookies[i].getName().equals("last")){
                        cookie=cookies[i];
                    }
                }
            }

            if(cookie!=null){
                String button= request.getParameter("button");
                if(button!=null){
                    if(button.equals("next")){
                        current= Integer.parseInt(cookie.getValue())+1;
                    }
                    else{
                        current= Integer.parseInt(cookie.getValue())-1;
                    }
                }
            }
            response.addCookie(new Cookie("last", String.valueOf(current)));
            out.println(current);

        %>

        <br><br>
        <form method="post">
            <input type="submit" name="button" value="prev">
            <input type="submit" name="button" value="next">
        </form>
    </body>
</html>