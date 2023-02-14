<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Page Header-->
<header class="bg-white shadow-sm px-4 py-3 z-index-20">
	<div class="container-fluid px-0">
		<h2 class="mb-0 p-1">Colors Manager</h2>
	</div>
</header>
<!-- Breadcrumb-->
<div class="bg-white">
	<div class="container-fluid">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 py-3">
				<li class="breadcrumb-item"><a class="fw-light"
					href="/DTNsShop/admin">Trang chủ</a></li>
				<li class="breadcrumb-item  fw-light" aria-current="page">Màu sắc</li>
				<li class="breadcrumb-item active fw-light" aria-current="page">Form cập nhật</li>
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
		 <a  class="btn btn-danger" href="/DTNsShop/admin/color-list.html" style="width: 180px; font-size: 16px;">
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
								<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"></path>
							</svg>
		       		Colors list
		        </a>
	</div>
</div>
<div class="">
<div class="card m-3 mt-3">
	<div class="card-header">
		 <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="blue" class="bi bi-pen-fill" viewBox="0 0 20 20">
			 <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>			</svg>
        Cập nhật
        </h5>
	</div>
	<div class="card-body container">
		 <!--Form -->
        	 <!--Form -->
        	<form class="row" method="post" enctype="multipart/form-data">
					<div class="mb-3 col-12">
						<label for="exampleInputMaSP" class="form-label">Màu Sắc
							:</label>  
							<select class="form-select" id="color1" name="color" >
                                    <c:forEach var="item" items="${colors}">
                                    	<option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
					</div>
					<div class="mb-3 col-12">
						<label for="exampleInputSP" class="form-label">Sản phẩm
							:</label> 
							 <select class="form-select" id="product" name="product" >
                                    <c:forEach var="item" items="${product}">
                                    	<option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
					</div>
					<div class="mb-3 col-12">
					   <label for="exampleFormControlTextarea1" class="form-label">Chọn hình:</label>
						  <input type="file" class="form-control" id="inputGroupFile01" name="attach">
					</div>
					<div class="card-footer bg-white" >
				        <button formaction="/DTNsShop/admin/product-color.html/update" class="btn btn-success" style="width:150px;"> 
				          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
							<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
						</svg>
				        Save
				        </button>
			      </div>
				</form>
	</div>
</div>
<div class="card m-3 mt-3">
<div class="card-header container">
		<div class="row">
			<div class="col-6 p-2">
				<i class="fas fa-table me-1"></i> DANH SÁCH MÀU SẮC
			</div>
			<div class="col-2"></div>
			<form action="" method="post" class="col-4 d-flex">
				<input class="form-control me-1" name="keywords" type="text"
					placeholder="Tìm kiếm theo tên sản phẩm..." value="${keywords_color2}">
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
				<tr class="bg-danger text-white">
					<th>Hình ảnh</th>
					<th><a class="text-white"
						href="/DTNsShop/admin/product-color.html/sort?field=product.name&sort=${sort}&p=${number}">Sản phẩm
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
						</a>
					</th>
					<th><a class="text-white"
						href="/DTNsShop/admin/product-color.html/sort?field=colors.name&sort=${sort}&p=${number}">Màu sắc
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
						</a>
					</th>
					<th>Action</th>
					<th></th>
				</tr>
			</thead>
			<tfoot>
				<tr class="bg-danger text-white">
					<th>Hình ảnh</th>
					<th><a class="text-white"
						href="/DTNsShop/admin/product-color.html/sort?field=product.name&sort=${sort}&p=${number}">Sản phẩm
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
						</a>
					</th>
					<th><a class="text-white"
						href="/DTNsShop/admin/product-color.html/sort?field=colors.name&sort=${sort}&p=${number}">Màu sắc
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
						</a>
					</th>
					<th>Action</th>
					<th></th>
				</tr>	
			</tfoot>
			<tbody>

				<c:forEach var="item" items="${items.content}" varStatus="i">
					<tr>
						<td class="h6">
							<img src="/uploads/productImg/${item.images}" class="img-fluid" width="64px">
						</td>
						<td class="h6">${item.product.name}</td>
						<td class="h6">${item.colors.name}</td>
						<td>
							<button class="ms-1 btn btn-danger"
								style="width: 100px; font-size: 13px;" data-bs-toggle="modal"
								data-bs-target="#exampleModal${i.count}">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
                                    <path
										d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
										d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                </svg>
								Delete
							</button>
						</td>
						<td>
							 <!-- Modal Delete -->
							<div class="modal fade" id="exampleModal${i.count}" tabindex="-1"
								aria-labelledby="exampleModalLabel${i.count}" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel${i.count}">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="20" fill="red" class="bi bi-pen-fill"
													viewBox="0 0 20 20">
                                            <path
														d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                            <path
														d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                        </svg>
												Thông báo!
											</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body text-center">
											<svg xmlns="http://www.w3.org/2000/svg" width="100"
												height="100" fill="crimson" class="bi bi-pen-fill"
												viewBox="0 0 20 20">
                                                <path
													d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                <path
													d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                            </svg>
											<h5 class="text-gray">Bạn chắc chắn muốn xóa màu sắc của
												"${item.product.name}" ?</h5>
										</div>
										<form class="modal-footer" method="post">
											<button class="btn btn-danger"
												formaction="/DTNsShop/admin/product-color.html/delete/${item.id}">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="20" fill="currentColor" class="bi bi-pen-fill"
													viewBox="0 0 20 20">
                                                    <path
														d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                    <path
														d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                                                </svg>
												Yes
											</button>
											<button type="button" class="btn btn-info"
												data-bs-dismiss="modal">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="20" fill="currentColor" class="bi bi-pen-fill"
													viewBox="0 0 20 20">
                                                    <path
														d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
                                                </svg>
												No
											</button>
										</form>
									</div>
								</div>
							</div>
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
				href="/DTNsShop/admin/product-color.html/sort?field=${field2}&sort=0&p=0">First</a>
			<a class="btn btn-dark  ${items.number-1 < 0?'disabled':''} "
				href="/DTNsShop/admin/product-color.html/sort?field=${field2}&sort=0&p=${items.number-1 < 0?'0':items.number-1}">Previous</a>
			<a
				class="btn btn-dark  ${items.number+1 > items.totalPages - 1 ?'disabled':''}"
				href="/DTNsShop/admin/product-color.html/sort?field=${field2}&sort=0&p=${items.number+1 > items.totalPages - 1 ? items.totalPages - 1: items.number+1}">Next</a>
			<a
				class="btn btn-dark  ${items.number+1 > items.totalPages - 1 ?'disabled':''}"
				href="/DTNsShop/admin/product-color.html/sort?field=${field2}&sort=0&p=${items.totalPages-1}">Last</a>
		</div>
	</div>
</div>
