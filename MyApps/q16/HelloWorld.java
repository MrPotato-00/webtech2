import java.io.*;
import java.servlet.*;
import java.servlet.http.*;

public class HelloWorld extends HttpServlet{
	private String message;

	public void init() throws ServletException{
		message= "Hello World";
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		
		PrintWriter out= response.getWriter();
		out.println("<h1>" + message + "</h1>");
	}
}
