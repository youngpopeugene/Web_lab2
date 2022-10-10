<%--
  Created by IntelliJ IDEA.
  User: evgenijtulyakov
  Date: 10.10.2022
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Web_lab2</title>
    <link rel="stylesheet" href="./styles/stylesheet.css">
    <script src="./scripts/jquery-3.6.0.js"></script>
    <script src="./scripts/main.js"></script>
</head>
<body>
<table id="result_table">
    <tbody>
        <tr class = "results">
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>HIT RESULT</th>
        </tr>
        <%--@elvariable id="collection" type="java.util.LinkedList"--%>
        <tr class = "results">
            <th>${collection.getLast().getX().toString().format("%.2f", collection.getLast().getX()).replaceAll(",",".")}</th>
            <th>${collection.getLast().getY().toString().format("%.2f", collection.getLast().getY()).replaceAll(",",".")}</th>
            <th>${collection.getLast().getR().toString().format("%.2f", collection.getLast().getR()).replaceAll(",",".")}</th>
            <c:choose>
                <c:when test="${collection.getLast().isStatus().toString().trim()=='true'}">
                    <th style="color: green">${collection.getLast().isStatus().toString().toUpperCase()}</th>
                </c:when>
                <c:otherwise>
                    <th style="color: red">${collection.getLast().isStatus().toString().toUpperCase()}</th>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <button onClick="window.location.href='/Web_lab2_Web_exploded/index.jsp';" type="clean_button" onclick="">Main page</button>
            </td>
        </tr>
    </tbody>
</table>
</body>
</html>