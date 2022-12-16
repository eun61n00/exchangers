<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2022/12/09
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../../include/head.jsp"%>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../../include/main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../../include/left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Page Header
                <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                <li class="active">Here</li>
            </ol>
        </section>

        <!-- Main content -->
        <div class="col-lg-12">
            <form role="form" id="writeForm" method="post" action="${pageContext.request.contextPath}/article/write">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">게시글 작성</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea class="form-control" id="content" name="content" rows="30"
                                      placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="writer">작성자</label>
                            <input class="form-control" id="writer" name="writer">
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
                        <div class="pull-right">
                            <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                            <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    <!-- Main Footer -->
    <%@ include file="../../include/main_footer.jsp" %>
</div>

<!-- ./wrapper -->
<%@ include file="../../include/plugin_js.jsp"%>
<script>
    $(document).ready(function () {

        var formObj = $("form[role='form']");
        console.log(formObj);

        $(".modBtn").on("click", function () {
            formObj.attr("action", "/article/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });

        $(".delBtn").on("click", function () {
            formObj.attr("action", "/article/remove");
            formObj.submit();
        });

        $(".listBtn").on("click", function () {
            self.location = "/article/list"
        });

    });
</script>

</body>
</html>
