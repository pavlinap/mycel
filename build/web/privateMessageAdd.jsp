<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.shadownet.data.UserManager"%>
<%@page import="org.shadownet.data.Group"%>
<%@page import="org.shadownet.data.User"%>
<%@page import="org.shadownet.data.Conversation"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
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

            // add message to conversation
            String message = request.getParameter("message");
            if ((message != null) && (message.length() > 0) && (message.length() < 1000)) {
                Announcement announcement = new Announcement(new Date(), message, currentUser.getID());
                userConv.addAnnouncement(announcement);
                recipientConv.addAnnouncement(announcement);
            }
        }

    }
    // redirect to conversation
    response.sendRedirect("privateMessage.jsp?recId=" + recipientId);
%>