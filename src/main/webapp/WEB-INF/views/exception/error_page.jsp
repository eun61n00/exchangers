<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/21
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" import="java.util.*" %>

<!doctype html>
<html lang="en">
<%@include file="../include/head.jsp"%>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
    <%@include file="../include/sidebar.jsp"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
        <%@include file="../include/toolbar.jsp"%>

        <h4><c:out value="${exception.getMessage()}"/></h4>

        <ul>
          <c:forEach items="${exception.getStackTrace()}" var="stack">
            <li><c:out value="${stack}"/></li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>

  <%@include file="../include/plugin_js.jsp"%>
</body>
</html>
