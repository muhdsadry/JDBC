<!-- set the session to true -->
<%@ page session="true" %>

<!-- import Login and java.sql --> 
<%@ page import="student.Login, java.sql.*" %>

<!-- repeating set Header --> 
<%@ include file="setHeader.jsp" %> 
<%
  // check if the session is not empty or null
  if(session.getAttribute("bean") != null){
	  
  // retrieve Login Bean from session	  
  Login bean = (Login)session.getAttribute("bean");
  
  // check whether the Login and Password are not null or empty
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
<table width="300" cellspacing="1" cellpadding="1" border="0" align="center">
<tr>
<td colspan="3" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><b>Student Information</b></font></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<% 
           String sql = "";
           int id = Integer.parseInt(request.getParameter("id"));
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev?autoReconnect=true&useSSL=false","DBlogin","DBpassword");
           sql="SELECT * FROM registration WHERE recordID = ?";
           PreparedStatement statement = con.prepareStatement(sql);
           statement.setInt(1, id);
           ResultSet resultSet = statement.executeQuery();
           
           while(resultSet.next()){
%>
<tr>
<td width="100"><font face="Arial, Helvetica, sans-serif" size="2">Full Name</font></td>
<td width="10"><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("name")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">IC No</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("icno")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Address</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("address")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Country</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("country")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Phone</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("phone")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Email</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("email")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Matric No</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("matricno")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">CGPA</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getDouble("cgpa")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Major</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("major")%></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Mahallah</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><%=resultSet.getString("mahallah")%></font></td>
</tr>
<tr>
<td colspan="3" align="center"><br><br><a href="main.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a href="update.jsp?id=<%= id %>">Update</a>&nbsp;&nbsp;&nbsp;<a href="Deletion?id=<%= id %>">Delete</a></font></td>
</tr>
<% } %>
</table>
<br>

</center>
</font>
</body>
</html>
<%
// close the statement and database connection
statement.close();
con.close();


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
