<%--
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
  Welcome to the Google Trends Show Game
  <script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/1982_RC01/embed_loader.js"></script>
  <script type="text/javascript">
    target = 'google';
    word1 = 'youtube';
    word2 = 'bing';
    trends.embed.renderExploreWidget("TIMESERIES", {"comparisonItem":[{"keyword":target +" " + word1,"geo":"","time":"today 12-m"},{"keyword":target + " " + word2,"geo":"","time":"today 12-m"}],"category":0,"property":""}, {"exploreQuery":"q="+target+"%20"+word1+","+target+"%20"+word2+"&hl=en-US&date=today 12-m,today 12-m","guestPath":"https://trends.google.com:443/trends/embed/"});
  </script>
  </body>
</html>
