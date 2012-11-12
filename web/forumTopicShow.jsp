<%@page import="org.shadownet.data.Announcement"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Vector"%>
<%@page import="com.thoughtworks.xstream.io.xml.StaxDriver"%>
<%@page import="com.thoughtworks.xstream.XStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forum</title>
        <script type="text/javascript">
            console.log(localStorage["forumXML"]);
        </script>
        <script type="text/javascript" src="js/autoStorage.js" charset="utf-8"></script>
    </head>
    <body>
<a href='index.jsp'>Home</a>
<%
    Hashtable<String,Vector> forumTopics = (Hashtable<String,Vector>)application.getAttribute("ForumTopics");
    String topic = request.getParameter("topic");
    Vector<Announcement> messages = (Vector<Announcement>)forumTopics.get(topic);
%>
        <h1>Forum: <%= topic %></h1>
<%
    if ( messages == null ) {
        out.println("We should never get here!!!");
    }
    out.println( "<ul>" );
    for (int i = 0; i < messages.size(); i++) {
        String msg = messages.get(i).getMessage();
        out.println( "<li>" );
        out.println( msg );
        out.println( "</li>" );
    }
    out.println( "</ul>" );
%>
    <form action="forumTopicAdd.jsp" method="POST">
        <input type="hidden" name="topic" value="<%= topic %>" />
        <textarea name="message" cols="60" rows="1"></textarea><br />
        <input type="submit" value="Post new message" />(more than 10 chars)
    </form>
    
    <div id="forumXML" style="display: none;">
<%
    XStream xstream = new XStream(new StaxDriver());
    String xml = xstream.toXML( forumTopics );
    out.println( xml );
%>
    </div>

    </body>
</html>
