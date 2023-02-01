<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/13
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@include file="../include/head.jsp"%>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
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
<%--                        <select name="category">--%>
<%--                            <c:forEach var="i" items="${board.options}"--%>
<%--                            <option--%>
<%--                            <option value="전체"/>--%>
<%--                            <option value="전체"/>--%>
<%--                            <option value="전체"/>--%>
<%--                            <option value="전체"/>--%>
<%--                            <option value="전체"/>--%>
<%--                        </select>--%>
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
                                    <td><c:out value="${board.id}" /></td>
                                    <td><a class="move_to_read" href="<c:out value="${board.id}"/>">
                                        <c:out value="${board.title}" /></a></td>
                                    <td><c:out value="${board.writer}" /></td>
                                    <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatDate value="${board.updatedate}" pattern="yyyy-MM-dd"/></td>
                                    <td><c:out value="${board.viewcnt}"/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <form id="actionForm" action="/board/list" method="get">
                                <input type="hidden" name="pageNum" value="<c:out value="${pageDTO.criteria.pageNum}"/>">
                                <input type="hidden" name="amount" value="<c:out value="${pageDTO.criteria.amount}"/>">
                            </form>

                            <!-- Pagination -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${pageDTO.prev}">
                                        <li class="page-item"><a class="page-link" href="${pageDTO.startPage-1}" tabindex="-1">Previous</a></li>
                                    </c:if>
                                    <c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
                                        <li class="page-item ${pageDTO.criteria.getPageNum() == num ? "active": ""}"><a class="page-link" href="${num}">${num}</a></li>
                                    </c:forEach>
                                    <c:if test="${pageDTO.next}">
                                        <li class="page-item"><a class="page-link" href="${pageDTO.endPage+1}" tabindex="-1">Next</a></li>
                                    </c:if>
                                </ul>
                            </nav>

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
        const id = "<c:out value="${id}" />";
        const msg = "<c:out value="${msg}"/>"

        checkModal(msg, id);

        history.replaceState({}, null, null)

        function checkModal(msg, id) {
            if (id === '' || history.state) {
                return ;
            }

            if (msg === "register") {
                $("#listModalLabel").html("Register Complete");
                $(".modal-body").html("게시글 " + parseInt(id) + "번이 등록되었습니다.");
            }
            else if (msg === "update") {
                $("#listModalLabel").html("Update Complete");
                $(".modal-body").html("게시글 " + parseInt(id) + "번이 수정되었습니다.");
            }
            else if (msg === "delete") {
                $("#listModalLabel").html("Delete Complete");
                $(".modal-body").html("게시글 " + parseInt(id) + "번이 삭제되었습니다.");
            }

            $("#listModal").modal("show");
        }

        var actionForm = $("#actionForm");

        $(".page-item a").on("click", function(e) {
            e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        })

        $(".move_to_read").on("click", function(e){
            e.preventDefault();
            actionForm.append("<input type='hidden' name='id' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/board/read");
            actionForm.submit();
        });
    })


</script>

</body>
</html>

