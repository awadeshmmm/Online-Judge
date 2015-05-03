<%-- 
    Document   : index1
    Created on : 12 Apr, 2015, 10:36:06 AM
    Author     : akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Code Judge | Home</title>
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
        <!-- start plugins -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- start slider -->
        <link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
        <script type="text/javascript" src="js/jquery.cslider.js"></script>
        <script type="text/javascript">
            $(function () {

                $('#da-slider').cslider({
                    autoplay: true,
                    bgincrement: 450
                });

            });
        </script>
        <!-- Owl Carousel Assets -->
        <link href="css/owl.carousel.css" rel="stylesheet">
        <script src="js/owl.carousel.js"></script>
        <script>
            $(document).ready(function () {

                $("#owl-demo").owlCarousel({
                    items: 4,
                    lazyLoad: true,
                    autoPlay: true,
                    navigation: true,
                    navigationText: ["", ""],
                    rewindNav: false,
                    scrollPerPage: false,
                    pagination: false,
                    paginationNumbers: false,
                });

            });
        </script>
        <!-- //Owl Carousel Assets -->
        <!----font-Awesome----->
        <link rel="stylesheet" href="fonts/css/font-awesome.min.css">
        <!----font-Awesome----->
    </head>
    <body>
        
        <div class="header_bg">
            <div class="container">
                <div class="row header">
                    <div class="logo navbar-left">
                        <h1><a href="index.html">Code Judge </a></h1>
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
            </div>
        </div>

        <div class="container">
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
                            <li class="active"><a href="index1.jsp">Home</a></li>
                            <li><a href="contest_problem.jsp">Compete</a></li>
                            <li><a href="contest_problem.jsp">Practice</a></li>
                            <li><a href="current_rank.jsp">Ranking</a></li>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="#">Language Learner</a></li>
                            <% if(session.getAttribute("uname")!= null && session.getAttribute("uname").equals("admin")){
                                out.print("<li><a href=\"admin_problem_add.jsp\">Add Problems</a></li>");
                            }%>
                            
                           
                        </ul>
                        
                        
                    </div><!-- /.navbar-collapse -->
                    <!-- start soc_icons -->
                </nav>

            </div>
        </div>
        <div class="slider_bg"><!-- start slider -->
            <div class="container" >
                <div id="da-slider" class="da-slider text-center">
                    <div class="da-slide">
                        <h2 style="color: white">Compete</h2>
                        <p style="color: white">Compete in various contests with other students and show your coding skills.</span></p>
                        <h3 class="da-link"><a href="contest_problem.jsp" class="fa-btn btn-1 btn-1e">Go</a></h3>
                    </div>
                    <div class="da-slide">
                        <h2 style="color: white">Practice</h2>
                        <p style="color: white">Code. Code. Code. Practice makes a man perfect.</span></p>
                        <h3 class="da-link"><a href="contest_problem.jsp" class="fa-btn btn-1 btn-1e">Go</a></h3>
                    </div>
                    <div class="da-slide">
                        <h2 style="color: white">Ranking</h2>
                        <p style="color: white">Check where do you stand with respect to other students.</span></p>
                        <h3 class="da-link"><a href="current_rank.jsp" class="fa-btn btn-1 btn-1e">Go</a></h3>
                    </div>
                    <div class="da-slide">
                        <h2 style="color: white">About Us</h2>
                        <p style="color: white"></span></p>
                        <h3 class="da-link"><a href="about.html" class="fa-btn btn-1 btn-1e">Go</a></h3>
                    </div>
                </div>
            </div>
        </div><!-- end slider -->
        <div class="main_bg"><!-- start main -->
            <div class="container">
                <div class="main row">
                    <div class="col-md-3 images_1_of_4 text-center">
                        <span class="bg"><i class="fa fa-globe"></i></span>
                        <h4>Compete</h4>
                        <p class="para">Compete in various contests and show your coding skills.</p>
                        <a href="contest_problem.jsp" class="fa-btn btn-1 btn-1e">Go</a>
                    </div>
                    <div class="col-md-3 images_1_of_4 bg1 text-center">
                        <span class="bg"><i class="fa fa-laptop"></i></span>
                        <h4>Practice</h4>
                        <p class="para">Code. Code. Code. Practice makes a man perfect. </p>
                        <a href="contest_problem.jsp" class="fa-btn btn-1 btn-1e">Go</a>
                    </div>
                    <div class="col-md-3 images_1_of_4 bg1 text-center">
                        <span class="bg"><i class="fa fa-cog"></i></span>
                        <h4>Ranking</h4>
                        <p class="para">Check where do you stand with respect to other students.</p>
                        <a href="current_rank.jsp" class="fa-btn btn-1 btn-1e">Go</a>
                    </div>		
                    <div class="col-md-3 images_1_of_4 bg1 text-center">
                        <span class="bg"><i class="fa fa-shield"></i> </span>
                        
                        <h4>Login/Register</h4>
                        <p class="para">Login into your Code Judge account and get started in the world of coding.</p>
                        <a href="login.html" class="fa-btn btn-1 btn-1e">Go</a>
                    </div>	
                </div>
            </div>
        </div><!-- end main -->

        <div class="footer_bg"><!-- start footer -->
            <div class="container">
                <div class="row  footer">
                    <div class="copy text-center">
                        <p class="link"><span>&#169; All rights reserved</span></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

