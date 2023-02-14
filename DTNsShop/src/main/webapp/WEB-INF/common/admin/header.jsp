<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<header class="header z-index-50">
    <nav class="navbar py-3 px-0 shadow-sm text-white position-relative" style="background:darkred;">
        <!-- Search Box-->
        <div class="search-box shadow-sm">
            <button class="dismiss d-flex align-items-center">
                <svg class="svg-icon svg-icon-heavy">
                    <use xlink:href="#close-1"> </use>
                </svg>
            </button>
            <form id="searchForm" action="#" role="search">
                <input class="form-control shadow-0" type="text" placeholder="Bạn cần tìm gì? Hãy nhập thông tin bạn cần tìm...">
            </form>
        </div>
        <div class="container-fluid w-100">
            <div class="navbar-holder d-flex align-items-center justify-content-between w-100">
                <!-- Navbar Header-->
                <div class="navbar-header">
                    <!-- Navbar Brand --><a class="navbar-brand d-none d-sm-inline-block" href="/DTNsShop/admin">
                        <div class="brand-text d-none d-lg-inline-block"><span>DTNsShop
                            </span><strong>Admin</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div>
                    </a>
                    <!-- Toggle Button--><a class="menu-btn active" id="toggle-btn"
                        href="#"><span></span><span></span><span></span></a>
                </div>
                <!-- Navbar Menu -->
                <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                    <!-- Search-->
                    <li class="nav-item d-flex align-items-center"><a id="search" href="#">
                            <svg class="svg-icon svg-icon-xs svg-icon-heavy">
                                <use xlink:href="#find-1"> </use>
                            </svg></a></li>
                    <!-- Languages dropdown    -->
                    <li class="nav-item dropdown"><a
                            class="nav-link text-white dropdown-toggle d-flex align-items-center" id="languages"
                            href="#" data-bs-toggle="dropdown" aria-expanded="false"><img class="me-2"
                                src="/templates/user/img/<s:message code="lo.mn.imgl"/>" alt="Vietnamese" width="20px"><span
                                class="d-none d-sm-inline-block"><s:message code="lo.mn.lang"></s:message></span></a>
                        <ul class="dropdown-menu dropdown-menu-end mt-3 shadow-sm" aria-labelledby="languages">
                            <li><a class="dropdown-item" rel="nofollow" href="?lang=vi"> <img class="me-2"
                                        src="<c:url value='/templates/user/img/vietnam.png'/>" alt="Vietnamese" width="20px"><span
                                        class="text-xs text-gray-700">Tiếng Việt</span></a></li>
                            <li><a class="dropdown-item" rel="nofollow" href="?lang=en"> <img class="me-2"
                                        src="<c:url value='/templates/user/img/english.jpg'/>" alt="English" width="20px"><span
                                        class="text-xs text-gray-700">English </span></a></li>
                        </ul>
                    </li>
                    <!-- Logout    -->
                    <li class="nav-item"><a class="nav-link text-white" href="/DTNsShop/logout"> <span
                                class="d-none d-sm-inline">Logout</span>
                            <svg class="svg-icon svg-icon-xs svg-icon-heavy">
                                <use xlink:href="#security-1"> </use>
                            </svg></a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
 