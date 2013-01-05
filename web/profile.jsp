<%-- 
    Document   : forum
    Created on : 06.12.2012, 16:45:25
    Author     : Richard
--%>

<%@page import="org.mycel.data.User"%>
<%@page import="org.mycel.data.Group"%>
<%@page import="org.mycel.data.UserManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Vector"%>
<%@page import="org.mycel.data.Announcement"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<link type="text/css" href="style.css" rel="stylesheet" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShadowNet</title>
        <style>
            a:link {color:#1ea181; text-decoration:none;}    /* unvisited link */
            a:visited {color:#1ea181; text-decoration:none;} /* visited link */
            a:hover {color:#215448; text-decoration:none;}   /* mouse over link */
            a:active {color:#1ea181; text-decoration:none;}  /* selected link */
        </style>
    </head>
    <body>
    <div id="head">
        <img src="./graphics/logo.png"><div class="clear"></div>
        <form action="SimpleLogin" method="post">
            <div id="username">
                Username </br>
                <input type="text" name="un"/>
            </div>
            <div id="password">
                Password</br>
                <input type="password" name="pw"/>                        
            </div>
            <input type="submit" value="submit" hidden="true"> 
        </form>
        <div id="head_top_nav">
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="profile.jsp">PROFIL</a></li>
                <li><a href="messages.jsp">MESSAGES</a></li>
                <li><a href="groups.jsp">GROUPS</a></li>
                <li><a href="forum.jsp">FORUM</a></li>                    
            </ul>
        </div>
    </div>
    <div id="content">
        <%
            //load users
            User[] users = (User[]) application.getAttribute("users");
            if (users == null) {
                UserManager.loaduser();
                users = UserManager.getAllUsers();
                application.setAttribute("users", users);
            }

        %>
        <h1>
            <%
                //Überprüft ob die Option gesetzt ist, also ob sich der Benutzer berets authentifiziert hat
                if (session.getAttribute("currentSessionUsername") == null) {
                    out.print("Benutzer unbekannt, bitte melden Sie sich an!");
                } else {
                    out.print("Willkommen " + session.getAttribute("currentSessionUsername") + " (<a href='logout.jsp'>logout</a>)");
                }
            %>
        </h1>
        <h2>
            Profile goes here
        </h2>
    </div>
    <div id="footer">
        <a href='forumExport.jsp'>EXPORT</a> <a href='forumImport.jsp'>&nbsp;&nbsp;&nbsp;&nbsp;IMPORT&nbsp;&nbsp;</a>
    </div>
</body>
</html>


