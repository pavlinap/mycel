<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%
    Vector announcements = (Vector)application.getAttribute("Announcements");
    int id = Integer.parseInt( request.getParameter("id") );
    if ( ( id >= 0 ) && ( id < announcements.size() ) ) {
        announcements.remove( id );
    }
%>
<jsp:forward page="index.jsp"/>