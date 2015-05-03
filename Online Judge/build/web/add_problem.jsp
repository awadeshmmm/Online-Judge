<%-- 
    Document   : add_problem
    Created on : 7 Apr, 2015, 1:37:45 PM
    Author     : akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <s:setDataSource driver="com.mysql.jdbc.Driver"
                 url="jdbc:mysql://localhost:3306/codeJudge?useUnicode=true&characterEncoding=UTF-8" user="root"
                 password="1234class"/>
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Problems</title>
        
    </head>
    <body bgcolor="#6666FF">
        
        <s:update>insert into contest_problems (name ,content, input, output, time_limit, points)
            values ('${param.name}','${param.content}','${param.input}','${param.output}','${param.time_limit}','${param.points}')</s:update>
            
     <jsp:forward page="admin_problem_add.jsp"/>
    </body>
</html>
