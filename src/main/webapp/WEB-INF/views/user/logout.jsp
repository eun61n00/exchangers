<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/25
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>Logout Page</h1>
  <form action="/logout" method="post">
    <input type="hidden" name="${_crsf.parameterName}" value="${_csrf.token}"/>
    <button type="submit">Logout</button>
  </form>
</body>
</html>
