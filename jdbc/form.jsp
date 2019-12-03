<!-- set the session to true -->
<%@ page session="true" %>

<!-- repeating set Header --> 
<%@ include file="setHeader.jsp" %>

<!-- remove and destroy any contents in session -->
<%
session.removeAttribute("bean");
session.invalidate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration System</title>
</head>
<body>
<br>
<br>
<font face="arial" size="2">
<form method="post" action="Validation">
<table align="center" border="0" width="230">
<tr>
<td colspan="3" align="center"><strong>Student Registration System</strong><br><br></td>
</tr>
<tr>
<td>Login</td>
<td>:</td>
<td><input type="text" name="login" size="20"></td>
</tr>
<tr>
<td>Password</td>
<td>:</td>
<td><input type="password" name="password" size="20"></td>
</tr>
<tr>
<td colspan="3">&nbsp;</td>
</tr>
<tr>
<td colspan="2">&nbsp;</td>
<td align="center"><input type="submit" value="Enter">&nbsp;&nbsp;<input type="reset" value="Clear"></td>
</tr>
<tr>
<td align="center" colspan="3">
<br>
<font color="red">

<!-- Unauthorized User -->
<%
String error = request.getParameter("error");
if(error != null && error.equals("1")){
%>
Invalid Login and Password!

<!-- both login and password are empty. -->
<%
}
else if(error != null && error.equals("2")){
%>
Empty Login and Password!
<%
}
%>
</font>
</td>
</tr>
</table>
</font>
</form>
</body>
</html>