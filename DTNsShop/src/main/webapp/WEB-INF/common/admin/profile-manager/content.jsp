<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page Header-->
<header class="bg-white shadow-sm px-4 py-3 z-index-20">
	<div class="container-fluid px-0">
		<h2 class="mb-0 p-1">Profile Manager</h2>
	</div>
</header>
<!-- Breadcrumb-->
<div class="bg-white">
	<div class="container-fluid">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 py-3">
				<li class="breadcrumb-item"><a class="fw-light"
					href="/DTNsShop/admin">Trang chủ</a></li>
				<li class="breadcrumb-item active fw-light" aria-current="page">Thông
					tin Admin</li>
			</ol>
		</nav>
	</div>
</div>
<!-- content -->
<div class="card m-auto mt-5 w-50">
	<div class="card-header">
		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
			fill="green" class="bi bi-pen-fill" viewBox="0 0 20 20">
			   <path
				d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z" />
		</svg>
		Thông tin Admin
		</h5>
	</div>
	<div class="card-body container">
		<form class="row" method="post">
			<div class="mb-3 col-6">
				<img width="100%" class="img-fluid"
					src="<c:url value='/uploads/user/${user.photo != null?user.photo:"default.jpg"}'/>">
			</div>
			<ul class="mb-3 col-6">
				<li>Họ tên: ${user.fullname}</li>
				<li>Email: ${user.phonenumber}</li>
				<li>Số điện thoại: ${user.email}</li>
			</ul>
		</form>
	</div>
	<div class="card-footer text-end"></div>
</div>