<%-- 
    Document   : contest_problem
    Created on : 7 Apr, 2015, 1:38:41 PM
    Author     : akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <s:setDataSource var="resultset" driver="com.mysql.jdbc.Driver"
                 url="jdbc:mysql://localhost:3306/codeJudge" user="root"
                 password="1234class"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contest</title>
        
        
        <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
       <![endif]-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/login_register.css" rel="stylesheet" type="text/css"/>
        <!-- start plugins -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!----font-Awesome----->
        <link rel="stylesheet" href="fonts/css/font-awesome.min.css">
        <!----font-Awesome----->
        
        
    </head>
    <body>
        
        
         <div class="header_bg1">
            <div class="container">
                <div class="row header">
                    <div class="logo navbar-left">
                        <h1><a href="index.html">Learner </a></h1>
                    </div>
                    <div class="h_search navbar-right">
                        <% if (session.getAttribute("uname") == null) 
                        { %>
                        <a href="login.html" style="font-size: 15px; color: black; padding: 10px;text-align: right">Login/Register</a> 
                        <% }
                        else {%> <% String name=(String)session.getAttribute("uname"); out.print("<div style=\"font-size: 15px; color: black;\">Welcome "+name+" </div> ");out.print("<a style=\"font-size: 15px; \" href=" + "logout.jsp"  + ">Logout   </a>");out.print("<a style=\"font-size: 15px; \" href ="+ "account.jsp"+">Account</a>");} %></h4>
                        
                        
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row h_menu">
                    <nav class="navbar navbar-default navbar-left" role="navigation">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li><a href="index1.jsp">Home</a></li>
                                <li class="active"><a href="contest_problem.jsp">Compete</a></li>
                                <li><a href="contest_problem.jsp">Practice</a></li>
                                <li><a href="current_rank.jsp">Ranking</a></li>
                                <li><a href="about.html">About Us</a></li>
                                
                            </ul>
                        </div><!-- /.navbar-collapse -->
                        <!-- start soc_icons -->
                    </nav>

                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        
        <br>
        <br>
        <br>
        
        <s:query dataSource="${resultset}" var="result" >select * from contest_problems</s:query>
         <center>
             <iframe src="timer.jsp" height="100px" width="250px"></iframe>
            <table border="5" style="width:75%" >
                <tr>
                    <th>Problem ID</th>
                    <th>Name</th>
                    <th>Time limit</th>
                  
                
                </tr>
                <c:forEach var="data" items = "${result.rows}" >
                    <tr> <td>${data.problem_id}</td>
                        <td><a style="text-decoration:none;"  href="show_problem.jsp?problemid=${data.problem_id}&problem_name=${data.name}" >${data.name}</a></td>
                        <td>${data.time_limit}</td>

                    </tr>

                </c:forEach>

         </table></center>
         
         
        
    </body>
</html>
