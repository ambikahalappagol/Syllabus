<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String user= (String)session.getAttribute("user"); %>
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
<nav class="navbar navbar-inverse fixed-nav-bar" >
  <div class="container-fluid" >
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Syllabus</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#">Home</a></li>
        <li ><a href="Adminlogin.html">AdminLogin</a></li>
        <li class="active"><a href="StudentLogin.html">Student Login</a></li>
        <li><a href="Userlogin.html"> Staff Login</a></li>
         
       <!--  <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li> -->
      </ul>
      <!-- <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul> -->
    </div>
  </div>
</nav>
  <hr>
<div class="container-fluid text-center">
<div class="jumbotron">        
  <div class="row content">
    <div class="col-sm-2 ">
      <!-- <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p> -->
    </div>
    <div class="col-sm-8 text-left"> 
      <h2 align="center">Add Student </h2> <br>
  <form class="form-horizontal" action="Staffupdate.jsp">
   <div class="form-group">
       <%  
  String sid = request.getParameter("id");
    int id = Integer.parseInt(sid);
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/syllabus", "root",
					"root");
			System.out.println("Db Connected...!!!");
			String sql = "select * from Staff_reg where Id="+ id;
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
			session.setAttribute("id", rs.getInt("Id"));	
			 
	%>
	<label class="control-label col-sm-4" for="Id"></label>
      <div class="col-sm-8">
        <input type="hidden" class="form-control" id="id" placeholder="Enter id" value="<%=rs.getInt(1)%>" name="id" required>
      </div>
    </div>
	    <div class="form-group">
    <label class="control-label col-sm-4" for="Fname">Fname:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="Fname" placeholder="Enter FName" value="<%=rs.getString(2) %>" name="Fname" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="Lname">Lname:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="Lname" placeholder="Enter Lname" value="<%=rs.getString(3) %>" name="Lname" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="username">Username:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="username" placeholder="Username" value="<%=rs.getString(4) %>" name="Username" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="email">Email:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="email" placeholder="DOB email" value="<%=rs.getString(5) %>" name="Email" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="Password">Password:</label>
      <div class="col-sm-8">
        <input type="password" class="form-control" id="password" placeholder="Enter Password" value="<%=rs.getString(6) %>" name="Password" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="address">Address :</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="Address " placeholder="Enter Address " value="<%=rs.getString(7) %>" name="Address" required>
      </div>
     </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="mobile">Mobile No:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="mobile" placeholder="Enter Mobile" value="<%=rs.getString(8) %>" name="Mobilenumber" required>
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-4" for="Branch"> Branch :</label>
      <div class="col-sm-8">
        <select class="form-control" value="<%=rs.getString(9) %>" name="Branch">
        <option value="CSE">CSE </option>
        <option value="ECE">ECE </option>
        <option value="MECH">MECH</option>
        <option value="EEE">EEE</option>
        <option value="IT">IT</option>
        <option value="CE">CE </option>
	  </select>
      </div>
    </div> 
   
    <div class="form-group">        
      <div class="col-sm-offset-4 col-sm-10">
        <button type="submit" class="btn btn-primary">Submit</button>
         <button type="submit" class="btn btn-default">Cancel</button>
        
      </div>
     </div>
  </form>
  <%
		}
		} catch (Exception e) {
			System.out.print("Exception:" + e);
		}
	%>
      
    </tbody>
  
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