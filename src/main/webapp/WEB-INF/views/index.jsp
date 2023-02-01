<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2022/12/08
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<%@include file="include/head.jsp"%>

<style>
    .btn-xl {
        padding: 10px 20px;
        font-size: 20px;
        border-radius: 10px;
        width: 300px;
        margin: auto;
    }
</style>

<body>

<!-- Page Wrapper -->
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
                                <button type="submit" onclick="location.href='/user/login'" class="form-control form-control-user btn-outline-primary btn-xl">Login</button>
                                <p></p>
                                <a href="javascript:loginWithKakao();"><img src="resources/img/kakao_login_medium_wide.png"/></a>
                                <form id="kakaoLoginForm" name="kakaoLoginForm" method="post" action="/user/kakao-login">
                                    <input type="hidden" id="kakaoEmail" name="kakaoEmail"/>
                                    <input type="hidden" id="kakaoName" name="kakaoName"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <!-- End of Content -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<%@include file="include/plugin_js.jsp"%>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init("99b09a2becb70c7132217259628c4f68");

    function loginWithKakao() {

        Kakao.Auth.login({
            scope: 'profile_nickname, account_email',
            success: function(authOjb) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: res => {
                        const email = res.kakao_account.email;
                        const name = res.properties.nickname;

                        console.log(email);
                        console.log(name);

                        $('#kakaoEmail').val(email);
                        $('#kakaoName').val(name);
                        document.kakaoLoginForm.submit();
                    }
                })
            }
        })
    }
</script>

</body>
</html>
