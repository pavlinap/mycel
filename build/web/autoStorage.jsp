<%@page import="java.util.Hashtable"%>
<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Vector"%>
<%@page import="com.thoughtworks.xstream.io.xml.StaxDriver"%>
<%@page import="com.thoughtworks.xstream.XStream"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="js/autoStorage.js" charset="utf-8"></script>
    </head>
    <body>
    <div id="forumXML">
<%
    Hashtable<String,Vector> forumTopics = (Hashtable<String,Vector>)application.getAttribute("ForumTopics");
    XStream xstream = new XStream(new StaxDriver());
    String xml = xstream.toXML( forumTopics );
    out.println( xml );
%>
    </div>
    </body>
</html>