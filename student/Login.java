package student;

import java.sql.*;
import java.math.BigInteger;
import java.security.*;

public class Login {
	private String login;
	private String password;  
	  
	public String getLogin() {  
	    return login;  
	}
	
	public void setLogin(String login) {  
	    this.login = login;  
	}
	
	public String getPassword() {  
	    return password;  
	}
	
	public void setPassword(String password) {  
	    this.password = password;  
	}
	
	public boolean isValid(){  
		try {
		   //convert the given password to hex format to match with database (encryption)
		   MessageDigest strtohex = MessageDigest.getInstance("SHA-1");
		   strtohex.update(getPassword().getBytes("UTF-8"));
		   String hexpassword =  new BigInteger(1 , strtohex.digest()).toString(16);
		   
		   //setup database connection
           String sql = "";
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev?autoReconnect=true&useSSL=false","DBlogin","DBpassword");
           sql="SELECT login, password FROM user";
           Statement statement = con.createStatement();                
           ResultSet resultSet = statement.executeQuery(sql);
           
           //display each record in the table
           while (resultSet.next()){
        	   //retrieve data from the column login and password in the table
        	 String login = resultSet.getString("login");
        	 String password = resultSet.getString("password");
        	 
        	  // if the given login and password are matched with the database
        	  if(getLogin().equals(login) && hexpassword.equals(password)){
        		// close the statement and database connection
                  statement.close();
                  con.close();
        		 return true;
        	  }
        	
           }
           
        }
        catch(Exception ex){ 
        	return false;
        } finally{
        	
        }
		   
	   return false;     
	}  
}
