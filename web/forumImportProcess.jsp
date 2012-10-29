<%@page import="com.thoughtworks.xstream.io.xml.StaxDriver"%>
<%@page import="com.thoughtworks.xstream.XStream"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Hashtable"%>
<%
    String xml = request.getParameter("xml");
    //out.println( xml );
    // http://xstream.codehaus.org/tutorial.html
    XStream xstream = new XStream(new StaxDriver());
    Hashtable<String,Vector> forumTopics = (Hashtable<String,Vector>)xstream.fromXML( xml );
    application.setAttribute("ForumTopics", forumTopics);
%>
<jsp:forward page="index.jsp"/>
