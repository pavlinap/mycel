<%@page import="com.sun.tools.apt.comp.PrintAP"%>
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
        <meta http-equiv="refresh" content="10" >
        <title>Private Message</title>
    </head>
    <body>
        <%
            // open all conversations 
            Vector conversations = (Vector) application.getAttribute("Conversations");
            if (conversations == null) {
                conversations = new Vector();
                application.setAttribute("Conversations", conversations);
            }

            // check who's current user
            long currentUserId = (Long)session.getAttribute("currentSessionUserID");

            // check for conversation partners TODO: extend for multi-conversation
            long recipientId = Long.parseLong(request.getParameter("recipient"));
               
            // make array for conversation members
            Vector conversationMembers = new Vector();
            conversationMembers.addElement(currentUserId);
            conversationMembers.addElement(recipientId); // TODO: make multi
            
            // check if conversation between members exists
            Conversation currentConversation = null;
            boolean conversationExists = false;
            
            for (int i = 0; i < conversations.size(); i++) {
                Conversation c = (Conversation) conversations.get(i);
                
                if ((conversationMembers.size() == c.getMembers().size()) && (c.getMembers().containsAll(conversationMembers))) {
                    currentConversation = c;
                    conversationExists = true;
                }
            }
            if (!conversationExists) {
                currentConversation = new Conversation(conversationMembers, conversations.size());
                conversations.addElement(currentConversation);
            }

            // set conversation ID
            long currentID = currentConversation.getID();
            out.println(currentID);
            response.sendRedirect("privateMessage.jsp?conversation=" + currentID);
        %>
    </body>
</html>