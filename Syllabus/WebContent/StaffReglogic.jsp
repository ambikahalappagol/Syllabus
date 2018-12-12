<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String Fname = request.getParameter("Fname");
		String Lname = request.getParameter("Lname");
		String Username = request.getParameter("Username");
		String Email = request.getParameter("Email");
		String Password = request.getParameter("Password");
		String Address = request.getParameter("Address");
		String Mobilenumber = request.getParameter("Mobilenumber");
		String Branch = request.getParameter("Branch");
	
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/syllabus", "root",
					"root");
			System.out.println("Db Connected...!!!");
			String sql="insert into staff_reg (Fname,Lname,Username,Email,Password,Address,Mobilenumber,Branch) values (?,?,?,?,?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1,Fname);
			stmt.setString(2,Lname);
			stmt.setString(3,Username);
			stmt.setString(4,Email);
			stmt.setString(5,Password);
			stmt.setString(6,Address);
			stmt.setString(7,Mobilenumber);
			stmt.setString(8,Branch);
			int i=stmt.executeUpdate();
			
			
			if(i>0) {
				System.out.println("Stafflogined  Successfully...!!!");
				session.setAttribute("user", Username);
				response.sendRedirect("Userlogin.html");
			} else {
				System.out.println("Stafflogin Failed...!!!");
	%>
	Registration Failed...
	<a href="StaffReg.html"> click here to Back</a>
	<%
			}
		}
		catch (Exception e) {
			System.out.print("Exception:" + e);
		}
	%>
</body>
</html>