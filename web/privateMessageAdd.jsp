<%@page import="org.shadownet.data.Conversation"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%
    Vector<Conversation> allConversations = (Vector<Conversation>) application.getAttribute("Conversations");

    String currentID = request.getParameter("conversation");
    if (currentID == null) {
        out.println("We should never get here!!!");
    }
    
    int intID = Integer.parseInt(currentID);
    Conversation currentConversation = allConversations.elementAt(intID);
    Vector<Announcement> messages = (Vector<Announcement>) currentConversation.getAnnouncements();

    String message = request.getParameter("message");
    if ((message != null) && (message.length() > 0) && (message.length() < 1000)) {
        // should make sure String has no JS or HTML!
        Announcement an = new Announcement(new Date(), message, (Long)session.getAttribute("currentSessionUserID"));
        messages.add(an);
    }
    response.sendRedirect("privateMessage.jsp?conversation=" + currentID);
%>