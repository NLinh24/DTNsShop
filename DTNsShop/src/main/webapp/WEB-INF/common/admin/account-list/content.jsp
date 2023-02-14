<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/common/taglib.jsp" %>
        <!-- Page Header-->
        <header class="bg-white shadow-sm px-4 py-3 z-index-20">
            <div class="container-fluid px-0">
                <h2 class="mb-0 p-1">Account List</h2>
            </div>
        </header>
        <!-- Breadcrumb-->
        <div class="bg-white">
            <div class="container-fluid">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 py-3">
                        <li class="breadcrumb-item"><a class="fw-light" href="/DTNsShop/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item fw-light" aria-current="page">Người
                            Dùng</li>
                        <li class="breadcrumb-item active fw-light" aria-current="page">Danh
                            sách người dùng</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- content -->
        <div class="card m-3 mt-3">
            <div class="card-header  text-end">
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
                <button class="mt-3 btn btn-success" style="width: 180px; font-size: 14px;" data-bs-toggle="modal"
                    data-bs-target="#exampleModalThem">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                        class="bi bi-pen-fill" viewBox="0 0 20 20">
                        <path
                            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                    </svg>
                    Thêm người dùng
                </button>
            </div>
        </div>
        <div class="card m-3 mt-3">
            <div class="card-header container">
                <div class="row">
                    <div class="col-6 p-2">
                        <i class="fas fa-table me-1"></i> DANH SÁCH NGƯỜI DÙNG
                    </div>
                    <div class="col-2"></div>
                    <form action="" method="post" class="col-4 d-flex">
                        <input class="form-control me-1" name="keywords" type="text" placeholder="Tìm kiếm theo tên..."
                            value="${keywords}">
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
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>
                            <a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=username&sort=${sort}&p=${number}">
                                    ID
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                             </a>
                            </th>
                            <th>Hình ảnh</th>
                            <th><a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=fullname&sort=${sort}&p=${number}">Họ
                                    tên
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                                    </a></th>
                            <th><a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=phonenumber&sort=${sort}&p=${number}">SDT
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                                    </a>
                            </th>
                            <th><a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=email&sort=${sort}&p=${number}">Email
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                                    </a>
                            </th>
                            <th class="text-danger"><a  class="text-danger" href="/DTNsShop/admin/account-list.html/sort?field=admins&sort=${sort}&p=${number}">Vai
                                    trò
                                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg> 
                                  </a></th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                    	<tr>
                            <th>
                            <a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=username&sort=${sort}&p=${number}">
                                    ID
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                             </a>
                            </th>
                            <th>Hình ảnh</th>
                            <th><a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=fullname&sort=${sort}&p=${number}">Họ
                                    tên
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                                    </a></th>
                            <th><a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=phonenumber&sort=${sort}&p=${number}">SDT
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                                    </a>
                            </th>
                            <th><a class="text-dark"
                                    href="/DTNsShop/admin/account-list.html/sort?field=email&sort=${sort}&p=${number}">Email
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg>
                                    </a>
                            </th>
                            <th class="text-danger"><a  class="text-danger" href="/DTNsShop/admin/account-list.html/sort?field=admins&sort=${sort}&p=${number}">Vai
                                    trò
                                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-up" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"/>
									</svg> 
                                  </a></th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>

                        <c:forEach var="item" items="${items.content}" varStatus="i">
                            <tr>
                                <td class="h6">${item.username}</td>
                                <td>
                                    <img class="img-fluid rounded-circle" src="<c:url value='/uploads/user/${item.photo==""?"default.jpg":item.photo}'/>"
                                        width="80px">
                                </td>
                                <td class="h6">${item.fullname}</td>
                                <td>${item.phonenumber}</td>
                                <td>${item.email}</td>
                                <td class="text-danger h6">${item.admins?'Admin':'User'}</td>
                                <td>
                                    <button data-bs-toggle="modal" data-bs-target="#EditModal${i.count}"
                                        class="btn btn-primary" style="width: 70px; font-size: 13px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
                                            <path
                                                d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z" />
                                        </svg>
                                        Edit
                                    </button>
                                    <button class="ms-1 btn btn-danger" style="width: 70px; font-size: 13px;"
                                        data-bs-toggle="modal" data-bs-target="#exampleModal${i.count}"
                                        ${item.admins?'hidden':''}>
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
                                    <!-- Modal Edit -->
                                    <div class="modal fade ${showEdit?'show':''}" id="EditModal${i.count}" tabindex="-1"
                                        aria-labelledby="EditModalLabel${i.count}" ${showEdit?'aria-modal="true"
                                        role="dialog" style="display: block;background:rgba(0, 0, 0, 0.230);"':'
                                        aria-hidden="true"'}>
                                            <form  enctype="multipart/form-data" method="post" class="modal-dialog modal-xl modal-dialog-centered" >
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="EditModalLabel${i.count}">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20"
                                                                height="20" fill="blue" class="bi bi-pen-fill"
                                                                viewBox="0 0 20 20">
                                                                <path
                                                                    d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                                <path fill-rule="evenodd"
                                                                    d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                                            </svg>
                                                            Cập nhật thông tin người dùng
                                                        </h5>
                                                        <button ${showEdit?'
                                        formaction="/DTNsShop/admin/account-list.html/cancel"':''} class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                    </div>
                                                    <div class="container">
                                                        <!--Form -->
                                                        <div class="modal-body row">
                                                            <div class="col-8">
                                                                <div class="row">
                                                                    <div class="mb-3 col-6">
                                                                        <label for="exampleInputMaSP"
                                                                            class="form-label">*ID:</label> <input
                                                                            type="text" class="form-control"
                                                                            id="username" name="username3"
                                                                            aria-describedby="emailHelp"
                                                                           value="${items2.username != null?items2.username:item.username}" disabled="disabled">
                                                                    </div>
                                                                    <div class="mb-3 col-6">
                                                                        <label for="exampleInputMaSP"
                                                                            class="form-label">*Họ
                                                                            tên:</label> <input type="text"
                                                                            class="form-control"
                                                                             id="fullname3"
                                                                            name="fullname3" value="${items2 != null?items2.fullname:item.fullname}">
                                                                            <div class="text-danger mt-1"
																							 ${messageF2 == null?' hidden':''} style="font-size: 13px;">
																		            ${messageF2}
																		        </div>
                                                                    </div>
                                                                    <div class="mb-3 col-6">
                                                                        <label for="exampleInputMaSP"
                                                                            class="form-label">*Số
                                                                            điện thoại:</label> <input type="text"
                                                                            class="form-control" id="phonenumber"
                                                                            name="phonenumber3"
                                                                            aria-describedby="emailHelp"
                                                                            value="${items2 != null?items2.phonenumber:item.phonenumber}">
                                                                    		<div class="text-danger mt-1"
																							 ${messagePN2 == null?' hidden':''} style="font-size: 13px;">
																		            ${messagePN2}
																		        </div>
                                                                    </div>
                                                                     <div class="mb-3 col-6">
                                                                        <label for="exampleInputMaSP"
                                                                            class="form-label">*Email:</label>
                                                                        <input type="text" class="form-control"
                                                                            id="email" name="email3"
                                                                            value="${items2 != null?items2.email:item.email}"
                                                                            aria-describedby="emailHelp">
                                                                            <div class="text-danger mt-1"
																							 ${messageE2 == null?' hidden':''} style="font-size: 13px;">
																		            ${messageE2}
																		        </div>
                                                                    </div>
                                                                     <div class="mb-3 col-6" hidden>
																	    <label for="exampleInputMaSP" class="form-label">*Vai trò:</label><br>
																	    	 <div class="form-check form-check-inline">
																				 <input  class="form-check-input" type="radio" name="admins3" id="inlineRadio4" value="true" ${items2 != null?items2.admins?'
                                        checked':'':item.admins?'checked':''}>
                                        <label class="form-check-label" for="inlineRadio4"
                                            style="font-size:15px;">Admin</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="admins3" id="inlineRadio3"
                                            value="false" ${items2
                                            !=null?items2.admins?'':'checked':item.admins?'':'checked'}
                                            >
                                        <label class="form-check-label" for="inlineRadio3"
                                            style="font-size:15px;">User</label>
                                    </div>
            </div>
            <div class="mb-3 col-6" ${items2
                        !=null?items2.active?'hidden':'':item.active?'hidden':''}>
                <label for="exampleInputMaSP" class="form-label">*Trạng thái:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="active3" id="inlineRadio2" value="true" ${items2
                        !=null?items2.active?'checked':'':item.active?'checked':''}>
                    <label class="form-check-label" for="inlineRadio2" style="font-size:15px;">Hoạt động</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="active3" id="inlineRadio1" value="false" ${items2
                        !=null?items2.active?'':'checked':item.active?'':'checked'}>
                    <label class="form-check-label" for="inlineRadio1" style="font-size:15px;">Ngừng hoạt động</label>
                </div>
            </div>
        </div>
        </div>
        <div class="mb-3 col-4 text-center">
            <img class="img-fluid"
                src="<c:url value='/uploads/user/${items2.photo !=null || item2.photo == ""?items2.photo:item.photo!=null || item.photo == ""?item.photo:"default.jpg"}' />" width="240px">
            <div class="mb-3 col-12">
                <label for="exampleFormControlTextarea1" class="form-label">*Ảnh người dùng:</label>
                <input type="file" class="form-control" id="inputGroupFile01" name="attach3">
            </div>
        </div>
        <div class="alert alert-success text-success col-4" role="alert"
                    ${message1==null?'hidden':''} style="font-size: 13px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                        class="bi bi-check-circle me-2" viewBox="0 0 20 20">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path
                            d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                    </svg>
                    ${message1}
                </div>
        </div>

        <div class="modal-footer">
            <div class="text-end">
            	<button class="btn btn-success"
               formaction="/DTNsShop/admin/account-list.html/update/${items2.username != null?items2.username:item.username}">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                    class="bi bi-pen-fill" viewBox="0 0 20 20">
                    <path
                        d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
                </svg>
                Save Change
            </button>
            <button class="btn btn-info" data-bs-dismiss="modal"
                ${showEdit?'formaction="/DTNsShop/admin/account-list.html/cancel"':''}>
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="20"
                                                                    height="20" fill="currentColor"
                                                                    class="bi bi-pen-fill" viewBox="0 0 20 20">
                                                                    <path
                                                                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
                                                                </svg>
                                                                Cancel
                                                            </button>
            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                        </form>
					                </div>
                    <!-- Modal Delete -->
                    <div class="modal fade" id="exampleModal${i.count}" tabindex="-1"
                        aria-labelledby="exampleModalLabel${i.count}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel${i.count}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red"
                                            class="bi bi-pen-fill" viewBox="0 0 20 20">
                                            <path
                                                d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                            <path
                                                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                        </svg>
                                        Xóa người dùng!
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body text-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="crimson"
                                        class="bi bi-pen-fill" viewBox="0 0 20 20">
                                        <path
                                            d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                        <path
                                            d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                    </svg>
                                    <h5 class="text-gray">Bạn chắc chắn muốn xóa
                                        ${item.username}?</h5>
                                </div>
                                <form class="modal-footer" method="post">
                                    <button class="btn btn-danger" formaction="/DTNsShop/admin/account-list.html/delete/${item.username}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
                                            <path
                                                d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                            <path
                                                d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                                        </svg>
                                        Yes
                                    </button>
                                    <button type="button" class="btn btn-info" data-bs-dismiss="modal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
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
                href="/DTNsShop/admin/account-list.html/sort?field=${field2}&sort=0&p=0">First</a>
                <a class="btn btn-dark  ${items.number-1 < 0?'disabled':''} "
                    href="/DTNsShop/admin/account-list.html/sort?field=${field2}&sort=0&p=${items.number-1 < 0?'0':items.number-1}">Previous</a>
                <a class="btn btn-dark  ${items.number+1 > items.totalPages - 1 ?'disabled':''}"
                    href="/DTNsShop/admin/account-list.html/sort?field=${field2}&sort=0&p=${items.number+1 > items.totalPages - 1 ? items.totalPages - 1: items.number+1}">Next</a>
                <a class="btn btn-dark  ${items.number+1 > items.totalPages - 1 ?'disabled':''}"
                    href="/DTNsShop/admin/account-list.html/sort?field=${field2}&sort=0&p=${items.totalPages-1}">Last</a>
        </div>
        </div>
        </div>
        <!-- Modal Add -->
        <div class="modal fade ${show?'show':''}" id="exampleModalThem" tabindex="-1"
            aria-labelledby="exampleModalLabelThem" ${show?'aria-modal="true" role="dialog"
            style="display: block;background:rgba(0, 0, 0, 0.400);"':' aria-hidden="true"'}>
            <form class="modal-dialog modal-xl modal-dialog-centered" method="post" enctype="multipart/form-data">
                <div class="modal-content" >
	                   	 <div class="modal-header">
	                        <h5 class="modal-title" id="exampleModalLabel1">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="green"
	                                class="bi bi-pen-fill" viewBox="0 0 20 20">
	                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
	                                <path
	                                    d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
	                            </svg>
	                            Thêm người dùng
	                        </h5>
	                        <button class="btn-close" ${show?' formaction="/DTNsShop/admin/account-list.html/cancel"':''} data-bs-dismiss="modal" aria-label="Close"></button>
	                    </div>
                    <div class="modal-body container">
                        <!--Form -->
                        <div class="row">
                            <div class="col-8">
								<div class="row">
									<div class="mb-3 col-6">
										<label for="exampleInputMaSP" class="form-label">*ID:</label> <input
											type="text" class="form-control" name="username2" value="${user_temp2.username}">
											<div class="text-danger mt-1"
												 ${messageU == null?' hidden':''} style="font-size: 13px;">
            ${messageU}
        </div>
        </div>
        <div class="mb-3 col-6">
            <label for="exampleInputMaSP" class="form-label">*Họ tên:</label>
            <input type="text" class="form-control" id="exampleInputMaSP" aria-describedby="emailHelp" name="fullname2"
                value="${user_temp2.fullname}">
            <div class="text-danger mt-1" ${messageF==null?'hidden':''} style="font-size: 13px;">
                ${messageF}
            </div>
        </div>
        <div class="mb-3 col-6">
            <label for="exampleInputMaSP" class="form-label">*Số điện
                thoại:</label> <input type="text" class="form-control" id="exampleInputMaSP"
                aria-describedby="emailHelp" name="phonenumber2" value="${user_temp2.phonenumber}">
            <div class="text-danger mt-1" ${messagePN==null?'hidden':''} style="font-size: 13px;">
                ${messagePN}
            </div>
        </div>
        <div class="mb-3 col-6">
            <label for="exampleInputMaSP" class="form-label">*Email:</label> <input type="text" class="form-control"
                id="exampleInputMaSP" aria-describedby="emailHelp" name="email2" value="${user_temp2.email}">
            <div class="text-danger mt-1" ${messageE==null?'hidden':''} style="font-size: 13px;">
                ${messageE}
            </div>
        </div>
        <div class="mb-3 col-6">
            <label for="exampleInputMaSP" class="form-label">*Password:</label>
            <input type="password" class="form-control" id="exampleInputMaSP" aria-describedby="emailHelp"
                name="password2">
            <div class="text-danger mt-1" ${messageP==null?'hidden':''} style="font-size: 13px;">
                ${messageP}
            </div>
        </div>
        <div class="mb-3 col-6">
            <label for="exampleInputMaSP" class="form-label">*Nhập Lại
                Password:</label> <input type="password" class="form-control" id="exampleInputMaSP"
                aria-describedby="emailHelp" name="confirmPassword2">
            <div class="text-danger mt-1" ${messageCP==null?'hidden':''} style="font-size: 13px;">
                ${messageCP}
            </div>
        </div>
        <div class="mb-3 col-6">
            <label for="exampleInputMaSP" class="form-label">*Vai trò:</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="admins2" id="inlineRadio4" value="true"
                    ${user_temp2.admins?'checked':''}>
                <label class="form-check-label" for="inlineRadio4" style="font-size: 15px;">Admin</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="admins2" id="inlineRadio3" value="false"
                    ${user_temp2.admins?'':'checked'}>
                <label class="form-check-label" for="inlineRadio3" style="font-size: 15px;">User</label>
            </div>
        </div>
        <div class="mb-3 col-6">
            <label for="exampleInputMaSP" class="form-label">*Trạng thái:</label><br>
            <div class="form-check form-check-inline">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="active2" id="inlineRadio2" value="true"
                        ${user_temp2.active?'checked':''}>
                    <label class="form-check-label" for="inlineRadio2" style="font-size: 15px;">Kích hoạt</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="active2" id="inlineRadio1" value="false"
                        ${user_temp2.active?'':'checked'}>
                    <label class="form-check-label" for="inlineRadio1" style="font-size: 15px;">Chưa kích hoạt</label>
                </div>
            </div>
        </div>
        </div>
        </div>
        <div class="mb-3 col-4 text-center">
            <img class="img-fluid" src="<c:url value='${st==null?"/uploads/user/default.jpg":""}${st}'/>" width="240px">
            <div class="mb-3 col-12">
                <label for="exampleFormControlTextarea1" class="form-label">*Ảnh người dùng:</label>
                <input type="file" class="form-control" id="inputGroupFile01" name="attach2">
            </div>
        </div>
        </div>
        </div>
        <div class="modal-footer bg-white text-end container">
            <div class="col-12">
                <button class="btn btn-success" formaction="/DTNsShop/admin/account-list.html/add">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                        class="bi bi-pen-fill" viewBox="0 0 20 20">
                        <path
                            d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
                    </svg>
                    Save
                </button>
                <button class="btn btn-info" data-bs-dismiss="modal"
                    ${show?'formaction="/DTNsShop/admin/account-list.html/cancel"':''}>
			                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
			                                class="bi bi-pen-fill" viewBox="0 0 20 20">
			                                <path
			                                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
			                            </svg>
			                            Cancel
			                        </button>
	                        	</div>
                    </div>
                </div>
            </form>
        </div>