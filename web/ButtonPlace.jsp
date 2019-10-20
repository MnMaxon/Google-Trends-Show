<%--
  Created by IntelliJ IDEA.
  User: J.R. Price
  Date: 10/19/2019
  Time: 6:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Whos playing</title>
</head>
<body>
<center>
    <form action="">
        <h2 style="font-family: 'Lucida Sans Unicode'; font-size: 350%">Teams or Solo</h2>
    <input type="radio" name="teams or solo" style="font-size: 150%" value="teams" >Teams</input>
    <input type="radio" name="teams or solo" style="font-size: 150%" value="solo" >Solo </input>
        <h2 style="font-family: 'Lucida Sans Unicode'; font-size: 350%">How many rounds? </h2>
        <label> Max:10
            <input list="rounds" style="font-size: 150%" name="numberOfRounds" /></label>
        <datalist id="rounds">
            <option value="1">
            <option value="2">
            <option value="3">
            <option value="4">
            <option value="5">
            <option value="6">
            <option value="7">
            <option value="8">
            <option value="9">
            <option value="10">
        </datalist>

    </form>



</center>
</body>
</html>
