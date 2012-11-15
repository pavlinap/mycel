<%@page import="org.omg.CORBA.PRIVATE_MEMBER"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.PUTFIELD"%>
<%@page import="org.shadownet.data.Conversation"%>
<%@page import="java.util.Hashtable"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="org.shadownet.data.User"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="30" >
        <title>Private Message</title>
    </head>
    <body>
        <a href='index.jsp'>Home</a>
        <%
            int currentID = Integer.parseInt(request.getParameter("conversation"));

            //get conversation
            Vector allconvs = (Vector) application.getAttribute("Conversations");
            Conversation currentConversation = (Conversation) allconvs.elementAt(currentID);

            //get all users
            User[] allUsers = (User[]) application.getAttribute("users");

            //check if current user is in conversation or if conversion even exists, else go to start-page
            if (!currentConversation.getMembers().contains(session.getAttribute("currentSessionUserID"))) {
                response.sendRedirect("index.jsp");
            }

            // show user-names
            out.println("<h1>");
            for (int i = 0; i < currentConversation.getMembers().size(); i++) {
                long userId = (Long) currentConversation.getMembers().elementAt(i);
                out.print(allUsers[(int) userId].getUsername());
                if (currentConversation.getMembers().size() - 1 > i) {
                    out.println(", ");
                }
            }
            out.println("</h1>");

            // show conversation
            Vector<Announcement> announcements = currentConversation.getAnnouncements();

            SimpleDateFormat formater = new SimpleDateFormat();

            out.println("<ul>");
            for (int i = 0; i < currentConversation.getAnnouncements().size(); i++) {
                out.println("<li>");
                if ((int) announcements.get(i).getUserId() != -1) {
                    out.print(allUsers[(int) announcements.get(i).getUserId()].getUsername());
                    out.println(": ");
                }
                out.println(announcements.get(i).getMessage());
                out.println(formater.format(announcements.get(i).getDate()));
                out.println("</li>");
            }
            out.println("</ul>");

            // TODO: "add user" and "leave conversation" posibility
            // TODO: "new message" notification*/
        %>
        <form action="privateMessageAdd.jsp" method="POST">
            <textarea name="message" cols="60" rows="1"></textarea><br />
            <input type="hidden" name="conversation" value="<%=currentID%>" />
            <input type="submit" value="Send message" />
        </form>
    </body>
</html>