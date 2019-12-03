package student;
import java.io.*; 
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/jdbc/Deletion")
public class Deletion extends HttpServlet{
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 
			HttpSession session = request.getSession();
			
			// check if the session is not empty or null
			  if(session.getAttribute("bean") != null){
				  
			  // retrieve LoginBean from session	  
			  Login bean = (Login)session.getAttribute("bean");
			  
			  // check whether the LoginBean.Login and LoginBean.Password are not null or empty
			  boolean status = bean.isValid();
			  if(bean.getLogin() != null && bean.getPassword() != null){
				  
			  // if user is a valid user
			    if(status == true){
			
			      // get the inputs from HTML form  
	              int id = Integer.parseInt(request.getParameter("id"));  
	        
	        	
	        	   //instantiate studentBean class
		           Student deletebean = new Student();
		        
		            //delete value from database
		            if(deletebean.deleteData(id) == true){
			          RequestDispatcher dispatch = request.getRequestDispatcher("main.jsp");  
			          dispatch.forward(request, response);
		            }
		            else{
		    	      RequestDispatcher dispatch = request.getRequestDispatcher("main.jsp?error=database");  
				      dispatch.forward(request, response);   
		           }
			    } 
		         else{
		           // if login and password are invalid.
			       RequestDispatcher dispatch = request.getRequestDispatcher("form.jsp?error=1");  
		           dispatch.forward(request, response);  
		         }  
			  } 
			    else{
				  // if login and password contain null or empty values.
			       RequestDispatcher dispatch = request.getRequestDispatcher("form.jsp?error=2");  
		           dispatch.forward(request, response);   
			    }
			  } else{
				// if login and password are destroyed in session.
			       RequestDispatcher dispatch = request.getRequestDispatcher("form.jsp?error=2");  
		           dispatch.forward(request, response);   
			  }
		}
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}
}