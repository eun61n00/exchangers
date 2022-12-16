<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2022/12/09
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%@ include file="../../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini layout-boxed">

<div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../../include/main_header.jsp"%>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../../include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                게시판
                <small>목록페이지(페이징)</small>
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> article</li>
                <li class="active"><a href="${pageContext.request.contextPath}/article/paging/search/list"> list</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">

            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">게시글 목록</h3>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <th style="width: 30px">#</th>
                                <th>제목</th>
                                <th style="width: 100px">작성자</th>
                                <th style="width: 150px">작성시간</th>
                                <th style="width: 60px">조회</th>
                            </tr>
                            <c:forEach items="${articles}" var="article">
                                <tr>
                                    <td>${article.articleNo}</td>
                                        <%--<td><a href="${pageContext.request.contextPath}/article/read?articleNo=${article.articleNo}">${article.title}</a></td>--%>
<%--                                    <td><a href="${pageContext.request.contextPath}/article/paging/read${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${article.articleNo}">${article.title}</a></td>--%>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/article/paging/search/read${pageMaker.makeSearch(pageMaker.criteria.page)}&articleNo=${article.articleNo}">
                                                ${article.title}
                                        </a>
                                    </td>
                                    <td>${article.writer}</td>
                                    <td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a HH:mm"/></td>
                                    <td><span class="badge bg-red">${article.viewCnt}</span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
<%--                    <div class="box-footer">--%>
<%--                        <div class="text-center">--%>
<%--                            <form id="listPageForm">--%>
<%--                                <input type="hidden" name="page" value="${pageMaker.criteria.page}">--%>
<%--                                <input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">--%>
<%--                            </form>--%>
<%--                            <ul class="pagination">--%>
<%--                                <c:if test="${pageMaker.prev}">--%>
<%--                                    &lt;%&ndash;<li><a href="${pageContext.request.contextPath}/article/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;<li><a href="${pageContext.request.contextPath}/article/listPaging${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>&ndash;%&gt;--%>
<%--                                    <li><a href="${pageMaker.startPage - 1}">이전</a></li>--%>
<%--                                </c:if>--%>
<%--                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">--%>
<%--                                    <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>--%>
<%--&lt;%&ndash;                                            <a href="${pageContext.request.contextPath}/article/listPaging?page=${idx}">${idx}</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <a href="${pageContext.request.contextPath}/article/paging/list${pageMaker.makeQuery(${idx})}">${idx}</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <a href="${pageContext.request.contextPath}/article/paging/list?page=${idx}">${idx}</a>&ndash;%&gt;--%>
<%--                                        <a href="${idx}">${idx}</a>--%>
<%--                                    </li>--%>
<%--                                </c:forEach>--%>
<%--                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">--%>
<%--                                    &lt;%&ndash;<li><a href="${pageContext.request.contextPath}/article/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;<li><a href="${pageContext.request.contextPath}/article/listPaging?${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>&ndash;%&gt;--%>
<%--                                    <li><a href="${pageMaker.endPage + 1}">다음</a></li>--%>
<%--                                </c:if>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="box-footer">
                        <div class="text-center">
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li><a href="${pageContext.request.contextPath}/article/paging/search/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                                        <a href="${pageContext.request.contextPath}/article/paging/search/list${pageMaker.makeSearch(idx)}">${idx}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li><a href="${pageContext.request.contextPath}/article/paging/search/list?${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="box-footer">
                        <div class="form-group col-sm-2">
                            <select class="form-control" name="searchType" id="searchType">
                                <option value="n" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
                                <option value="t" <c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
                                <option value="c" <c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
                                <option value="w" <c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
                                <option value="tc" <c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
                                <option value="cw" <c:out value="${searchCriteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
                                <option value="tcw" <c:out value="${searchCriteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-10">
                            <div class="input-group">
                                <input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
                                        <i class="fa fa-search"></i> 검색
                                    </button>
                                </span>
                            </div>
                        </div>
                        <div class="pull-right">
                            <button type="button" class="btn btn-success btn-flat" id="writeBtn">
                                <i class="fa fa-pencil"></i> 글쓰기
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../../include/main_footer.jsp"%>

</div>
<!-- ./wrapper -->
<%@ include file="../../include/plugin_js.jsp"%>
<script>

    $(document).ready(function () {

        var result = "${msg}";
        if (result == "regSuccess") {
            alert("게시글 등록이 완료되었습니다.");
        } else if (result == "modSuccess") {
            alert("게시글 수정이 완료되었습니다.");
        } else if (result == "delSuccess") {
            alert("게시글 삭제가 완료되었습니다.");
        }

        $("#searchBtn").on("click", function (event) {
            self.location =
                "/exchangers/article/paging/search/list${pageMaker.makeQuery(1)}"
                + "&searchType=" + $("select option:selected").val()
                + "&keyword=" + encodeURIComponent($("#keywordInput").val());
        });

        $("#writeBtn").on("click", function (event) {

            self.location = "/exchangers/article/paging/search/write";

        });
    });

</script>
</body>
</html>