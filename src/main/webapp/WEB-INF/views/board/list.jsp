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
                        <h5 class="m-0 font-weight-bold text-primary fa-pull-left">Board</h5>
                        <button id="regBtn" name="regBtn" class="btn btn-outline-primary fa-pull-right" type="submit" onclick="location.href='/board/register'">Register new board</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Board No.</th>
                                    <th>Title</th>
                                    <th>Writer</th>
                                    <th>Register Date</th>
                                    <th>Update date</th>
                                    <th>View Count</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${list}" var="board">
                                <tr>
                                    <td><c:out value="${board.board_no}" /></td>
                                    <td><a href="/board/read?board_no=<c:out value="${board.board_no}" />"><c:out value="${board.title}" /></a></td>
                                    <td><c:out value="${board.writer}" /></td>
                                    <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatDate value="${board.updatedate}" pattern="yyyy-MM-dd"/></td>
                                    <td><c:out value="${board.viewcnt}"/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!-- Modal -->
                            <div class="modal fade" id="listModal" tabindex="-1" role="dialog" aria-labelledby="listModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title text-primary" id="listModalLabel">Complete</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">처리 완료 메시지</div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                                </div>
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
        const board_no = '<c:out value="${board_no}" />';
        const register_result = '<c:out value="${register_result}" />';
        const update_result = '<c:out value="${update_result}" />';
        const delete_result = '<c:out value="${delete_result}" />';

        checkModal(register_result, update_result, delete_result, board_no);

        history.replaceState({}, null, null)

        function checkModal(register_result, update_result, delete_result, board_no) {
            if (board_no === '' || history.state) {
                return ;
            }

            if (register_result === "success") {
                $("#listModalLabel").html("Register Complete");
                $(".modal-body").html("게시글 " + parseInt(board_no) + "번이 등록되었습니다.");
            }
            else if (update_result === "success") {
                $("#listModalLabel").html("Update Complete");
                $(".modal-body").html("게시글 " + parseInt(board_no) + "번이 수정되었습니다.");
            }
            else if (delete_result === "success") {
                $("#listModalLabel").html("Delete Complete");
                $(".modal-body").html("게시글 " + parseInt(board_no) + "번이 삭제되었습니다.");
            }

            $("#listModal").modal("show");
        }
    })


</script>

</body>
</html>

