<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/25
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%@include file="../include/head.jsp"%>
<body>
<div id="wrapper">
<%--    <%@include file="../include/sidebar.jsp"%>--%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <%@include file="../include/toolbar.jsp"%>

            <h1><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h1>
            <h2><c:out value="${msg}"/></h2>

        </div>
    </div>
</div></body>
</html>
