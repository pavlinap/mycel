<%-- 
    Document   : index
    Created on : Oct 29, 2012, 5:41:23 PM
    Author     : Pavlina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Please login!</h1>
        <form action="SimpleLogin" method="post">
            username <input type="text" name="un"/><br/> 
            password <input type="password" name="pw"/>
            <input type="submit" value="submit"> 
        </form>
    </body>
</html>
