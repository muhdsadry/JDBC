<!-- set the session to true -->
<%@ page session="true" %>

<!-- import Login Bean --> 
<%@ page import="student.Login" %>

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
<jsp:useBean id="studentBean" class="student.Student" scope="session" />
<html>
<head>
<title>Student Registration System</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<br>
<br>
<table width="400" cellspacing="1" cellpadding="1" border="0" align="center">
<tr>
<td colspan="3" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><b>Student Registration</b></font></td>
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
<td width="100"><font face="Arial, Helvetica, sans-serif" size="2">Full Name</font></td>
<td width="10"><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="fullName" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">IC No</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="icNo" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Address</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="address" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Country</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="country" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Phone</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="phone" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Email</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="email" /></font></td>
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
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="matricNo" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">CGPA</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="cgpa" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Major</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="major" /></font></td>
</tr>
<tr>
<td><font face="Arial, Helvetica, sans-serif" size="2">Mahallah</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
<td><font face="Arial, Helvetica, sans-serif" size="2"><jsp:getProperty name="studentBean" property="mahallah" /></font></td>
</tr>
<tr>
<td colspan="3" align="center"><br><font face="Arial, Helvetica, sans-serif" size="2"><a href="main.jsp">Home</a></font></td>
</tr>
</table>
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
