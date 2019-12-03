package student;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/jdbc/Validation")
public class Validation extends HttpServlet{
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			//notify the Internet Browser not to keep track data
			response.setHeader("Cache-Control","no-cache"); 
			response.setHeader("Cache-Control","no-store"); 
			response.setDateHeader("Expires", 0); 
			response.setHeader("Pragma","no-cache"); 
			
			// get the inputs from HTML form  
	        String login = request.getParameter("login");  
	        String password = request.getParameter("password");  
	        
	        // check for empty login & password
	        if(login != null && password != null){
	        	
	        	//instantiate LoginBean class
		        Login bean = new Login();
		        
		        //set or store login and password values in LoginBean
		        bean.setLogin(login);  
		        bean.setPassword(password);
		        
		        // store the Login object inside session
		        HttpSession session = request.getSession();
		        session.setAttribute("bean",bean); 
		        boolean status = bean.isValid();  
		        
		        // check valid login and password
			        if(status == true){  
			        	//if it is a valid user, forward Login object and other resources (request and response) to main.jsp
			            RequestDispatcher dispatch = request.getRequestDispatcher("main.jsp");  
			            dispatch.forward(request, response);  
			        }  
			        else{
			        	//if it is not a valid user, forward to the login page.
			        	RequestDispatcher dispatch = request.getRequestDispatcher("form.jsp?error=1");  
			            dispatch.forward(request, response);  	
			        } 
	        } 
	         else{
	           // if login and password contain null or empty values.
		       RequestDispatcher dispatch = request.getRequestDispatcher("form.jsp?error=2");  
	           dispatch.forward(request, response);  
	         }  
	    }
		
		// call doPost if user try to key in controller inside the URL location
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}
}
