<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%
    Vector<Announcement> announcements = (Vector<Announcement>)application.getAttribute("Announcements");
    String announcement = request.getParameter("announcement");
    long userid;
    if (session.getAttribute("currentSessionUsername") == null){
        userid = -1;
    }else userid = (Long) session.getAttribute("currentSessionUserID");
        
    if ( (announcement != null) && (announcement.length() > 10) && (announcement.length() < 1000) ) {
        // should make sure String has no JS or HTML!
        Announcement an = new Announcement( new Date(), announcement, userid);
        announcements.add( an );
    }
%>
<jsp:forward page="index.jsp"/>