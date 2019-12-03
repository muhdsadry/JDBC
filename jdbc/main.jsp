<!-- set the session to true -->
<%@ page session="true" %>

<!-- import Login Bean and java.sql --> 
<%@ page import="student.Login,java.sql.*" %>

<!-- repeating set Header --> 
<%@ include file="setHeader.jsp" %>
 
<%
  // check if the session is not empty or null
  if(session.getAttribute("bean") != null){
	  
  // retrieve LoginBean from session	  
  Login bean = (Login)session.getAttribute("bean");
  
  // check whether the LoginBean.Login and LoginBean.Password are not null or empty
  boolean status = bean.isValid();
  if(bean.getLogin() != null && bean.getPassword() != null){
	  
  // if user is a valid user
    if(status){
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration System</title>
</head>
<body>
<center>
<font face="arial" size="2">
<br>
<strong>Student Registration System</strong><br>
<br>
Welcome <%=bean.getLogin()%><br>
<br>
<table cellspacing="1" cellpadding="1" border="0" width="300" bgcolor="#F4F6F7">
<tr bgcolor="#EEEEEE">
<td align="center">No</td><td align="center">Matric No</td><td align="center">Name</td>
</tr>
<% 
           String sql = "";
           int count = 0;
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev?autoReconnect=true&useSSL=false","root","msas@MYSQL77");
           sql="SELECT recordID, name, matricno FROM registration";
           Statement statement = con.createStatement();                
           ResultSet resultSet = statement.executeQuery(sql);
           
           //display each selected record in the table
           while (resultSet.next()){
        	   count++;
        	   //retrieve data from the column recordID, name and matricno in the table
        	 int id = resultSet.getInt("recordID");
        	 String name = resultSet.getString("name");
        	 String matricno = resultSet.getString("matricno");
%>
<tr bgcolor="#FFFFFF">
<td align="center"><%= count %></td><td align="center"><a href="view.jsp?id=<%=id%>"><%= matricno %></a></td><td>&nbsp;&nbsp;<%= name %></td>
</tr>
<% 	 
           }
        // close the statement and database connection
           statement.close();
           con.close();
        
    
 %>
 </table>
 <br>
<a href="registration.jsp">New Student</a>&nbsp;&nbsp;&nbsp;<a href="form.jsp">Logout</a>
</center>
</font>
</body>
</html>
<%
   }
    else{
%>
<jsp:forward page="form.jsp?error=1" />  
<%   
    }

  }
  else {
%>
  <jsp:forward page="form.jsp?error=2" />  
<%
 }
}
  else{
%>
<jsp:forward page="form.jsp?error=2" />  
<%
}
%>