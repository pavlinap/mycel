<%
session.invalidate();
session = null;
response.sendRedirect("index.jsp");
%>