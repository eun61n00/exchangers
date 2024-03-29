<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2022/12/08
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EXCHANGERS | 교환학생 정보 공유 플랫폼</title>

    <!-- Custom fonts for this template -->
    <link href="<c:out value="${path}"/>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:out value="${path}"/>/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="<c:out value="${path}"/>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link href="<c:out value="${path}"/>/css/button.css" rel="stylesheet">
    <link href="<c:out value="${path}"/>/css/font.css" rel="stylesheet">

    <style>
        html,body {
            height: 100%;
        }

        #content-wrapper{height: 100%;}

        #wrapper{height: 100%}

        .wrapper{min-height: 100%;}


    </style>

</head>

