<%--
  Created by IntelliJ IDEA.
  User: eunbin
  Date: 2023/01/12
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

      <!-- Sidebar Toggle (Topbar) -->
      <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
      </button>
        <a href="/home"><h1 style="font-family: RixInooAriDuriR; color: #2e59d9; align-content: center">EXCHANGERS</h1></a>
        <nav class="navbar-nav ml-auto">
              <!-- Topbar Search -->
              <form
                      class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                  <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                         aria-label="Search" aria-describedby="basic-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                      <i class="fas fa-search fa-sm"></i>
                    </button>
                  </div>
                </div>
              </form>
        </nav>

        <a class="nav-link dropdown-toggle" href="/user/mypage" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <c:out value="${sessionScope.kakaoName}"/>님
<%--            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>--%>
<%--            <img class="img-profile rounded-circle" src="img/undraw_profile.svg">--%>
        </a>
    </nav>
    <!-- End of Topbar -->