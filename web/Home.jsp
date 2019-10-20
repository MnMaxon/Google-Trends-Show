<%@ page import="com.gargoylesoftware.htmlunit.html.HtmlPage" %>
<%@ page import="com.gargoylesoftware.htmlunit.WebClient" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="html2canvas.js">
</script>

<html>
<head>
    <title>Title</title>
</head>
<body>
Help
<%
    String target = "google";
    String word1 = "youtube";
    String word2 = "trends";
    out.print("Help");

%>
<script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/1982_RC01/embed_loader.js"></script>
<script type="text/javascript">
    target = '<%=target%>>';
    word1 = '<%=word1%>';
    word2 = '<%=word2%>';
    var ctx;
    wid = trends.embed.renderExploreWidget("TIMESERIES", {
        "comparisonItem": [{
            "keyword": target + " " + word1,
            "geo": "",
            "time": "today 12-m"
        }, {"keyword": target + " " + word2, "geo": "", "time": "today 12-m"}], "category": 0, "property": ""
    }, {
        "exploreQuery": "q=" + target + "%20" + word1 + "," + target + "%20" + word2 + "&hl=en-US&date=today 12-m,today 12-m",
        "guestPath": "https://trends.google.com:443/trends/embed/"
    });

</script>

</body>
</html>
