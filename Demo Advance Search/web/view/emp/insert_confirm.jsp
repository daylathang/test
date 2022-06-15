<%-- 
    Document   : insert_confirm
    Created on : Jun 3, 2022, 8:49:12 AM
    Author     : Ngo Tung Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var count = 3;
            function redirect()
            {
                count--;
                document.getElementById('timer').innerHTML = count;
                if(count <= 0)
                {
                    window.location.href = 'search';
                }
            }
            setInterval(redirect,1000);
        </script>
    </head>
    <body>
        employee ${requestScope.emp.name} has been ${requestScope.action} to DB <br/>
        Redirect to Search page after <span id="timer">3</span> seconds!
    </body>
</html>
