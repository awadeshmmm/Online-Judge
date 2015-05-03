<%-- 
    Document   : account
    Created on : 12 Apr, 2015, 2:40:53 PM
    Author     : akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account</title>
        
         <!-- Bootstrap -->
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
                                <li><a href="about.html">About</a></li>
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
        
    <center>   <iframe src="account_details" width="100%" height="300">
        
        </iframe>
    </center>
    </body>
</html>
