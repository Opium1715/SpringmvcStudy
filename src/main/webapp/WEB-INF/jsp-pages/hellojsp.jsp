<%--
  Created by IntelliJ IDEA.
  User: ZhangQi
  Date: 2022/9/23
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>hello</title>
</head>
<body>
    <h1>hello jsp!!!</h1>
    <br>
    <table>
        <thead>
            <tr>
                <td>no</td>
                <td>name</td>
                <td>sex</td>
                <td>sno</td>
                <td>phone</td>
                <td>id</td>
                <td>colleage</td>
                <td>subject</td>
                <td>class</td>
                <td>teacher</td>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${studentList}" var="stu">
            <tr>
                <td>${stu.sNo}</td>
                <td>${stu.sName}</td>
                <td>${stu.sSex}</td>
                <td>${stu.sSno}</td>
                <td>${stu.sPhone}</td>
                <td>${stu.sId}</td>
                <td>${stu.sColleage}</td>
                <td>${stu.sSubject}</td>
                <td>${stu.sClass}</td>
                <td>${stu.sTeacher}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</body>
</html>
