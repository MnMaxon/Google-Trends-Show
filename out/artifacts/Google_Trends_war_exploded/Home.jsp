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
    WebClient webClient = new WebClient();
    String s = null;
    try {

        // run the Unix "ps -ef" command
        // using the Runtime exec method:

        Process proc = Runtime.getRuntime().exec("python C:/pytrends/pytrends.py " + target + "_" + word1 + "," + target + "_" + word1 + " time=\"[[2018,10,18],[2018,10,18]]\" title=\"Interest over time\"");

        BufferedReader stdInput = new BufferedReader(new
                InputStreamReader(proc.getInputStream()));

        BufferedReader stdError = new BufferedReader(new
                InputStreamReader(proc.getErrorStream()));

        // read the output from the command
        System.out.println("Here is the standard output of the command:\n");
        while ((s = stdInput.readLine()) != null) System.out.println(s);

        // read any errors from the attempted command
        // System.out.println("Here is the standard error of the command (if any):\n");
        //while ((s = stdError.readLine()) != null) {
        //   System.out.println(s);
        //}

    } catch (IOException e) {
        System.out.println("exception happened - here's what I know: ");
        e.printStackTrace();
    }
%>
<script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/1982_RC01/embed_loader.js"></script>
<script type="text/javascript">
    target = 'google';
    word1 = 'youtube';
    word2 = 'trends';
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
