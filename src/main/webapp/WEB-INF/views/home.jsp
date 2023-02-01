<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/02/01
  Time: 1:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="include/head.jsp"%>

<style>
    .btn-xl {
        padding: 10px 20px;
        font-size: 20px;
        border-radius: 10px;
        width: 100%;
        margin: auto;
    }
</style>

<body>

<div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column h-100">
        <div id="content">
            <div class="h-100 row align-items-center justify-content-center">
                <div class="col col-md-5">
                    <div class="card shadow-lg align-self-center">
                        <div class="card-body p-5">
                            <div class="text-center">
                                <h1 style="font-family: RixInooAriDuriR; color: #2e59d9; align-content: center">EXCHANGERS</h1>
                                <hr/>
                                <c:out value="${kakaoName}"/>님 안녕하세요!
                                <p></p>
                                <button type="submit" onclick="location.href='/board/list'" class="form-control form-control-user btn-outline-primary btn-xl">정보 공유 게시판</button>
                                <p></p>
                                <button type="submit" class="form-control form-control-user btn-outline-primary btn-xl">Logout</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<%@include file="include/plugin_js.jsp"%>
<script>

</script>

</html>

