<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Page Header-->
<header class="bg-white shadow-sm px-4 py-3 z-index-20">
	<div class="container-fluid px-0">
		<h2 class="mb-0 p-1">Product Manager</h2>
	</div>
</header>
<!-- Breadcrumb-->
<div class="bg-white">
	<div class="container-fluid">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 py-3">
				<li class="breadcrumb-item"><a class="fw-light"
					href="/DTNsShop/admin">Trang chủ</a></li>
				<li class="breadcrumb-item fw-light" aria-current="page">Sản
					Phẩm</li>
				<li class="breadcrumb-item active fw-light" aria-current="page">Form Sản
					Phẩm</li>
			</ol>
		</nav>
	</div>
</div>
<div class="card m-3 mt-3">
<div class="card-header">
	<h5 class="modal-title" id="exampleModalLabel1">
         <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="green" class="bi bi-pen-fill" viewBox="0 0 20 20">
			 <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  			<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
		</svg>
        Thêm sản phẩm
        </h5>
</div>
	<form class="card-body container" method="post" enctype="multipart/form-data">
        <div class="row">
                    <div class="col-8">
                        <div class="row">
                            <div class="mb-3 col-6">
                                <label for="exampleInputMaSP" class="form-label">*Tên Sản Phẩm:</label>
                                <input type="text" class="form-control" id="name2" name="name2"
                                    aria-describedby="emailHelp" value="${product_temp.name}">
                                 <div class="text-danger mt-1" ${messageN2==null?'hidden':''} style="font-size: 13px;">
					                ${messageN2}
					            </div>
                            </div>
                            <div class="mb-3 col-6">
                                <label for="exampleInputMaSP" class="form-label">*Danh mục:</label><br>
                                <select class="form-select" id="category1" name="category2" >
                                     <option ${product_temp.category.id != null?'':'selected'} value="">Chọn danh mục...</option>
                                    <c:forEach var="item" items="${category}">
                                    	<option value="${item.id}" ${product_temp.category.id == item.id?'selected':''}>${item.name}</option>
                                    </c:forEach>
                                </select>
                                 <div class="text-danger mt-1" ${messageC2==null?'hidden':''} style="font-size: 13px;">
					                ${messageC2}
					            </div>
                            </div>
                       <div class="mb-3 col-6">
                                <label for="exampleInputMaSP" class="form-label">*Số lượng:</label>
                                <input type="number" class="form-control" id="amount" name="amount2"
                                    aria-describedby="emailHelp" value="${product_temp.amount != null?product_temp.amount:'0'}" min="0" max="99">
                                <div class="text-danger mt-1" ${messageA2==null?'hidden':''} style="font-size: 13px;">
					                ${messageA2}
					            </div>
                            </div>
                            <div class="mb-3 col-6">
                                <label for="exampleInputMaSP" class="form-label">*Đơn giá:</label>
                                <input type="number" class="form-control" id="price2" name="price2" value="${product_temp.price != null?product_temp.price:'0'}" min="0" max="999999"
                                    aria-describedby="emailHelp" value="${product_temp.name}">
                                <div class="text-danger mt-1" ${messageP2==null?'hidden':''} style="font-size: 13px;">
					                ${messageP2}
					            </div>
                            </div>
                            <div class="mb-3 col-6">
                                <label for="exampleInputMaSP" class="form-label">*Trạng thái:</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="available2" id="inlineRadio2"
                                        value="true" ${product_temp.available?'checked':''}>
                                    <label class="form-check-label" for="inlineRadio2" style="font-size:15px;">Kinh
                                        doanh</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="available2" id="inlineRadio1"
                                        value="false" ${product_temp.available?'':'checked'}>
                                    <label class="form-check-label" for="inlineRadio1" style="font-size:15px;">Ngừng
                                        kinh doanh</label>
                                </div>
                            </div>
                            
                            <div class="mb-3 col-6">
                                <label for="exampleFormControlTextarea1" class="form-label">*Mô tả:</label>
                                <textarea class="form-control" id="review2" name="review2" rows="3">${product_temp.review}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 col-4 text-center">
                        <img class="img-fluid" src="<c:url value='/uploads/product/${product_temp.images != null?product_temp.images:"default.jpg"}'/>" width="250px">
                        <div class="mb-3 col-12">
                            <label for="exampleFormControlTextarea1" class="form-label">*Ảnh sản phẩm:</label>
                            <input type="file" class="form-control" id="inputGroupFile01" name="attach1">
                        </div>
                    </div>
                </div>
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
				<div class="card-footer text-end">
		        <button formaction="/DTNsShop/admin/product-manager.html/add" class="btn btn-success">
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
		       Add
		        </button>
		        <button formaction="/DTNsShop/admin/product-manager.html"class="btn btn-info" data-bs-dismiss="modal">
		        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
				</svg>
		          Reset
		        </button>
		        <button type="submit" class="btn btn-danger" formaction="/DTNsShop/admin/product-list.html">
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z"/>
				</svg>
		       		Product list
		        </button>
     		 </div>
			</form>
      </div>