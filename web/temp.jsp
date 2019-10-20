<%@ page import="com.trends.Game" %><%--
  Created by IntelliJ IDEA.
  User: Ahmed
  Date: 10/20/2019
  Time: 4:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    out.print("<form name='tempForm' action='Join.jsp' method='GET'>");
    out.print("<input type='text' style='font-size:35px;visibility:hidden' name='code' value='" + new Game(null,60).id + "'></h1>");
    out.print("</form>");
%>
<script type="text/javascript">document.forms["tempForm"].submit();</script>

</body>
</html>
