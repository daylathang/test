<%-- 
    Document   : update
    Created on : Jun 6, 2022, 8:17:05 AM
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
        <form action="update" method="POST">
            Id: ${emp.id} <input type="hidden" value="${emp.id}" name="id" /> <br/>
            Name: <input type="text" value="${emp.name}" name="name"/>
            <Br/>
            Gender: <input type="radio" 
                           ${emp.gender?"checked=\"checked\"":""}
                           name="gender" value="male"/> Male
            <input type="radio"
                    ${!emp.gender?"checked=\"checked\"":""}
                   name="gender" value="female" /> Female <br/>
            Dob: <input value="${emp.dob}" type="date" name="dob" /> <br/>
            Department: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option
                        <c:if test="${emp.dept.id eq d.id}"> 
                            selected="selected"
                        </c:if>
                        value="${d.id}">${d.name}</option>
                </c:forEach>  
            </select>
            <br/>
                <input type="submit" value="Save"/>
        </form>
    </body>
</html>
