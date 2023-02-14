<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<!-- Page Header-->
<header class="bg-white shadow-sm px-4 py-3 z-index-20">
	<div class="container-fluid px-0">
		<h2 class="mb-0 p-1">Order Manager</h2>
	</div>
</header>
<!-- Breadcrumb-->
<div class="bg-white">
	<div class="container-fluid">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 py-3">
				<li class="breadcrumb-item"><a class="fw-light"
					href="/DTNsShop/admin">Trang chủ</a></li>
					<li class="breadcrumb-item active fw-light" aria-current="page">Đơn Hàng</li>
				<li class="breadcrumb-item active fw-light" aria-current="page">Danh sách đơn hàng đang chờ</li>
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
				<a class="btn btn-primary" style="width:220px;font-size:16px;" href="/DTNsShop/admin/order-manager.html">
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
		       		Đơn hàng đang chờ
	  			</a>
	  			<a class="btn btn-success" style="width:200px;font-size:16px;" href="/DTNsShop/admin/order-delivered.html">
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
		       		Đơn hàng đã giao
	  			</a>
	</div>
</div>
<div class="card m-3 mt-3">
 <div class="card-header container">
                <div class="row">
                    <div class="col-6 p-2">
                        <i class="fas fa-table me-1"></i> DANH SÁCH ĐƠN HÀNG ĐÃ HỦY
                    </div>
                    <div class="col-2"></div>
                    <form action="" method="post" class="col-4 d-flex">
                        <input class="form-control me-1" name="keywords" type="text" placeholder="Tìm kiếm theo tên khách hàng..."
                            value="${keywords_order3}">
                        <button class="btn btn-outline-dark">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-search" viewBox="0 0 16 16">
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                            </svg>
                        </button>
                    </form>
                </div>
            </div>
<div class="card-body"><!--<td class="text-danger">${item.cancelorder?'Đã hủy':'Đang chờ...'}</td>  -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th>
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=id&sort=${sort}&p=${number}">
						ID
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</a>
				</th>
				<th class="text-dark">
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=account.fullname&sort=${sort}&p=${number}">
						Khách hàng
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</a>
				</th>
				<th>
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=createdate&sort=${sort}&p=${number}">
					Ngày đặt hàng
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</a>
				</th>
				<th>
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=address&sort=${sort}&p=${number}">
					Địa chỉ
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</a>
				</th>
				<th class="text-danger">
					Trạng thái
				</th>
				<th>Hoạt động</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=id&sort=${sort}&p=${number}">
					ID
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</a>
				</th>
				<th class="text-dark">
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=account.fullname&sort=${sort}&p=${number}">
						Khách hàng
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</a>
				</th>
				<th>
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=createdate&sort=${sort}&p=${number}">
						Ngày đặt hàng
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
							</svg>
					</a>
				</th>
				<th>
					<a class="text-dark" href="/DTNsShop/admin/order-cancel.html/sort?field=address&sort=${sort}&p=${number}">
						Địa chỉ
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</a>
				</th>
				<th class="text-danger">
					Trạng thái
				</th>
				<th>Hoạt động</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach var="item" items="${orders.content}" varStatus="i">
				<tr>
					<td class="h6">DH00${item.id}</td>
					<td class="text-dark h6">
							<img alt="logo" src="/uploads/user/${item.account.photo}" class="img-fluid rounded-circle" width="54px">
							${item.account.fullname}
							(TK: ${item.account.username})
					</td>
					<td>
						<fmt:formatDate value="${item.createdate}" pattern="dd-MM-yyyy"/>
					</td>
					<td>${item.address}</td>
					<td class="text-danger">${item.cancelorder?'Đã hủy':'Đang chờ...'}</td>
					<td class="text-start">
						<a class="btn btn-primary" style="width:100px;font-size:13px;" href="/DTNsShop/admin/order-details/${item.id}">Chi tiết</a>
					</td>
				</tr>
				</c:forEach>
		</tbody>
	</table>
	<div class="text-danger">
                    <h5>Trang: ${orders.number+1} || Tổng số trang:
                        ${orders.totalPages}</h5>
                </div>
                <div class="text-end">
                    <a class="btn btn-dark ${orders.number-1 < 0?' disabled':''}"
                href="/DTNsShop/admin/order-cancel.html/sort?field=${field2}&sort=0&p=0">First</a>
                <a class="btn btn-dark  ${orders.number-1 < 0?'disabled':''} "
                    href="/DTNsShop/admin/order-cancel.html/sort?field=${field2}&sort=0&p=${orders.number-1 < 0?'0':orders.number-1}">Previous</a>
                <a class="btn btn-dark  ${orders.number+1 > orders.totalPages - 1 ?'disabled':''}"
                    href="/DTNsShop/admin/order-cancel.html/sort?field=${field2}&sort=0&p=${orders.number+1 > orders.totalPages - 1 ? orders.totalPages - 1: orders.number+1}">Next</a>
                <a class="btn btn-dark  ${orders.number+1 > orders.totalPages - 1 ?'disabled':''}"
                    href="/DTNsShop/admin/order-cancel.html/sort?field=${field2}&sort=0&p=${orders.totalPages-1}">Last</a>
</div>
</div>
</div>
<%-- <div class="card m-3 mt-3">
<div class="card-header">
	<i class="fas fa-table me-1"></i> DANH SÁCH ĐƠN HÀNG ĐÃ HỦY
</div>
<div class="card-body">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Khách hàng</th>
				<th>Ngày đặt</th>
				<th>Địa chỉ</th>
				<th>Trạng thái</th>
				<th>Hoạt động</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${orders2}">
				<tr>
					<td>${item.id}</td>
					<td>${item.account.fullname}</td>
					<td>${item.createdate}</td>
					<td>${item.address}</td>
					<td>${item.cancelorder?'Đã hủy':'Đang chờ...'}</td>
					<td class="text-start">
						<button class="btn btn-primary" style="width:100px;font-size:13px;" data-bs-toggle="modal" data-bs-target="#exampleModal1">
							 <!-- <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
							  <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
							</svg> -->
							Chi tiết
						</button>
					</td>
				</tr>
				</c:forEach>
		</tbody>
	</table>
</div>
</div> --%>
<!-- Modal Edit -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"><!-- modal-xl  -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="blue" class="bi bi-pen-fill" viewBox="0 0 20 20">
			 <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>			</svg>
       	Thông tin đơn hàng
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body container">
            <h3>Chức năng đang cập nhật !</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
			<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
		</svg>
        Save Change
        </button>
        <button type="button" class="btn btn-info" data-bs-dismiss="modal">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
			 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
		</svg>
        Cancel
        </button>
      </div>
    </div>
  </div>
</div>
