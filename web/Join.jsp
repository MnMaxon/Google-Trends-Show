<%@ page import="com.trends.Game" %>
<%@ page import="com.trends.Team" %>
<%@ page import="com.trends.Player" %>
<%@ page import="java.util.ArrayList" %><%--
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
    String name = request.getParameter("name");
    String pName = request.getParameter("pName");
    String team = request.getParameter("team");
    if (g == null && request.getParameter("code") != null && request.getParameter("code").equals("test"))
        g = new Game(new ArrayList<String>(), 60, "test");
    if (g == null || g.getRound() != 0) {
        System.out.println((g == null) + " " + Game.gameList().size());
        for (String id : Game.gameList()) System.out.println(id);
        out.print("<script type=\"text/javascript\">window.location.replace('index.jsp' + window.location.search);</script>");
        return;
    }
    out.print("Code: " + request.getParameter("code"));

%>

<div id='teams'>
    <%
        String teamString = "'yo" + Game.randomID() + "'";
        for (Team t : g.teamList) {
            String nameString = null;
            for (Player p : t.getPlayers())
                if (nameString == null) nameString = p.name;
                else nameString += ", " + nameString;
            teamString += "'<b>" + t.name + ": " + nameString + "</b>'";
        }
        out.print(teamString);
    %>
</div>
<%
    out.print("<form name='myForm' action='Join.jsp' method='GET'>");
    Player player = g.getPlayerFromName(pName);
    int error = 0;
    try {
        error = Integer.parseInt(request.getParameter("e"));
    } catch (Exception ignored) {
    }
    if (player == null && name != null && !name.equals("") && team != null && !team.equals("")) {
            if (g.getPlayerFromName(name) != null) error = 1;
            else {
            	Team t = g.getTeamFromName(team);
            	if (t == null) t = g.addTeam(team);
            	player = new Player(name, t);
            }
    }
    out.print("<b style='font-size: 35px'>Player Name:</b> <input type='text' style='font-size: 35px' name='name' value='" + name + "'<h1></h1><p></p>" +
            "<b style='font-size: 35px'>Team Name:</b> <input type='text' style='font-size: 35px' name='team' value='" + team + "'<h1></h1><p></p>" +
            "<input type=\"submit\" style=\"font-size: 35px\" value=\"Join Game\">");
    out.print("<input type='text' style='font-size:35px;visibility:hidden' name='code' value='" + request.getParameter("code") + "'></h1>");
    out.print("<input type='text' style='font-size:35px;visibility:hidden' name='pName' value='" + pName + "'></h1>");
    out.print("<input type='text' style='font-size:35px;visibility:hidden' name='e' value='" + error + "'></h1>");
    out.print("</form>");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    function refreshFunction() {
        $('#teams').load(document.URL + ' #teams');
    }

    setInterval(refreshFunction, 2000)
</script>
</body>
</html>
