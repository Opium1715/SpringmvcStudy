<%--
  Created by IntelliJ IDEA.
  User: ZhangQi
  Date: 2022/9/26
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>错误！</title>
</head>
<body>
    <h1 style="text-align: center">${fn:substringAfter(e,'java.lang.Exception: ')}</h1>
</body>
</html>
