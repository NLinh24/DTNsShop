<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page Header-->
<header class="bg-white shadow-sm px-4 py-3 z-index-20">
	<div class="container-fluid px-0">
		<h2 class="mb-0 p-1">Account Manager</h2>
	</div>
</header>
<!-- Breadcrumb-->
<div class="bg-white">
	<div class="container-fluid">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 py-3">
				<li class="breadcrumb-item"><a class="fw-light"
					href="/DTNsShop/admin">Trang chủ</a></li>
				<li class="breadcrumb-item fw-light" aria-current="page">Người
					Dùng</li>
				<li class="breadcrumb-item active fw-light" aria-current="page">Form
					Người Dùng</li>
			</ol>
		</nav>
	</div>
</div>
<!-- content -->
<div class="card m-3">
	<div class="card-header">
		<h5 class="modal-title" id="exampleModalLabel1">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
				fill="green" class="bi bi-pen-fill" viewBox="0 0 20 20">
			 <path
					d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  			<path
					d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
		</svg>
			Thêm người dùng
		</h5>
	</div>
	<div class="card-body container">
		<form class="row" method="post" enctype="multipart/form-data">
			<div class="col-8">
				<div class="row">
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*ID:</label> <input
							type="text" class="form-control" id="exampleInputMaSP"
							aria-describedby="emailHelp" name="username" value="${user_temp2.username}">
							<div class="text-danger mt-1"
								 ${messageU == null?'hidden':''} 
								 style="font-size: 13px;">
									${messageU}
							</div>
					</div>
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*Họ tên:</label>
						<input type="text" class="form-control" id="exampleInputMaSP"
							aria-describedby="emailHelp" name="fullname" value="${user_temp2.fullname}">
							<div class="text-danger mt-1"
								 ${messageF == null?'hidden':''} 
								 style="font-size: 13px;">
									${messageF}
							</div>
					</div>
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*Số điện
							thoại:</label> <input type="text" class="form-control"
							id="exampleInputMaSP" aria-describedby="emailHelp" name="phonenumber" value="${user_temp2.phonenumber}">
							<div class="text-danger mt-1"
								 ${messagePN == null?'hidden':''} 
								 style="font-size: 13px;">
									${messagePN}
							</div>
					</div>
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*Email:</label> <input
							type="text" class="form-control" id="exampleInputMaSP"
							aria-describedby="emailHelp" name="email" value="${user_temp2.email}">
							<div class="text-danger mt-1"
								 ${messageE == null?'hidden':''} 
								 style="font-size: 13px;">
									${messageE}
							</div>
					</div>
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*Password:</label>
						<input type="password" class="form-control" id="exampleInputMaSP"
							aria-describedby="emailHelp" name="password">
							<div class="text-danger mt-1"
								 ${messageP == null?'hidden':''} 
								 style="font-size: 13px;">
									${messageP}
							</div>
					</div>
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*Nhập Lại
							Password:</label> <input type="password" class="form-control"
							id="exampleInputMaSP" aria-describedby="emailHelp" name="confirmPassword">
							<div class="text-danger mt-1"
								 ${messageCP == null?'hidden':''} 
								 style="font-size: 13px;">
									${messageCP}
							</div>
					</div>
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*Vai trò:</label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="admins"
								id="inlineRadio4" value="true" ${user_temp2.admins?'checked':''} >
							<label class="form-check-label" for="inlineRadio4"
								style="font-size: 15px;">Admin</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="admins"
								id="inlineRadio3" value="false" ${user_temp2.admins?'':'checked'}>
							<label class="form-check-label" for="inlineRadio3"
								style="font-size: 15px;">User</label>
						</div>
					</div>
					<div class="mb-3 col-6">
						<label for="exampleInputMaSP" class="form-label">*Trạng thái:</label><br>
						<div class="form-check form-check-inline">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="active"
									id="inlineRadio2" value="true"  ${user_temp2.active?'checked':''}>
								<label class="form-check-label" for="inlineRadio2"
									style="font-size: 15px;">Hoạt động</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="active"
									id="inlineRadio1" value="false" ${user_temp2.active?'':'checked'}>
								<label class="form-check-label" for="inlineRadio1"
									style="font-size: 15px;">Ngừng hoạt động</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mb-3 col-4 text-center">
			   		<img class="img-fluid" src="<c:url value='${st==null?"/uploads/user/default.jpg":""}${st}'/>" width="240px">
			   		<div class="mb-3 col-12">
					   <label for="exampleFormControlTextarea1" class="form-label">*Ảnh người dùng:</label>
						<input type="file" class="form-control" id="inputGroupFile01" name="attach">
					</div>
			</div>	
			<div class="card-footer bg-white text-end row">
				<div class="col-4">
					<div class="alert alert-success text-success" role="alert" ${message == null?'hidden':''} style="font-size: 13px;">
						 	<div class="d-flex">
						 		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-circle me-2" viewBox="0 0 20 20">
								  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
								</svg>
						 		${message}
						 	</div>
				</div>
				</div>
				<div class="col-8">
				<button  class="btn btn-success" formaction="/DTNsShop/admin/account-manager.html/add">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path
							d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
				</svg>
					Add
				</button>
				<button class="btn btn-info" data-bs-dismiss="modal" formaction="/DTNsShop/admin/account-manager.html">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					 <path
							d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
				</svg>
					Reset
				</button>
				<button type="submit" class="btn btn-danger"
					formaction="/DTNsShop/admin/account-list.html">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
					<path
							d="M2 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H9.5a1 1 0 0 0-1 1v7.293l2.646-2.647a.5.5 0 0 1 .708.708l-3.5 3.5a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L7.5 9.293V2a2 2 0 0 1 2-2H14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h2.5a.5.5 0 0 1 0 1H2z" />
				</svg>
					Account list
				</button>
				</div>
			</div>
		</form>
	</div>

</div>