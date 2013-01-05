<%@page import="java.util.Hashtable"%>
<%@page import="org.mycel.data.Announcement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%
    Hashtable forumTopics = (Hashtable)application.getAttribute("ForumTopics");
    Date date = new Date();
    String topic = date + request.getParameter("topic");
    if ( (topic != null) && (topic.length() > 5 + 28 /* '+ 28' is date */ ) && (topic.length() < 100 ) ) {
        // should make sure String has no JS or HTML or spaces etc!
        Vector<Announcement> messages = new Vector<Announcement>();
        forumTopics.put( topic, messages );
    }
%>
<jsp:forward page="forum.jsp"/>