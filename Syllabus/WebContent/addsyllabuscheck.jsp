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
		String Sem = request.getParameter("Sem");
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/syllabus", "root",
					"root");
			System.out.println("Db Connected...!!!");
			String sql = "select * from addsyllabus where DepartmentName='"
					+ DepartmentName + "' and Sem='" + Sem + "'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				System.out.println("Syllabus Added  Successfully...!!!");
				session.setAttribute("name", DepartmentName);
				response.sendRedirect("addsyllabushome.jsp");
			} else {
				System.out.println("Syllabus added  Failed...!!!");
	%>
	Registration Failed...
	<a href="Addsyllabus.html"> click here to Back</a>
	<%
		}
		} catch (Exception e) {
			System.out.print("Exception:" + e);
		}
	%>
</body>
</html>