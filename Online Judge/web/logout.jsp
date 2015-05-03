<%-- 
    Document   : logout
    Created on : 12 Apr, 2015, 11:48:48 AM
    Author     : akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
    <%    session.removeAttribute("uname");
         session.invalidate();
         response.sendRedirect("index1.jsp");
%>
    </body>
</html>

