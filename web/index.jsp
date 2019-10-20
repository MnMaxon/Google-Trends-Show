<%@ page import="com.trends.Game" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/19/2019
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/1982_RC01/embed_loader.js"></script>
<%String oldCode = request.getParameter("code"); if (oldCode == null) oldCode = "";%>
<script type="text/javascript">
</script>

<h1 style="font-family: 'Lucida Sans Unicode'; font-size: 400%" > Trendy Words Game!</h1>
<button type="submit" style="font-size: 35px" onclick="window.location.href='ButtonPlace2.jsp'">Show Rules</button>
<button type="button" style="color: crimson;font-size: 35px" onclick="window.location.href='ButtonPlace.jsp'" >Create a Game</button>
<br><br><br><br><br><br><br>
<%if(!oldCode.equals("")){out.print("<b style=\"font-size: 35px\">Invalid Code!</b>");}%>
<form name="myForm" action="Join.jsp" method="GET">
  <b style="font-size: 35px">Game Code:</b> <input type="text" style="font-size: 35px" name="code" value=<%=oldCode%>>
  <h1>
  </h1>
    <input type="submit" style="font-size: 35px" value="Join Game">
</form>
</body>
</html>
