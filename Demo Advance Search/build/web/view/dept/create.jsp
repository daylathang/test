<%-- 
    Document   : create
    Created on : Jun 8, 2022, 8:28:10 AM
    Author     : Ngo Tung Son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/dept/create.css" rel="stylesheet" type="text/css"/>
        <script>
            var count = 0;
            function appendEmp()
            {
                count++;
                var container = document.getElementById("container");
                var htmlContent = "<div id=\"emp_container"+count+"\" class=\"emp_container\">";
                htmlContent += "Name: <input type=\"text\" name=\"name"+count+"\"/> <br/>";
                htmlContent += "Gender: <input type=\"radio\" name=\"gender"+count+"\" checked=\"checked\" value=\"male\"/> Male";
                htmlContent += "<input type=\"radio\" name=\"gender"+count+"\" value=\"female\" /> Female <br/>";
                htmlContent += "Dob:<input type=\"date\" name=\"dob"+count+"\" /> <br/>";
                htmlContent += "<input type=\"button\" value=\"Remove\" onclick=\"removeEmp("+count+")\" />";
                htmlContent += "Dob:<input type=\"hidden\" name=\"index\" value="+count+" />";
                htmlContent += "</div>";
                container.innerHTML += htmlContent;
            }
            function removeEmp(index)
            {
                var emp = document.getElementById("emp_container"+index);
                var container = document.getElementById("container");
                container.removeChild(emp);
            }
        </script>
    </head>
    <body>
        <form action="create" method="POST">
            <div>
                Department ID: <input type="text" name="did"/> <br/>
                Department Name: <input type="text" name="dname"/> <br/>
                <input type="button" value="Add Employee" onclick="appendEmp()" />
            </div>
            <div id="container">
            </div>
            <input type="submit" value="Save" />
        </form>
    </body>
</html>
 