<%-- 
    Document   : timer.jsp
    Created on : 12 Apr, 2015, 3:01:16 PM
    Author     : akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar,java.text.SimpleDateFormat,java.util.Date" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="refresh" content="1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <font color="#6666FF">
            <%  String timeStamp = new SimpleDateFormat("HH:mm:ss").format(Calendar.getInstance().getTime());
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
                String time = "18:00:00 ";
                Date date1 = sdf.parse(time);
                Date date2 = sdf.parse(timeStamp);
                long ms = date1.getTime() - date2.getTime();
                int x = (int) (ms / 1000);
                int seconds = x % 60;
                x /= 60;
                int minutes = x % 60;
                x /= 60;
                int hours = x % 24;
                out.println("Current Time: " + timeStamp + "<br>");

                out.println("Time Left: " + hours + ":" + minutes + ":" + seconds);

            %>

        </font>

    </body>
</html>