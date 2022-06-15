<%-- 
    Document   : display
    Created on : May 18, 2022, 7:57:21 AM
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
            <c:forEach items="${requestScope.listrect}" var="r">
            ctx.beginPath();
            ctx.rect(${r.x},${r.y},${r.w},${r.h});
            ctx.stroke();
            </c:forEach>
        </script> 

        ${fn:length(requestScope.listrect) mod 2 eq 0? "even number": "odd number"}
        <c:if test="${fn:length(requestScope.listrect) mod 2 eq 0}">
            Even Number
        </c:if>
        <c:if test="${fn:length(requestScope.listrect) mod 2 ne 0}">
            Odd Number
        </c:if>
    </body>
</html>
