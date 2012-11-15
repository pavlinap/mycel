<%@page import="org.shadownet.data.User"%>
<%@page import="org.shadownet.data.Group"%>
<%@page import="org.shadownet.data.UserManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Vector"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShadowNet</title>
    </head>
    <body>
        <a href='index.jsp'>Home</a> <a href='forumExport.jsp'>Export</a> <a href='forumImport.jsp'>Import</a>
        <%
            //load users
            UserManager.loaduser();
            User[] users = UserManager.getAllUsers();
            if (application.getAttribute("users") == null) {
                application.setAttribute("users", users);
            }

        %>
        <h1>
            <%
                //Überprüft ob die Option gesetzt ist, also ob sich der Benutzer berets authentifiziert hat
                if (session.getAttribute("currentSessionUsername") == null) {
                    out.print("Benutzer unbekannt, bitte melden Sie sich an - <a href='login.jsp'>Login</a>");
                } else {
                    out.print("Willkommen " + session.getAttribute("currentSessionUsername"));
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
        <form action="announcementAdd.jsp" method="POST">
            <textarea name="announcement" cols="60" rows="1"></textarea><br />
            <input type="submit" value="Post new announcement" />(more than 10 chars)
        </form>

        <h2>Forum</h2>
        <%
            Hashtable<String, Vector> forumTopics = (Hashtable<String, Vector>) application.getAttribute("ForumTopics");
            if (forumTopics == null) {
                forumTopics = new Hashtable<String, Vector>();
                application.setAttribute("ForumTopics", forumTopics);
            }
            out.println("<ul>");
            String[] topics = (String[]) forumTopics.keySet().toArray(new String[0]);
            Arrays.sort(topics);
            for (String topic : topics) {
                out.println("<li>");
                int nrOfEntries = ((Vector) forumTopics.get(topic)).size();
                out.println("  <a href='forumTopicShow.jsp?topic=" + topic + "'>" + topic.substring(28) + "</a> (" + nrOfEntries + ")");
                out.println("</li>");
            }
            out.println("</ul>");
        %>
        <form action="forumTopicCreate.jsp" method="POST">
            <input type="text" name="topic" />
            <input type="submit" value="Create new topic" />(more than 5 chars)
        </form>

        <!-- Messaging -->
        
        <%
            if (session.getAttribute("currentSessionUser") != null) {
                out.println("<h2>Messages</h2>");
                out.println("<ul>");
                for (int i = 0; i < users.length; i++) {
                    if ((Long) session.getAttribute("currentSessionUserID") != users[i].getID()) {
                        out.println("<li><a href=privateMessageCheck.jsp?recipient=" + users[i].getID() + ">" + users[i].getUsername() + "</a></li>");
                    }
                }
            }
            out.println("</ul>");
        %>


    </body>
</html>
