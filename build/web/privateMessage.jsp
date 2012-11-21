<%@page import="org.shadownet.data.Group"%>
<%@page import="org.shadownet.data.UserManager"%>
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
            long recipientId = 0;
            //get conversation
            if (request.getParameter("recId") == null) {
                response.sendRedirect("index.jsp");
            } else {

                User currentUser = (User)session.getAttribute("currentSessionUser");
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
        <form action="privateMessageAdd.jsp" method="POST">
            <textarea name="message" cols="60" rows="1"></textarea><br />
            <input type="submit" value="Send message" />
            <input type="hidden" value="<%=recipientId%>" name="recId" />
        </form>
    </body>
</html>