<%-- <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<% int i=(String)session.getAttribute(user);
String user= (String)session.getAttribute("user"); 
System.out.println("Status:" +i);
if(i>0){
	response.sendRedirect("Addsyllabus.html");
	
}
else{

	response.sendRedirect("addsyllabusedit.jsp");
}
		
%> --%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String user= (String)session.getAttribute("user"); 
		String   Did = request.getParameter("DId");
		
		int id = Integer.parseInt(Did);
	
		String   DepartmentName = request.getParameter("DepartmentName");
		String   Sem = request.getParameter("Sem");
		String   Subject = request.getParameter("Subject");
		String   Syllabuscontent = request.getParameter("Syllabuscontent");
%>

<head>
  <title>Syllabus</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
       
        <li ><a href="addsyllabushome.jsp">Add syllabus</a></li>
        <li><a href="AdminLogin.html">Logout</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-1 ">
      
    </div>
    <div class="col-sm-10 text-left"> 
      <h1>admineStaffhome</h1>
      	<div class="container">
  <form action="Addsyllabus.html method="post">
  <table class="table table-striped">
    <thead>
      <tr>
        
        <th>DId</th>
        <th>DepartmentName</th>
        <th>Sem</th>
        <th>Subject</th>
        <th>Syllabuscontent</th>
       
        
      </tr>
    </thead>
    <tbody>
    <%
	
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/syllabus", "root",
					"root");
			String sql="Update addsyllabus set DepartmentName=?, Sem=?, Subject=?, Syllabuscontent=? where DId=?";
        	PreparedStatement stmt = con.prepareStatement(sql);
        	stmt.setString(1,DepartmentName);
        	stmt.setString(2,Sem);
        	stmt.setString(3,Subject);
        	stmt.setString(4,Syllabuscontent);
        	stmt.setInt(5, id);
        	
		
        	int i=stmt.executeUpdate();
			if(i>0) {
				System.out.println("Addsyllabusupadated  Successfully...!!!");
				response.sendRedirect("addsyllabushome.jsp");
			} else {
				System.out.println("Addsyllabusupadated Failed...!!!");
				response.sendRedirect("addsyllabusedit.jsp");
			} 
	
			
			 
	%>
        	
	<%
		
		} catch (Exception e) {
			System.out.print("Exception:" + e);
		}
	%>
      
    </tbody>
  </table>
  </form>
</div>
    </div>
    <div class="col-sm-1">
      
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>