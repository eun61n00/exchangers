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
<body id="">

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
                            <button type="submit" onclick="location.href='/user/login'" class="form-control form-control-user btn-outline-primary">Login</button>
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

</body>
</html>
