<%-- 
    Document   : detail
    Created on : May 30, 2022, 8:41:45 AM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<%@page import="java.util.ArrayList" %>
<%@page import="model.MyRect"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <canvas id="myCanvas" width="500" height="500" style="border:1px solid #d3d3d3;">
            Your browser does not support the HTML5 canvas tag.</canvas>
        <script>
            var c = document.getElementById("myCanvas");
            var ctx = c.getContext("2d");
            
            ctx.beginPath();
            ctx.rect(${requestScope.rect.x},${requestScope.rect.y},${requestScope.rect.w},${requestScope.rect.h});
            ctx.stroke();
            ctx.font = "15px Arial";
            ctx.fillText(${requestScope.rect.id},${requestScope.rect.x},${requestScope.rect.y - 15});
            ctx.fillText(${requestScope.rect.x},${requestScope.rect.x},${requestScope.rect.y - 7});
            ctx.fillText(${requestScope.rect.y},${requestScope.rect.x + 20},${requestScope.rect.y - 7});
           
           
        </script> 
        
    </body>
</html>
