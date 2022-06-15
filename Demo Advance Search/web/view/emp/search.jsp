<%-- 
    Document   : search
    Created on : Jun 1, 2022, 8:34:34 AM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script> 
            function deleteEmp(id)
            {
                var result = confirm("are you sure?");
                if(result)
                {
                    window.location.href = 'delete?id='+id;
                }
            }
        </script>
    </head>
    <body>
        <form action="search" method="POST">
            Department: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option
                        <c:if test="${param.did eq d.id}"> 
                            selected="selected"
                        </c:if>
                        value="${d.id}">${d.name}</option>
                </c:forEach> 
            </select>
            <Br/>
            <input type="submit" value="Search"/> 
        </form>

        <c:if test="${requestScope.emps ne null}">
            <table border="1px"> 
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Gender</td>
                    <td>Dob</td>
                    <td>Department</td>
                    <td></td>
                    <td></td>
                </tr>
                <c:forEach items="${requestScope.emps}" var="e">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>
                            <c:if test="${e.gender}" >
                                <img src="../img/male-icon.png" alt=""/>
                            </c:if>
                            <c:if test="${!e.gender}" >
                                <img src="../img/female-icon.png" alt=""/>
                            </c:if>
                        </td>
                        <td>${e.dob}</td>
                        <td>${e.dept.name}</td>
                        <td><a href="update?id=${e.id}">Edit</a></td>
                        <td><input type="button" value="Delete" 
                                   onclick="deleteEmp(${e.id});" 
                                   /></td>
                    </tr>
                </c:forEach>
            </table>            
        </c:if>

    </body>
</html>
