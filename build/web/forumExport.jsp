<%@page import="java.util.Hashtable"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Vector"%>
<%@page import="com.thoughtworks.xstream.io.xml.StaxDriver"%>
<%@page import="com.thoughtworks.xstream.XStream"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Hashtable<String,Vector> forumTopics = (Hashtable<String,Vector>)application.getAttribute("ForumTopics");
    //Vector<Announcement> announcements = (Vector<Announcement>)application.getAttribute("Announcements");
    // http://xstream.codehaus.org/tutorial.html
    XStream xstream = new XStream(new StaxDriver());
    String xml = xstream.toXML( forumTopics );
    out.println( xml );
%>