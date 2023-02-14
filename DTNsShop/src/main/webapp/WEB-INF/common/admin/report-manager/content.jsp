<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Page Header-->
<header class="bg-white shadow-sm px-4 py-3 z-index-20">
	<div class="container-fluid px-0">
		<h2 class="mb-0 p-1">Report Manager</h2>
	</div>
</header>
<!-- Breadcrumb-->
<div class="bg-white">
	<div class="container-fluid">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 py-3">
				<li class="breadcrumb-item"><a class="fw-light"
					href="/DTNsShop/admin">Trang chủ</a></li>
				<li class="breadcrumb-item  fw-light" aria-current="page">Tổng hợp - Thống kê</li>
				<li class="breadcrumb-item active fw-light" aria-current="page">Sản phẩm yêu thích</li>
			</ol>
		</nav>
	</div>
</div>
<!-- content -->
<div class="card m-3 mt-3">
	<div class="card-header text-end">
	<div class="text-start alert alert-success text-success w-50 float-start" role="alert"
                    ${message==null?'hidden':''} style="font-size: 13px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                        class="bi bi-check-circle me-2" viewBox="0 0 20 20">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path
                            d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                    </svg>
                    ${message}
                </div>
		<a href="/DTNsShop/admin/report-order.html" class="mt-3 btn btn-success" style="width: 250px; font-size: 16px;">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
				fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
				 <path
					d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
			</svg>
			Thống kê theo đơn hàng
		</a>
	</div>
</div>
<div class="card m-3 mt-3">
	<div class="card-header container">
		<div class="row">
			<div class="col-6 p-2">
				<i class="fas fa-table me-1"></i> DANH SÁCH MẶT HÀNG YÊU THÍCH
			</div>
			<div class="col-2"></div>
			<form action="" method="post" class="col-4 d-flex">
				<input class="form-control me-1" name="keywords" type="text"
					placeholder="Tìm kiếm theo tên sản phẩm..." value="${keywords_fav}">
				<button class="btn btn-outline-dark">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
				</button>
			</form>
		</div>
	</div>
	<div class="card-body">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Hình ảnh</th>
					<th><a class="text-dark"
						href="/DTNsShop/admin/report-manager.html/sort?field=product.name&sort=${sort}&p=${number}">Tên sản phẩm
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
						</a>
					</th>
					<th><a class="text-danger"
						href="/DTNsShop/admin/report-manager.html/sort?field=countReport&sort=${sort}&p=${number}">Lượt thích
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
							</a>
							</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Hình ảnh</th>
					<th><a class="text-dark"
						href="/DTNsShop/admin/report-manager.html/sort?field=product.name&sort=${sort}&p=${number}">Tên sản phẩm
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
						</a>
					</th>
					<th><a class="text-danger"
						href="/DTNsShop/admin/report-manager.html/sort?field=countReport&sort=${sort}&p=${number}">Lượt thích
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
							</a>
							</th>
				</tr>
			</tfoot>
			<tbody>

				<c:forEach var="item" items="${items.content}" varStatus="i">
					<tr>
						<td>
							<img class="img-fluid" src="<c:url value='/uploads/product/${item.fav.images !=null?item.fav.images:"default.jpg"}'/>" width="80px">
						</td>
						<td class="h6">${item.name}</td>
						<td class="h6 text-danger">${item.count} 
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart ms-2" viewBox="0 0 16 16">
							  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
							</svg>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="text-danger">
			<h5>Trang: ${items.number+1} || Tổng số trang:
				${items.totalPages}</h5>
		</div>
		<div class="text-end">
			<a class="btn btn-dark ${items.number-1 < 0?' disabled':''}"
				href="/DTNsShop/admin/report-manager.html/sort?field=${field2}&sort=0&p=0">First</a>
			<a class="btn btn-dark  ${items.number-1 < 0?'disabled':''} "
				href="/DTNsShop/admin/report-manager.html/sort?field=${field2}&sort=0&p=${items.number-1 < 0?'0':items.number-1}">Previous</a>
			<a
				class="btn btn-dark  ${items.number+1 > items.totalPages - 1 ?'disabled':''}"
				href="/DTNsShop/admin/report-manager.html/sort?field=${field2}&sort=0&p=${items.number+1 > items.totalPages - 1 ? items.totalPages - 1: items.number+1}">Next</a>
			<a
				class="btn btn-dark  ${items.number+1 > items.totalPages - 1 ?'disabled':''}"
				href="/DTNsShop/admin/report-manager.html/sort?field=${field2}&sort=0&p=${items.totalPages-1}">Last</a>
		</div>
	</div>
</div>