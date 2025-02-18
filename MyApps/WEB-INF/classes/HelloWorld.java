import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class HelloWorld extends HttpServlet{
	private String message;
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException{
		message= "Hello World";
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		
		PrintWriter out= response.getWriter();
		out.println("<h1>" + message + "</h1>");
	}
}
