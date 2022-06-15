<%-- 
    Document   : table
    Created on : Jun 1, 2022, 8:47:28 AM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table> 
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Dob</td>
                <td>Department</td>
            </tr>
            <c:forEach items="${requestScope.emps}" var="e">
            <tr>
                <td>${e.id}</td>
                <td>${e.name}</td>
                <td>${e.gender}</td>
                <td>${e.dob}</td>
                <td>${e.dept.name}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
