<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Side Navbar -->
    <nav class="side-navbar z-index-40">
        <!-- Sidebar Header-->
        <div class="sidebar-header d-flex align-items-center py-4 px-3"><img
                class="avatar shadow-0 img-fluid rounded-circle"
                src="<c:url value='/templates/user/img/logo1.png'/>" alt="...">
            <div class="ms-3 title">
                <h1 class="h4 mb-2">${sessionScope.user == null?'ADMIN@123':''}${sessionScope.user.username}</h1>
                <p class="text-sm text-gray-500 fw-light mb-0 lh-1">${sessionScope.user == null?'VO LE NHAT LINH':''}${sessionScope.user.fullname}</p>
            </div>
        </div>
        <!-- Sidebar Navidation Menus-->
        <ul class="list-unstyled py-4">
            <span class="text-uppercase text-gray-400 text-xs letter-spacing-0 mx-3 px-2 heading">Main</span>
            <li class="sidebar-item active"><a class="sidebar-link" href="/DTNsShop/admin">
                    <svg class="svg-icon svg-icon-sm svg-icon-heavy me-xl-2">
                        <use xlink:href="#real-estate-1"> </use>
                    </svg>Trang chủ </a></li>
            <span class="mt-2 text-uppercase text-gray-400 text-xs letter-spacing-0 mx-3 px-2 heading">Quản lý</span>
            <!-- Sildebar item -->
            <li class="sidebar-item"><a class="sidebar-link" href="#exampledropdownDropdown0" data-bs-toggle="collapse">
                     <svg  class="me-xl-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                         <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                    </svg>
                    Người dùng</a>
                <ul class="collapse list-unstyled " id="exampledropdownDropdown0">
                    <li><a class="sidebar-link" href="/DTNsShop/admin/account-manager.html">Form Người Dùng</a></li>
                    <li><a class="sidebar-link" href="/DTNsShop/admin/account-list.html">Danh Sách</a></li>
                </ul>
            </li>
            <!-- Sildebar item -->
            <li class="sidebar-item"><a class="sidebar-link" href="#exampledropdown2" data-bs-toggle="collapse">
                     <svg  class="me-xl-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                       <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
                    </svg>
                    Sản phẩm</a>
                <ul class="collapse list-unstyled " id="exampledropdown2">
                    <li><a class="sidebar-link" href="/DTNsShop/admin/product-manager.html">Form Sản Phẩm</a></li>
                       <li><a class="sidebar-link" href="/DTNsShop/admin/product-list.html">Danh Sách</a></li>
                    <li><a class="sidebar-link" href="/DTNsShop/admin/product-category.html">Danh Mục</a></li>
                </ul>
            </li>
            <!-- Sildebar item -->
            <li class="sidebar-item"><a class="sidebar-link" href="#exampledropdown3" data-bs-toggle="collapse">
                     <svg  class="me-xl-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z"/>
                      <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z"/>
                      <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z"/>
                    </svg>
                    Danh mục </a>
                <ul class="collapse list-unstyled " id="exampledropdown3">
                    <li><a class="sidebar-link" href="/DTNsShop/admin/categories-manager.html">Form Danh Mục</a></li>
                    <li><a class="sidebar-link" href="/DTNsShop/admin/categories-list.html">Danh Sách</a></li>
                </ul>
            </li>
             <!-- Sildebar item -->
            <li class="sidebar-item"><a class="sidebar-link" href="#exampledropdown7" data-bs-toggle="collapse">
                     <svg  class="me-xl-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                       <path d="M8 5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm4 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM5.5 7a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm.5 6a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
                        <path d="M16 8c0 3.15-1.866 2.585-3.567 2.07C11.42 9.763 10.465 9.473 10 10c-.603.683-.475 1.819-.351 2.92C9.826 14.495 9.996 16 8 16a8 8 0 1 1 8-8zm-8 7c.611 0 .654-.171.655-.176.078-.146.124-.464.07-1.119-.014-.168-.037-.37-.061-.591-.052-.464-.112-1.005-.118-1.462-.01-.707.083-1.61.704-2.314.369-.417.845-.578 1.272-.618.404-.038.812.026 1.16.104.343.077.702.186 1.025.284l.028.008c.346.105.658.199.953.266.653.148.904.083.991.024C14.717 9.38 15 9.161 15 8a7 7 0 1 0-7 7z"/>
                    </svg>
                    Màu sắc </a>
                <ul class="collapse list-unstyled " id="exampledropdown7">
                     <li><a class="sidebar-link" href="/DTNsShop/admin/product-color.html">Form Cập Nhật</a></li>
                     <li><a class="sidebar-link" href="/DTNsShop/admin/color-list.html">Danh sách</a></li>
                </ul>
            </li>
            <!-- Sildebar item -->
            <li class="sidebar-item"><a class="sidebar-link" href="#exampledropdown4" data-bs-toggle="collapse">
                      <svg  class="me-xl-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                        <path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                        <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                    </svg>
                    Đơn hàng</a>
                <ul class="collapse list-unstyled " id="exampledropdown4">
                    <li><a class="sidebar-link" href="/DTNsShop/admin/order-manager.html">Đang Chờ</a></li>
                    <li><a class="sidebar-link" href="/DTNsShop/admin/order-delivered.html">Đã Giao</a></li>
                    <li><a class="sidebar-link" href="/DTNsShop/admin/order-cancel.html">Đã Hủy</a></li>
                </ul>
            </li>
             <li class="sidebar-item"><a class="sidebar-link" href="/DTNsShop/admin/profile-manager.html">
                    <svg  class="me-xl-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="m4.736 1.968-.892 3.269-.014.058C2.113 5.568 1 6.006 1 6.5 1 7.328 4.134 8 8 8s7-.672 7-1.5c0-.494-1.113-.932-2.83-1.205a1.032 1.032 0 0 0-.014-.058l-.892-3.27c-.146-.533-.698-.849-1.239-.734C9.411 1.363 8.62 1.5 8 1.5c-.62 0-1.411-.136-2.025-.267-.541-.115-1.093.2-1.239.735Zm.015 3.867a.25.25 0 0 1 .274-.224c.9.092 1.91.143 2.975.143a29.58 29.58 0 0 0 2.975-.143.25.25 0 0 1 .05.498c-.918.093-1.944.145-3.025.145s-2.107-.052-3.025-.145a.25.25 0 0 1-.224-.274ZM3.5 10h2a.5.5 0 0 1 .5.5v1a1.5 1.5 0 0 1-3 0v-1a.5.5 0 0 1 .5-.5Zm-1.5.5c0-.175.03-.344.085-.5H2a.5.5 0 0 1 0-1h3.5a1.5 1.5 0 0 1 1.488 1.312 3.5 3.5 0 0 1 2.024 0A1.5 1.5 0 0 1 10.5 9H14a.5.5 0 0 1 0 1h-.085c.055.156.085.325.085.5v1a2.5 2.5 0 0 1-5 0v-.14l-.21-.07a2.5 2.5 0 0 0-1.58 0l-.21.07v.14a2.5 2.5 0 0 1-5 0v-1Zm8.5-.5h2a.5.5 0 0 1 .5.5v1a1.5 1.5 0 0 1-3 0v-1a.5.5 0 0 1 .5-.5Z"/>
                    </svg>
                    Thông tin Admin </a></li>
        <span class="text-uppercase text-gray-400 text-xs letter-spacing-0 mx-3 px-2 heading">Thống kê</span>
      
       	 <!-- Sildebar item -->
            <li class="sidebar-item"><a class="sidebar-link" href="#exampledropdown5" data-bs-toggle="collapse">
                     <svg  class="me-xl-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                        <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z"/>
                        <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z"/>
                        <path d="M10.854 7.854a.5.5 0 0 0-.708-.708L7.5 9.793 6.354 8.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3Z"/>
                    </svg>
                    Tổng hợp - Thống kê</a>
                <ul class="collapse list-unstyled " id="exampledropdown5">
                    <li><a class="sidebar-link" href="/DTNsShop/admin/report-manager.html">Sản Phẩm Yêu Thích</a></li>
                    <li><a class="sidebar-link" href="/DTNsShop/admin/report-order.html">Đơn Hàng</a></li>
                </ul>
            </li>
       </ul>
    </nav>