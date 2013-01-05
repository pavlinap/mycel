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
        <title>mycel</title>
        <style>
            a:link {color:#1ea181; text-decoration:none;}    /* unvisited link */
            a:visited {color:#1ea181; text-decoration:none;} /* visited link */
            a:hover {color:#215448; text-decoration:none;}   /* mouse over link */
            a:active {color:#1ea181; text-decoration:none;}  /* selected link */
        </style>
    </head>
    <body>
    <header id="head">
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
            <!-- style just temporary... style the button ;) -->
            <input type="submit" value="submit" style="position: absolute; top: -999px;"> 
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
    </header>

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
        <h2>Announcements</h2>
        <%
            Vector<Announcement> announcements = (Vector<Announcement>) application.getAttribute("Announcements");
            if (announcements == null) {
                announcements = new Vector<Announcement>();
                application.setAttribute("Announcements", announcements);
            }
            // Wenn Array mehr als 15 einträge hat, nur die ersten 15 anzeigen, wenn nicht, alle!
            int end_posts = (announcements.size() > 15) ? announcements.size() - 15 : 0;
            out.println("<ul>");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            for (int i = announcements.size() - 1; i >= end_posts; i--) {
                //Display Date, userID and message text
                out.println("<li>");
                //Momentan nur die IDs von dem User angezeigt
                out.println("<b>" + announcements.get(i).getUserId() + "</b>");
                out.println(":");
                out.println(df.format(announcements.get(i).getDate()));
                out.println(":");
                out.println(announcements.get(i).getMessage());
                out.println("  <a href='announcementDel.jsp?id=" + i + "'>(delete)</a>");
                out.println("</li>");
            }
            out.println("</ul>");
        %>
        <form action="announcementAdd.jsp" id="formstyle" method="POST">
            <textarea name="announcement" cols="60" rows="1"></textarea><br />
            <input type="submit" value="Post new announcement" />(more than 10 chars)
        </form>
        
    </div>
    <div id="footer">
        <a href='forumExport.jsp'>EXPORT</a> <a href='forumImport.jsp'>&nbsp;&nbsp;&nbsp;&nbsp;IMPORT&nbsp;&nbsp;</a>
    </div>

</body>
</html>
