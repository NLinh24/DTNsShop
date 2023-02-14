<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>DTNsShop - Login</title>
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
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post">
					<span class="login100-form-title p-b-26 text-white"> <i
						class="fa fa-user-circle" aria-hidden="true"></i>
						<h2>Login</h2>
					</span>

					<div class="wrap-input100">
						<span class="btn-show"> <i class="fa fa-user"
							aria-hidden="true"></i>
						</span> <input class="input100 text-white" type="text" name="username" value="${sessionScope.user_temp}">
						<span class="focus-input100" data-placeholder="Username"></span>
					</div>
					<div class="wrap-input100">
						<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
						</span> <input class="input100" type="password" name="password"> <span
							class="focus-input100" data-placeholder="Password"></span>
					</div>
					<div class="alert alert-danger align-items-center bg-white text-danger m-0" role="alert" ${messageU == null && messageP == null?'hidden':''} style="font-size: 13px;">
					 	<div>${messageU}</div>
					 	<div>${messageP}</div>
					</div>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">Đăng nhập</button>
						</div>
					</div>
					<div class="text-center mt-1">
						<span class="txt1"> Bạn chưa có tài khoản? </span> <a class="txt2"
							href="register"> Đăng ký ngay... </a>
					</div>
					<div class="text-center mt-1">
						<a class="txt2" href="forgotPass"> Quên mật khẩu? </a>
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