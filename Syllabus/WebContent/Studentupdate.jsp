<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String user= (String)session.getAttribute("user"); 
		String   sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String   Fname = request.getParameter("Fname");
		String   Lname = request.getParameter("Lname");
		String   Username = request.getParameter("Username");
		String   Email = request.getParameter("Email");
		String   Password = request.getParameter("Password");
		String   Address = request.getParameter("Address");
		String   Mobilenumber = request.getParameter("Mobilenumber");
		String   Course = request.getParameter("Course");
		String   Sem = request.getParameter("Sem");
    
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
        <li ><a href="Userhome.jsp">Home</a></li>
        <li ><a href="adminStaffhome.jsp">Add syllabus</a></li>
        <li><a href="StudentLogin.html">Logout</a></li>
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
      
      	<div class="container">
  
  <table class="table table-striped">
    <thead>
      <tr>
        
        <th>ID</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Username</th>
        <th>Email</th>
        <th>Adress</th>
        <th>Mobile No</th>
        <th>Course</th>
          <th>Sem</th>
      </tr>
    </thead>
    <tbody>
    <%
	
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/syllabus", "root",
					"root");
			String sql="Update student_reg set Fname=?, Lname=?, Username=?, Email=?, Password=?, Address=?, Mobilenumber=?, Course=?, Sem=? where Id=?";
        	PreparedStatement stmt = con.prepareStatement(sql);
        	stmt.setString(1,Fname);
        	stmt.setString(2,Lname);
        	stmt.setString(3,Username);
        	stmt.setString(4,Email);
        	stmt.setString(5,Password);
        	stmt.setString(6,Address);
        	stmt.setString(7,Mobilenumber);
        	stmt.setString(8,Course);
        	stmt.setString(9,Sem);
        	stmt.setInt(10, id);
        	
		
        	
        	int i=stmt.executeUpdate();
			if(i>0) {
				System.out.println("Studentupadated  Successfully...!!!");
				session.setAttribute("user", Username);
				response.sendRedirect("adminStudenthome.jsp");
			} else {
				System.out.println("Studentupadated Failed...!!!");
				response.sendRedirect("Studentedit.jsp");
			} 
	
			
			 
	%>
        	
	<%
		
		} catch (Exception e) {
			System.out.print("Exception:" + e);
		}
	%>
      
    </tbody>
  </table>
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