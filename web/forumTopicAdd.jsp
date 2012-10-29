<%@page import="java.util.Hashtable"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%
    Hashtable<String,Vector> forumTopics = (Hashtable<String,Vector>)application.getAttribute("ForumTopics");
    String topic = request.getParameter("topic");
    if ( topic == null ) {
        out.println("We should never get here!!!");
    }
    Vector<Announcement> messages = (Vector<Announcement>)forumTopics.get(topic);

//    Vector<Announcement> announcements = (Vector<Announcement>)application.getAttribute("Announcements");
    String message = request.getParameter("message");
    if ( (message != null) && (message.length() > 10) && (message.length() < 1000) ) {
        // should make sure String has no JS or HTML!
        Announcement an = new Announcement( new Date(), message, -1 );
        messages.add( an );
    }
%>
<jsp:forward page="forumTopicShow.jsp">
    <jsp:param name="topic" value="<%= topic %>" />
</jsp:forward>
