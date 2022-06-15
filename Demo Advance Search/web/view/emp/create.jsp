<%-- 
    Document   : create
    Created on : Jun 3, 2022, 8:37:03 AM
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
        <form action="create" method="POST">
            Name: <input type="text" name="name"/>
            <Br/>
            Gender: <input type="radio" checked="checked" name="gender" value="male"/> Male
            <input type="radio" name="gender" value="female" /> Female <br/>
            Dob: <input type="date" name="dob" /> <br/>
            Department: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option
                        <c:if test="${param.did eq d.id}"> 
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
 