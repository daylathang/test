<%-- 
    Document   : insert
    Created on : Jun 15, 2022, 8:12:04 AM
    Author     : bin20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insert" method="POST">
            Reason: <input type="text" name="reason"/>
            <Br/>
            From: <input type="date" name="from" /> <br/>
            To: <input type="date" name="to" /> <br/>
            Created by: <select name="eid">
                <c:forEach items="${requestScope.emps}" var="e">
                    <option                      
                        value="${e.id}">${e.name}</option>
                </c:forEach> 
                Reviewed by: <select name="eid">
                    <c:forEach items="${requestScope.emps}" var="e">
                        <option                      
                            value="${e.id}">${e.name}</option>
                    </c:forEach> 
                </select>
                <br/>
                <input type="submit" value="Save"/>
        </form>
    </body>
</html>
