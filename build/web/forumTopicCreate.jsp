<%@page import="java.util.Hashtable"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%
    Hashtable forumTopics = (Hashtable)application.getAttribute("ForumTopics");
    String topic = request.getParameter("topic");
    if ( (topic != null) && (topic.length() > 5) && (topic.length() < 100) ) {
        // should make sure String has no JS or HTML or spaces etc!
        Vector<Announcement> messages = new Vector<Announcement>();
        forumTopics.put( topic, messages );
    }
%>
<jsp:forward page="index.jsp"/>