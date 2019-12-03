package student;
import java.sql.*;

public class Student {
	 private String matricNo;
	 private String fullName;
	 private String icNo;
	 private double cgpa;
	 private String major;
	 private String email;
	 private String phone;
	 private String address;
	 private String country;
	 private String mahallah;

	public Student(){
	 matricNo = "0";
	 fullName = "unknown";
	 icNo = "0";
	 cgpa = 0.0;
	 major = "unknown";
	 email = "unknown";
	 phone = "0";
	 address = "unknown";
	 country = "unknown";
	 mahallah = "unknown";
	}

	// MatricNo
	public void setMatricNo(String matricNo){
	String str = new Long(matricNo).toString();
	  if(str.length() == 7){
	    this.matricNo = matricNo;
	  }
	} 

	public String getMatricNo(){
	  return matricNo;
	}

	// Full Name
	public void setFullName(String fullname){
	  this.fullName = fullname;
	}

	public String getFullName(){
	 return fullName;
	}

	// ICNo
	public void setIcNo(String icNo){
	 if(icNo.length() <= 12){
	   this.icNo = icNo;
	 }
	}

	public String getIcNo(){
	 return icNo;
	}

	// CGPA
	public void setCgpa(double cgpa){
	  this.cgpa = cgpa;
	}

	public double getCgpa(){
	 return cgpa;
	}

	// Major
	public void setMajor(String major){
	 this.major = major;
	}

	public String getMajor(){
	 return major;
	}

	// Email
	public void setEmail(String email){
	int count = 0; 
	char temp[] = email.toCharArray();

	 for(int i = 0; i < temp.length; i++){
	  if(temp[i] == '@'){
	    count++;
	 }
	}

	if(count == 1){
	 this.email = email;
	}
	else{
	 email = "Not Set";
	}

	}

	public String getEmail(){
	 return email;
	}

	// Phone
	public void setPhone(String phone){
	 this.phone = phone;
	}

	public String getPhone(){
	 return phone;
	}

	// Address
	public void setAddress(String address){
	 this.address = address;
	}

	public String getAddress(){
	 return address;
	}

	// Country
	public void setCountry(String country){
	 this.country = country;
	}

	public String getCountry(){
	 return country;
	}

	// Mahallah
	public void setMahallah(String mahallah){
	 this.mahallah = mahallah;
	}

	public String getMahallah(){
	 return mahallah;
	}
	
	public boolean storeData(){
		 try
	        {
	           String sql = "";
	           Class.forName("com.mysql.jdbc.Driver");
	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev?autoReconnect=true&useSSL=false","DBlogin","DBpassword");
	           sql="INSERT INTO registration (name, icno, address, country, phone, email, matricno, cgpa, major, mahallah) VALUES (?,?,?,?,?,?,?,?,?,?)";
	           PreparedStatement statement = con.prepareStatement(sql);                
	           statement.setString(1, getFullName());
	           statement.setString(2, getIcNo());
	           statement.setString(3, getAddress());
	           statement.setString(4, getCountry());
	           statement.setString(5, getPhone());
	           statement.setString(6, getEmail());
	           statement.setString(7, getMatricNo());
	           statement.setDouble(8, getCgpa());
	           statement.setString(9, getMajor());
	           statement.setString(10, getMahallah());
	           statement.executeUpdate();
	           statement.close();
	           con.close();
	           return true;    
	        }
	        catch(Exception ex)
	        {
	        	return false;
	        }   
	}
	
	public boolean deleteData(int id){
		 try
	        {
	           String sql = "";
	           Class.forName("com.mysql.jdbc.Driver");
	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev?autoReconnect=true&useSSL=false","DBlogin","DBpassword");
	           sql="DELETE FROM registration WHERE recordID = ?";
	           PreparedStatement statement = con.prepareStatement(sql);                
	           statement.setInt(1, id);
	           statement.executeUpdate();
	           statement.close();
	           con.close();
	           return true;    
	        }
	        catch(Exception ex)
	        {
	        	return false;
	        }   
	}
	
	public boolean updateData(int id){
		 try
	        {
	           String sql = "";
	           Class.forName("com.mysql.jdbc.Driver");
	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev?autoReconnect=true&useSSL=false","DBlogin","DBpassword");
	           sql="UPDATE registration SET name = ?, icno = ?, address = ?, country = ?, phone = ?, email = ?, matricno = ?, cgpa = ?, major = ?, mahallah = ? WHERE recordID = ?";
	           PreparedStatement statement = con.prepareStatement(sql);                
	           statement.setString(1, getFullName());
	           statement.setString(2, getIcNo());
	           statement.setString(3, getAddress());
	           statement.setString(4, getCountry());
	           statement.setString(5, getPhone());
	           statement.setString(6, getEmail());
	           statement.setString(7, getMatricNo());
	           statement.setDouble(8, getCgpa());
	           statement.setString(9, getMajor());
	           statement.setString(10, getMahallah());
	           statement.setInt(11, id);
	           statement.executeUpdate();
	           statement.close();
	           con.close();
	           return true;    
	        }
	        catch(Exception ex)
	        {
	        	return false;
	        }   
	}
}
