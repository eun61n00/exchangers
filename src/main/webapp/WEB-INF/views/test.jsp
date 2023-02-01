<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/02/01
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="include/head.jsp"%>

<head>
    <title>Test</title>
</head>
<body>
  <h2>This is test page.</h2>
<c:out value="${kakaoUserDTO.kakaoName}" />
<c:out value="${kakaoUserDTO.kakaoEmail}" />
</body>

<%@include file="include/plugin_js.jsp"%>

</html>
