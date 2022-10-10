<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web_lab2</title>
    <link rel="stylesheet" href="./styles/stylesheet.css">
    <script src="./scripts/jquery-3.6.0.js"></script>
    <script src="./scripts/main.js"></script>
</head>
<body>
<table id="main_table">
    <thead>
        <tr>
            <th class="bio" id="firstbio" colspan="2" >Tuliakov Eugene P32101</th>
        </tr>
        <tr>
            <th class="bio" id="lastbio" colspan="2" >Var: 1202</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td id="col1" class="col">
                <!-- Форма ввода  -->
                <fieldset>
                    <legend>Enter data:</legend>
                    <form class="input_form" onsubmit="formHandler(event)">
                        <table id="data_table">
                            <tr><th colspan="3">X value:</th></tr>
                            <tr>
                                <td><label><input type="radio" name="value_X" value="-4"><span>-4</span></label></td>
                                <td><label><input type="radio" name="value_X" value="-3"><span>-3</span></label></td>
                                <td><label><input type="radio" name="value_X" value="-2"><span>-2</span></label></td>
                            </tr>
                            <tr>
                                <td><label><input type="radio" name="value_X" value="-1"><span>-1</span></label></td>
                                <td><label><input type="radio" name="value_X" value="0"><span>0</span></label></td>
                                <td><label><input type="radio" name="value_X" value="1"><span>1</span></label></td>
                            </tr>
                            <tr>
                                <td><label><input type="radio" name="value_X" value="2"><span>2</span></label></td>
                                <td><label><input type="radio" name="value_X" value="3"><span>3</span></label></td>
                                <td><label><input type="radio" name="value_X" value="4"><span>4</span></label></td>
                            </tr>
                            <tr><th colspan="3">Y value (-5, 5):</th></tr>
                            <tr><td colspan="3"><input type="text" name="value_Y" value="" aria-label="value_Y" maxlength="10"></td></tr>
                            <tr><th colspan="3">R value:</th></tr>
                            <tr>
                                <td colspan="3">
                                    <select name="values_R" onchange="moveDots()">
                                        <option name="value_R" value="1"> 1 </option>
                                        <option name="value_R" value="2"> 2 </option>
                                        <option name="value_R" value="3"> 3 </option>
                                        <option name="value_R" value="4"> 4 </option>
                                        <option name="value_R" value="5"> 5 </option>
                                    </select>
                                </td>
                            </tr>
                            <tr><td colspan="3"><input type="submit" value="Submit"><text class="message"> </text></td></tr>
                        </table>
                    </form>
                </fieldset>
            </td>
            <td id="col2" class="col">
                <!-- Координатная плоскость с содержимым -->
                <svg width="300" height="300" onclick="svgHandler(event)">
                    <!-- Оси координат -->
                    <line x1="0" x2="300" y1="150" y2="150"></line>
                    <line x1="150" x2="150" y1="0" y2="300"></line>
                    <!-- Стрелки к осям -->
                    <polygon points="150,0 145,15 155,15" stroke="black"></polygon>
                    <polygon points="300,150 285,145 285,155" stroke="black"></polygon>
                    <!-- Метки для значений R на оси X -->
                    <circle cx="50" cy="150" r="3" fill="black"/>
                    <circle cx="100" cy="150" r="3" fill="black"/>
                    <circle cx="150" cy="150" r="3" fill="black"/>
                    <circle cx="200" cy="150" r="3" fill="black"/>
                    <circle cx="250" cy="150" r="3" fill="black"/>
                    <!-- Метки для значений R на оси Y -->
                    <circle cx="150" cy="50" r="3" fill="black"/>
                    <circle cx="150" cy="100" r="3" fill="black"/>
                    <circle cx="150" cy="200" r="3" fill="black"/>
                    <circle cx="150" cy="250" r="3" fill="black"/>
                    <!-- Прямоугольник -->
                    <polygon stroke="black" fill="blue" fill-opacity="0.3" points="250,150 250,250 150,250 150,150"></polygon>
                    <!-- Треугольник -->
                    <polygon stroke="black" fill="blue" fill-opacity="0.3" points="150,150 150,250 100,150"></polygon>
                    <!-- Четверть эллипса -->
                    <path stroke="black" fill="blue" fill-opacity="0.3"
                          d="M150,50 A100,100 90 0,1 250,150 L 150,150 Z"></path>
                    <!-- Подписи к осям -->
                    <text x="285" y="135">X</text>
                    <text x="160" y="15">Y</text>
                    <!-- Значения R на оси X -->
                    <text x="40" y="130">-R</text>
                    <text x="85" y="130">-R/2</text>
                    <text x="190" y="130">R/2</text>
                    <text x="245" y="130">R</text>
                    <!-- Значения R на оси Y -->
                    <text x="170" y="52.5">R</text>
                    <text x="170" y="102.5">R/2</text>
                    <text x="170" y="202.5">-R/2</text>
                    <text x="170" y="252.5">-R</text>
                    <c:forEach items="${collection}" var="col">
                        <circle class = "shot" cx="${150 + 100 * col.getX()}" cy="${150 - 100 * col.getY()}" r="3" fill="red" stroke-width="0"></circle>
                    </c:forEach>
                </svg>
            </td>
        </tr>
    </tbody>
</table>
<table id="result_table">
    <tbody>
        <tr class = "results">
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>HIT RESULT</th>
        </tr>
        <%--@elvariable id="collection" type="java.util.LinkedList"--%>
        <c:forEach items="${collection}" var="col">
            <tr class = "results">
                <th>${col.getX().toString().format("%.2f", col.getX()).replaceAll(",",".")}</th>
                <th>${col.getY().toString().format("%.2f", col.getY()).replaceAll(",",".")}</th>
                <th>${col.getR().toString().format("%.2f", col.getR()).replaceAll(",",".")}</th>
                <c:choose>
                    <c:when test="${col.isStatus().toString().trim()=='true'}">
                        <th style="color: green">${col.isStatus().toString().toUpperCase()}</th>
                    </c:when>
                    <c:otherwise>
                        <th style="color: red">${col.isStatus().toString().toUpperCase()}</th>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" style="text-align: center">
                <button onclick="cleanTable()" type="clean_button">Clean results</button>
            </td>
        </tr>
    </tbody>
</table>
</body>
</html>