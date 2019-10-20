<%@ page import="com.trends.Game" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/19/2019
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    Game g = Game.getFromId(request.getParameter("code"));
    if(g == null || g.round != 0) {
        out.print("<script type=\"text/javascript\">window.location.replace('index.jsp' + window.location.search);</script>");
        return;
    }
%>
<script type="text/javascript">
    <%=request.getParameter("code")%>
alert(<%=request.getParameter("code")%>);
    </script>
</body>
</html>
