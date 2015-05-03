<%-- 
    Document   : show_problem
    Created on : 7 Apr, 2015, 1:38:14 PM
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
        <title>${param.problem_name}</title>


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


        <div class="header_bg1" id="styleBody">
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
                        
                        <form>
                            <input type="text" class="text" value="Enter text here" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Enter text here';
                                    }">
                            <input type="submit" value="search">
                        </form>
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
                                <li><a href="contest_problem.jsp">Compete</a></li>
                                <li><a href="#">Practice</a></li>
                                <li><a href="about.html">About</a></li>
                                <li><a href="current_rank.jsp">Ranking</a></li>
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

        <s:query dataSource="${resultset}" var="result" >select content  from contest_problems where problem_id = '${param.problemid}'</s:query>
        <c:forEach var="data" items = "${result.rows}" >
            <center>  <textarea readonly rows="40" cols="100"> ${data.content}</textarea> </center>

        </c:forEach>

            <form method="POST" action="code_eval" name="submit_form">

            <input type="hidden" value="${param.problemid}" name="problem_id">

            <center> 
                <br>
                <br>
                Language: <select name="language" onchange="changeSyntax()">
                    <option>Java</option>
                    <option>C</option>
                    <option>C++</option>
                    <option>Python</option>
                </select>
                <br>
                <br>
            </center>
            
            <b style="padding-left: 10px">NOTE: If using java, class name must be Solution</b>
            <br>
            <br>
                Solution: <textarea rows="40" cols="100" name="solution_content"
                                id="text" ></textarea>
            <br>
            
            
            <center>     
                <input type="submit" value="Submit Solution" > <input type="reset" value="Clear"> 
            </center>
        </form>
        
    

    <link rel="stylesheet" href="codemirror/lib/codemirror.css">
    <script src="codemirror/lib/codemirror.js"></script>
    <script src="codemirror/lib/closebrackets.js"></script>
    <script src="codemirror/lib/matchbrackets.js"></script>
    <script src="codemirror/mode/clike/clike.js"></script>
    <script src="codemirror/mode/python/python.js"></script>
    <script>
                                var editor = CodeMirror.fromTextArea(document.getElementById("text"), {
                                    lineNumbers: true,
                                    matchBrackets: true,
                                    indentUnit: 4,
                                    autoCloseBrackets: true,
                                    mode:  "text/x-java"
                                });
                                
        function changeSyntax(){
            var lang = document.submit_form.language.value;
            if(lang == "C"){
                editor.setOption("mode", "text/x-csrc");
            }
            else if(lang == "C++"){
                editor.setOption("mode", "text/x-c++src");
            }
            else if(lang == "Java"){
                editor.setOption("mode", "text/x-java");
            }
            else if(lang == "Python"){
                editor.setOption("mode", "text/x-python");
            }
            
        }
        
       
        </script>

</body>
</html>



