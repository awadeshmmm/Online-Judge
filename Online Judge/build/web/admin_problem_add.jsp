<%-- 
    Document   : admin_problem_add
    Created on : 7 Apr, 2015, 1:46:48 PM
    Author     : akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Problem</title>

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
    <body bgcolor="#6666FF">


        <div class="header_bg1">
            <div class="container">
                <div class="row header">
                    <div class="logo navbar-left">
                        <h1><a href="index.html">Learner </a></h1>
                    </div>
                    <div class="h_search navbar-right">
                       
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
                                <li ><a href="contest_problem.jsp">Compete</a></li>
                                <li><a href="contest_problem.jsp">Practice</a></li>
                                <li><a href="current_rank.jsp">Ranking</a></li>
                                <li><a href="about.html">About Us</a></li>
                                <li class="active"><a href="admin_problem_add.jsp">Add Problems</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                        <!-- start soc_icons -->
                    </nav>

                </div>
                <div class="clearfix"></div>
            </div>
        </div>


        <br>
        <center>
        <h1><b>Submit your problem's detail</b></h1>
        </center> <br><br><br>
        <form action="add_problem.jsp" method="post" name="add_problem_form">
            <center> 
                Problem Name: <input type="text" name="name" required> <br> <br>


                Time limit:   <input type="text" name="time_limit" required> <br><br>


                Points :      <input type="text" name="points" required> <br><br>


                <textarea name="content" rows="40" cols="100" required>
            Problem content goes here:
                </textarea> <br><br>

                <textarea name="input" rows="10" cols="100">
    Input test cases goes here:
                </textarea><br><br>

                <textarea name="output" rows="10" cols="100" required>
                Output goes here:
                </textarea><br><br>
                
                <p id="errorMsg" style="color: red"></p> 
                
                <br><br>
                <input type="submit" value="Submit Details" onclick="return validateFields()">   <input type="reset" value="Reset">

            </center> 
        </form>
        
    </body>

    <script>
    
    function validateFields(){
        var time_limit = document.add_problem_form.time_limit.value;
        var points = document.add_problem_form.points.value;
        
        if(isNaN(time_limit) || time_limit == ""){
            document.getElementById("errorMsg").innerHTML = "Invalid time limit. Should be a number";
            return false;
        }
        else{
            if(time_limit <= 0){
                document.getElementById("errorMsg").innerHTML = " Time limit should be positive";
                return false;
            }
        }
        
        if(isNaN(points) || points == ""){
            document.getElementById("errorMsg").innerHTML = "Invalid Points. Should be a number";
            return false;
        }
        else{
            if(time_limit <= 0){
                document.getElementById("errorMsg").innerHTML = " Points should be positive";
                return false;
            }
        }
        return true;
    }

    </script>
</html>

