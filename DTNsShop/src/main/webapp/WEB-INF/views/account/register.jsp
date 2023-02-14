<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>DTNsShop - Register</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/common/account/head.jsp"%>
</head>
<body class="body2">
<!-- Preloader -->
  <div class="preloader">
    <div class="preloader-inner">
      <div class="preloader-icon">
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- End Preloader -->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 register-form container">
				<form class="login100-form validate-form" method="post">
					<div class="row alert alert-danger align-items-center bg-white text-danger mb-2" role="alert"
					 ${messageU == null && messageF == null && messageP == null
					 && messageCP == null && messagePN == null && messageE == null?'hidden':''} 
					 style="font-size: 13px;">
								<div>${messageU}</div>
								<div>${messageF}</div>
								<div>${messagePN}</div>
								<div>${messageE}</div>
								<div>${messageP}</div>
								<div>${messageCP}</div>
					</div>
					<div class="alert alert-success align-items-center text-success m-0" role="alert" ${message == null?'hidden':''} style="font-size: 13px;">
						 	<div class="d-flex">
						 		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-circle me-2" viewBox="0 0 20 20">
								  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
								</svg>
						 		${message}
						 	</div>
						</div>
					<div class="row">
						<span class="login100-form-title p-b-26 text-white col-4">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Register
						</span>
						<div class="col-8"></div>
						<div class="mr-3"></div>
						<div class="wrap-input100 col-5"
							>
							<span class="btn-show"> <i class="fa fa-user"
								aria-hidden="true"></i>
							</span> <input class="input100 text-white" type="text" name="username" value="${sessionScope.user_temp2.username}">
							<span class="focus-input100" data-placeholder="Username"></span>
						</div>
						<div class="col-1"></div>
						<div class="wrap-input100 col-5">
							<span class="btn-show"> 
								<i class="fa fa-id-card" aria-hidden="true"></i>
							</span> <input class="input100 text-white" type="text" name="fullname" value="${sessionScope.user_temp2.fullname}">
							<span class="focus-input100" data-placeholder="Fullname"></span>
						</div>
						<div class="wrap-input100 col-5 ml-3">
							<span class="btn-show"> 
								<i class="fa fa-phone" aria-hidden="true"></i>
							</span> <input class="input100 text-white" type="text" name="phonenumber" value="${sessionScope.user_temp2.phonenumber}">
							<span class="focus-input100" data-placeholder="Phone Number"></span>
						</div>
						<div class="col-1"></div>
						<div class="wrap-input100 col-5">
							<span class="btn-show"> <i class="fa fa-envelope-o"
								aria-hidden="true"></i>
							</span> <input class="input100 text-white" type="text" name="email" value="${sessionScope.user_temp2.email}">
							<span class="focus-input100" data-placeholder="Email"></span>
						</div>
						<div class="wrap-input100 col-5 ml-3">
							<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
							</span> <input class="input100" type="password" name="password"> <span
								class="focus-input100" data-placeholder="Password"></span>
						</div>
						<div class="col-1"></div>
						<div class="wrap-input100 col-5">
							<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
							</span> <input class="input100" type="password" name="confirmPassword">
							<span class="focus-input100" data-placeholder="Confirm Password"></span>
						</div>
					</div>

					<div class="row">
						<div class="col-3"></div>
						<div class="container-login100-form-btn col-6">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button class="login100-form-btn">Đăng
									ký</button>
							</div>
						</div>
						<div class="col-3"></div>
					</div>
					<div class="text-center mt-1">
						<span class="txt1"> Bạn đã có tài khoản? </span> <a class="txt2"
							href="login"> Đăng nhập ngay... </a>
					</div>
				</form>
				<div class="mt-1">
					<a class="txt2 text-danger" href="index.html"> <i
						class="fa fa-undo" aria-hidden="true"></i> Về trang chủ
					</a>
				</div>

			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<%@ include file="/WEB-INF/common/account/foot.jsp"%>
</body>
</html>