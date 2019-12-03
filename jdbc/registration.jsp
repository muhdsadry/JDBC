<%@ page session="true" %> <!-- set the session to true -->
<%@ page import="student.Login" %> <!-- import Login Bean -->
<%@ include file="setHeader.jsp" %> <!-- repeating set Header -->
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
<html>
<head>
<title>Student Registration System</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<br>
<form method="post" action="Registration">
<table width="400" cellspacing="1" cellpadding="1" border="0" align="center">
<tr>
<td colspan="3" align="center"><font face="Arial" size="2"><b>New Student Registration</b></font></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr bgcolor="#F4F6F7" height="25">
<td colspan="3" align="center"><font face="Arial, Helvetica, sans-serif" size="2">Personal Information</font></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Full Name</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><input type="text" name="fullname" size="30"></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">IC/Passport No</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><input type="text" name="icno" size="15"></td>
</tr>
<tr>
<td valign="top"><font face="Arial, Helvetica, sans-serif" size="2">Address</font></td>
<td valign="top"><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><textarea name="address" cols="19" rows="5"></textarea></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Country</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td>
<select name="country">
<option value="Malaysia">Malaysia</option>
<option value="Indonesia">Indonesia</option>
<option value="Afghanistan">Afghanistan</option>
<option value="Thailand">Thailand</option>
<option value="Bangladesh">Bangladesh</option>
</select>
</td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Phone</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><input type="text" name="phone" size="20"></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Email</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><input type="text" name="email" size="20"></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr bgcolor="#F4F6F7" height="25">
<td colspan="3" align="center"><font face="Arial, Helvetica, sans-serif" size="2">IIUM Information</font></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Matric No</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><input type="text" name="matricno" size="10"></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">CGPA</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><input type="text" name="cgpa" size="10"></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Major</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td>
<select name="major">
<option value="BIT">BIT</option>
<option value="BCS">BCS</option>
<option value="BBA">BBA</option>
<option value="BED">BED</option>
<option value="LLB">LLB</option>
<option value="BLA">BLA</option>
</select>
</td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Mahallah</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td>
<select name="mahallah">
<option value="Ali">Ali</option>
<option value="Bilal">Bilal</option>
<option value="Faruq">Faruq</option>
<option value="Salahuddin">Salahuddin</option>
<option value="Sidiq">Sidiq</option>
<option value="Uthman">Uthman</option>
<option value="Zubair">Zubair</option>
<option value="Aminah">Aminah</option>
<option value="Asiah">Asiah</option>
<option value="Asma">Asma</option>
<option value="Hafsah">Hafsah</option>
<option value="Nusaibah">Nusaibah</option>
<option value="Ruqayyah">Ruqayyah</option>
<option value="Safiyyah">Safiyyah</option>
<option value="Sumayyah">Sumayyah</option>
</select>
</td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><input type="submit" value="Submit"></td>
</tr>
<tr>
<td colspan="3" align="center"><br><font face="Arial, Helvetica, sans-serif" size="2"><a href="main.jsp">Home</a></font></td>
</tr>
</table>
</form>
<center>
<font face="Arial, Helvetica, sans-serif" size="2" color="red">
<% if(request.getParameter("error")!= null && request.getParameter("error") == "database"){ %>  
Database Error!
<% } %>  
</font>
</center>
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