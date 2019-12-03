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
<form method="post" action="Registration">
<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
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
<td><font face="Arial, Helvetica, sans-serif" size="2"><input type="text" name="fullname" size="30" value="<%=resultSet.getString("name")%>"></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">IC No</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><input type="text" name="icno" size="15" value="<%=resultSet.getString("icno")%>"></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Address</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><textarea name="address" cols="19" rows="5"><%=resultSet.getString("address")%></textarea></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Country</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">
<select name="country">
<option value="Malaysia" <% if (resultSet.getString("country").equals("Malaysia")){%>selected<% } %>>Malaysia</option>
<option value="Indonesia" <% if (resultSet.getString("country").equals("Indonesia")){%>selected<% } %>>Indonesia</option>
<option value="Afghanistan" <% if (resultSet.getString("country").equals("Afghanistan")){%>selected<% } %>>Afghanistan</option>
<option value="Thailand" <% if (resultSet.getString("country").equals("Thailand")){%>selected<% } %>>Thailand</option>
<option value="Bangladesh" <% if (resultSet.getString("country").equals("Bangladesh")){%>selected<% } %>>Bangladesh</option>
</select>
</font>
</td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Phone</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><input type="text" name="phone" size="20" value="<%=resultSet.getString("phone")%>"></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Email</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><input type="text" name="email" size="20" value="<%=resultSet.getString("email")%>"></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Matric No</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><input type="text" name="matricno" size="10" value="<%=resultSet.getString("matricno")%>"></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">CGPA</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><input type="text" name="cgpa" size="10" value="<%=resultSet.getDouble("cgpa")%>"></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Major</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">
<select name="major">
<option value="BIT" <% if(resultSet.getString("major").equals("BIT")){%>selected<% } %>>BIT</option>
<option value="BCS" <% if(resultSet.getString("major").equals("BCS")){%>selected<% } %>>BCS</option>
<option value="BBA" <% if(resultSet.getString("major").equals("BBA")){%>selected<% } %>>BBA</option>
<option value="BED" <% if(resultSet.getString("major").equals("BED")){%>selected<% } %>>BED</option>
<option value="LLB" <% if(resultSet.getString("major").equals("LLB")){%>selected<% } %>>LLB</option>
<option value="BLA" <% if(resultSet.getString("major").equals("BLA")){%>selected<% } %>>BLA</option>
</select>
</font>
</td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Mahallah</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">
<select name="mahallah">
<option value="Ali" <% if(resultSet.getString("mahallah").equals("Ali")){ %>selected<% } %>>Ali</option>
<option value="Bilal" <% if(resultSet.getString("mahallah").equals("Bilal")){ %>selected<% } %>>Bilal</option>
<option value="Faruq" <% if(resultSet.getString("mahallah").equals("Faruq")){ %>selected<% } %>>Faruq</option>
<option value="Salahuddin" <% if(resultSet.getString("mahallah").equals("Salahuddin")){ %>selected<% } %>>Salahuddin</option>
<option value="Sidiq" <% if(resultSet.getString("mahallah").equals("Sidiq")){ %>selected<% } %>>Sidiq</option>
<option value="Uthman" <% if(resultSet.getString("mahallah").equals("Uthman")){ %>selected<% } %>>Uthman</option>
<option value="Zubair" <% if(resultSet.getString("mahallah").equals("Zubair")){ %>selected<% } %>>Zubair</option>
<option value="Aminah" <% if(resultSet.getString("mahallah").equals("Aminah")){ %>selected<% } %>>Aminah</option>
<option value="Asiah" <% if(resultSet.getString("mahallah").equals("Asiah")){ %>selected<% } %>>Asiah</option>
<option value="Asma" <% if(resultSet.getString("mahallah").equals("Asma")){ %>selected<% } %>>Asma</option>
<option value="Hafsah" <% if(resultSet.getString("mahallah").equals("Hafsah")){ %>selected<% } %>>Hafsah</option>
<option value="Nusaibah" <% if(resultSet.getString("mahallah").equals("Nusaibah")){ %>selected<% } %>>Nusaibah</option>
<option value="Ruqayyah" <% if(resultSet.getString("mahallah").equals("Ruqayyah")){ %>selected<% } %>>Ruqayyah</option>
<option value="Safiyyah" <% if(resultSet.getString("mahallah").equals("Safiyyah")){ %>selected<% } %>>Safiyyah</option>
<option value="Sumayyah" <% if(resultSet.getString("mahallah").equals("Sumayyah")){ %>selected<% } %>>Sumayyah</option>
</select>
</font>
</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><input type="submit" value="Submit"></td>
</tr>
<tr>
<td colspan="3" align="center"><br><br><a href="main.jsp">Home</a></font></td>
</tr>
<% } %>
</table>
<br>
</form>
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
