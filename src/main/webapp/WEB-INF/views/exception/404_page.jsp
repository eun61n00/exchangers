<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/21
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>


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
            <div class="text-center">
                <div class="error mx-auto" data-text="404">404</div>
                <p class="lead text-gray-800 mb-5">Page Not Found</p>
            </div>

        </div>
    </div>
</div>
<%@include file="../include/plugin_js.jsp"%>

</body>
</html>
