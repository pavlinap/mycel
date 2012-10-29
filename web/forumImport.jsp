<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forum Import</title>
    </head>
    <body>
        <h1>Forum Import</h1>
Please paste the formerly exported forum XML here:
    <form action="forumImportProcess.jsp" method="POST">
        <textarea name="xml" cols="60" rows="5"></textarea><br />
        <input type="submit" value="Import XML" />
    </form>
    </body>
</html>
