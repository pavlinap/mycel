<%@page import="org.shadownet.data.UserManager"%>
<%@page import="org.shadownet.data.Group"%>
<%@page import="org.shadownet.data.Conversation"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="org.shadownet.data.User"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Vector"%>
<%@page import="com.thoughtworks.xstream.io.xml.StaxDriver"%>
<%@page import="com.thoughtworks.xstream.XStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<link type="text/css" href="style.css" rel="stylesheet" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forum</title>
        <script type="text/javascript" src="js/autoStorage.js" charset="utf-8"></script>
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
    </header>
    <div id="content">
        <%
            long recipientId = 0;
            //get conversation
            if (request.getParameter("recId") == null) {
                response.sendRedirect("index.jsp");
            } else {
                User currentUser = (User) session.getAttribute("currentSessionUser");
                recipientId = Long.parseLong(request.getParameter("recId"));
                Group recipient = UserManager.getUserById(recipientId);
                // create or load conversation
                if (recipient == null) {
                    response.sendRedirect("index.jsp");
                } else {
                    Conversation userConv = currentUser.addOrGetConversation(recipient);
                    Conversation recipientConv = recipient.addOrGetConversation(currentUser);

                    // todo: show user-names or groupname
                    // show conversation
                    Vector<Announcement> announcements = userConv.getAnnouncements();
                    SimpleDateFormat formater = new SimpleDateFormat();
                    out.println("<ul>");
                    for (int i = 0; i < userConv.getAnnouncements().size(); i++) {
                        out.println("<li>");
                        if ((int) announcements.get(i).getUserId() != -1) {
                        }
                        out.println(announcements.get(i).getUserId());
                        out.println(announcements.get(i).getMessage());
                        out.println(formater.format(announcements.get(i).getDate()));
                        out.println("</li>");
                    }
                    out.println("</ul>");
                }
            }
        %>
        <form action="privateMessageAdd.jsp" id="formstyle" method="POST">
            <textarea name="message" cols="60" rows="1"></textarea><br />
            <input type="submit" value="Send message" />
            <input type="hidden" value="<%=recipientId%>" name="recId" />
        </form>
    </div>
    <div id="footer">
        <a href='forumExport.jsp'>EXPORT</a> <a href='forumImport.jsp'>&nbsp;&nbsp;&nbsp;&nbsp;IMPORT&nbsp;&nbsp;</a>
    </div>
</body>
</html>
