package student;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/jdbc/Registration")
public class Registration extends HttpServlet{
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			// get the inputs from HTML form  
	        String matricno = request.getParameter("matricno");  
	        String fullname = request.getParameter("fullname");
	        String icno = request.getParameter("icno");
	        double cgpa = Double.parseDouble(request.getParameter("cgpa"));
	        String major = request.getParameter("major");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String address = request.getParameter("address");
	        String country = request.getParameter("country");
	        String mahallah = request.getParameter("mahallah");
	        	
	        	//instantiate studentBean class
		        Student studentbean = new Student();
		        
		        //set or store registration values in studentBean
		        studentbean.setMatricNo(matricno);  
		        studentbean.setFullName(fullname);
		        studentbean.setIcNo(icno);
		        studentbean.setCgpa(cgpa);
		        studentbean.setMajor(major);
		        studentbean.setEmail(email);
		        studentbean.setPhone(phone);
		        studentbean.setAddress(address);
		        studentbean.setCountry(country);
		        studentbean.setMahallah(mahallah);
		      
		       //if id exists update existing student record
		       if(request.getParameter("id") != null && !request.getParameter("id").isEmpty()){
		    	   int id = Integer.parseInt(request.getParameter("id"));
		    	   if(studentbean.updateData(id) == true){
				        // store the studentBean object inside session
				        HttpSession session = request.getSession();
				        session.setAttribute("studentBean",studentbean);   
					    RequestDispatcher dispatch = request.getRequestDispatcher("view.jsp?id="+id);  
					    dispatch.forward(request, response);
				       }
				       else{
				    	   RequestDispatcher dispatch = request.getRequestDispatcher("update.jsp?error=database&id="+id);  
						   dispatch.forward(request, response);   
				       }
		       }
		       //if id is null for new record insertion
		       else{
		    	   
		    	   if(studentbean.storeData() == true){
				          // store the studentBean object inside session
				          HttpSession session = request.getSession();
				          session.setAttribute("studentBean",studentbean);   
					      RequestDispatcher dispatch = request.getRequestDispatcher("viewregistration.jsp");  
					      dispatch.forward(request, response);
				         }
				          else{
				    	     RequestDispatcher dispatch = request.getRequestDispatcher("registration.jsp?error=database");  
						     dispatch.forward(request, response);   
				          }

		       }
		}
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response); 
		}
}
