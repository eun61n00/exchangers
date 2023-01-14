<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/13
  Time: 8:05 PM
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
    <%@include file="../include/sidebar.jsp"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <%@include file="../include/toolbar.jsp"%>

            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Board</h1>
                <p class="mb-4">교환학생 관련 정보를 묻고 답하는 게시판입니다.</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">묻고 답하기</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form action="/board/update" method="post">
                                    <div class="form-group">
                                        <label>Board No.</label>
                                        <input class="form-control" name="bno" value="<c:out value="${board.board_no}" />" readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input class="form-control" name="title" value="<c:out value="${board.title}"/>">
                                    </div>
                                    <div class="form-group">
                                        <label>Content</label>
                                        <textarea class="form-control" rows="3" name="content"><c:out value="${board.content}" /></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Writer</label>
                                        <input class="form-control" name="writer" value="<c:out value="${board.writer}" />">
                                    </div>
                                    <button data-oper="update" class="btn btn-primary" type="submit" formmethod="post">Modify</button>
                                    <button data-oper="delete" class="btn btn-danger" type="submit" formmethod="post" onclick="javascript: form.action='/board/delete?board_no=<c:out value="${board.board_no}" />'">Delete</button>
                                    <button data-oper="list" class="btn btn-outline-primary" type="submit" onclick="location.href='/board/list'">List</button>

                                    <form id="operForm" action="/board/update" method="get">
                                        <input type="hidden" id="board_no" name="board_no" value="<c:out value="${board.board_no}"/>">
                                    </form>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <%@include file="../include/footer.jsp"%>
    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<%@include file="../include/plugin_js.jsp"%>

</body>
</html>

