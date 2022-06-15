<%-- 
    Document   : filter
    Created on : Jun 10, 2022, 8:37:35 AM
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
        <form action="filter" method="GET">
            Id: <input type="text" name="id"/>
            Name: <input type="text" name="name"/>
            <Br/>
            Gender: <input type="radio" checked="checked" name="gender" value="male"/> Male
            <input type="radio" name="gender" value="female" /> Female
            <input type="radio" name="gender" value="all" /> All
            <br/>
            Dob: From <input type="date" name="from" /> 
            To <input type="date" name="to" />
            <br/>
            Department: <select name="did">
                <option value="-1">--------ALL--------</option>
                <c:forEach items="${requestScope.depts}" var="d">
                    <option
                        value="${d.id}">${d.name}</option>
                </c:forEach>  
            </select>
            <br/>
                <input type="submit" value="Save"/>
        </form>
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
