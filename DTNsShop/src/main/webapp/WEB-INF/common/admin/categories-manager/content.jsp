<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page Header-->
<header class="bg-white shadow-sm px-4 py-3 z-index-20">
	<div class="container-fluid px-0">
		<h2 class="mb-0 p-1">Categories Manager</h2>
	</div>
</header>
<!-- Breadcrumb-->
<div class="bg-white">
	<div class="container-fluid">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 py-3">
				<li class="breadcrumb-item"><a class="fw-light"
					href="/DTNsShop/admin">Trang chủ</a></li>
				<li class="breadcrumb-item  fw-light" aria-current="page">Danh Mục</li>
				<li class="breadcrumb-item active fw-light" aria-current="page">Loại
					sản phẩm</li>
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
				d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  			<path
				d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
		</svg>
		Thêm danh mục
		</h5>
	</div>
	<div class="card-body container">
		<!--Form -->
		<!--Form -->
		<form class="row" method="post">
			<div class="mb-3 col-12">
						<label for="exampleInputMaSP" class="form-label">*ID:</label> <input
							type="text" class="form-control" name="id"
							value="${category_temp2.id}">
						<div class="text-danger mt-1" ${messageI1 == null?' hidden':''}
							style="font-size: 13px;">${messageI1}</div>
					</div>
					<div class="mb-3 col-12">
						<label for="exampleInputMaSP" class="form-label">*Tên danh
							mục:</label> <input type="text" class="form-control"
							id="exampleInputMaSP" aria-describedby="emailHelp" name="name"
							value="${category_temp2.name}">
						<div class="text-danger mt-1" ${messageN1==null?'hidden':''}
							style="font-size: 13px;">${messageN1}</div>

					</div>
					<div class="ms-3 text-start alert alert-success text-success" role="alert"
                    ${message==null?'hidden':''} style="font-size: 13px;width: 80%">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                        class="bi bi-check-circle me-2" viewBox="0 0 20 20">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path
                            d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                    </svg>
                    ${message}
                </div>
			<div class="card-footer text-end">
		        <button formaction="/DTNsShop/admin/categories-manager.html/add" class="btn btn-success">
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
		       Add
		        </button>
		        <button formaction="/DTNsShop/admin/categories-manager.html" class="btn btn-info" data-bs-dismiss="modal">
		        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
				</svg>
		          Reset
		        </button>
		        <button type="submit" class="btn btn-danger" formaction="/DTNsShop/admin/categories-list.html">
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
		       		Categories list
		        </button>
     		 </div>
		</form>
	</div>
</div>