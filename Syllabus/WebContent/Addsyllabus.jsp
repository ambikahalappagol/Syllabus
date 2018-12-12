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
		String DepartmentName = request.getParameter("DepartmentName");
		String Sem = request.getParameter("sem");
		String Subject = request.getParameter("Subject");
		String Syllabuscontent = request.getParameter("Syllabuscontent");
		
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/syllabus", "root",
					"root");
			System.out.println("Db Connected...!!!");
			String sql="insert into addsyllabus (DepartmentName,Sem,Subject,Syllabuscontent) values (?,?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1,DepartmentName);
			stmt.setString(2,Sem);
			stmt.setString(3,Subject);
			stmt.setString(4,Syllabuscontent);
			int i=stmt.executeUpdate();
			if(i>0) {
				System.out.println("Syllabus added Successfully...!!!");
				session.setAttribute("department", DepartmentName);
				response.sendRedirect("addsyllabushome.jsp");
			} else {
				System.out.println("Studentlogin Failed...!!!");
	%>
	Registration Failed...
	<a href="addsyllabus.html"> click here to Back</a>
	<%
			}
		}
		catch (Exception e) {
			System.out.print("Exception:" + e);
		}
	%>
</body>
</html>