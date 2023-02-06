<%@ page import="com.snut.cse.exchangers.board.mapper.BoardMapper" %>
<%@ page import="com.snut.cse.exchangers.board.domain.BoardVO" %><%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/13
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@include file="../include/head.jsp"%>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
<%--    <%@include file="../include/sidebar.jsp"%>--%>

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
                                <div class="form-group">
                                    <label>Board No.</label>
                                    <input class="form-control" name="boardNo" value="<c:out value="${board.id}" />" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <input class="form-control" name="category" value="<c:out value="${board.category}" />" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input class="form-control" name="title" value="<c:out value="${board.title}"/>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>Content</label>
                                    <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content}" /></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Writer</label>
                                    <input class="form-control" name="writer" value="<c:out value="${board.writer}" />" readonly="readonly">
                                </div>
                                <button data-operation="update" class="btn btn-primary">Modify</button>
                                <button data-operation="list" class="btn btn-outline-primary">List</button>
                                <form id="operationForm" action="/board/update" method="get">
                                    <input type="hidden" id="id" name="id" value="<c:out value="${board.id}"/>">
                                    <input type="hidden" name="pageNum" value="<c:out value="${criteria.pageNum}"/>">
                                    <input type="hidden" name="amount" value="<c:out value="${criteria.amount}"/>">
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

<script type="text/javascript">
    $(document).ready(function () {
        var operationForm = $("#operationForm");

        $("button[data-operation='update']").on("click", function (e) {
            operationForm.attr("action", "/board/update").submit();
        });

        $("button[data-operation='list']").on("click", function (e) {
            operationForm.find("#id").remove();
            operationForm.attr("action", "/board/list").submit();
        });
    });
</script>

</body>
</html>

