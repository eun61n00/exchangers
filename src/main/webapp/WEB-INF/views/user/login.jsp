<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/25
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="../include/head.jsp"%>
<body id="page-top">

<!-- Page Wrapper -->

<div id="wrapper">

    <div id="content-wrapper" class="d-flex flex-column h-100">

        <div id="content">

            <div class="h-100 row align-items-center justify-content-center">
                <div class="col col-md-5">

                    <div class="card shadow-lg align-self-center">
                        <div class="card-body">

                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 style="font-family: RixInooAriDuriR; color: #2e59d9; align-content: center">EXCHANGERS</h1>
                                        <h1 class="h4 text-gray-900 mb-4">Sign In</h1>
                                    </div>
                                    <form class="user" action="/login" method="post">
                                        <div class="form-group">
                                            <input class="form-control form-control-user"
                                                   name="userName" aria-describedby="emailHelp" value="admin"
                                                   placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                   name="userPassword" placeholder="Password" value="admin">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary btn-user btn-block" type="subit">Login</button>
<%--                                        <hr>--%>
<%--                                        <a href="index.html" class="btn btn-google btn-user btn-block">--%>
<%--                                            <i class="fab fa-google fa-fw"></i> Login with Google--%>
<%--                                        </a>--%>
<%--                                        <a id="kako-login-btn" href="javascript:loginWithKakao()" class="btn btn-kakao btn-user btn-block">--%>
<%--                                            <i src="/img/kakao.svg"></i> Login with Kakao--%>
<%--                                        </a>--%>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    </div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<%@include file="../include/plugin_js.jsp"%>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
        integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
    Kakao.init('99b09a2becb70c7132217259628c4f68'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<p id="token-result"></p>

<script>
    function loginWithKakao() {
        Kakao.Auth.authorize({
            redirectUri: 'http://localhost:8080/user/kakao-login',
        });
    }

    // 아래는 데모를 위한 UI 코드입니다.
    displayToken()
    function displayToken() {
        var token = getCookie('authorize-access-token');

        if(token) {
            Kakao.Auth.setAccessToken(token);
            Kakao.Auth.getStatusInfo()
                .then(function(res) {
                    if (res.status === 'connected') {
                        document.getElementById('token-result').innerText
                            = 'login success, token: ' + Kakao.Auth.getAccessToken();
                    }
                })
                .catch(function(err) {
                    Kakao.Auth.setAccessToken(null);
                });
        }
    }

    function getCookie(name) {
        var parts = document.cookie.split(name + '=');
        if (parts.length === 2) { return parts[1].split(';')[0]; }
    }
</script>

<style>
    .btn-kakao{color:#3C1E1E;background-color:#FFEC42;border-color:#FFDE00;}
    .btn-kakao:hover{background-color:#FFDE00;}
</style>

</body>
</html>

