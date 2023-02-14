<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>DTNsShop - Forgot Password?</title>
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
				<form class="login100-form" method="post">
					<span class="login100-form-title p-b-26 text-white"> 
						<i class="fa fa-key" aria-hidden="true"></i>
						<h4>Forgot Password</h4>
					</span>

					<div class="wrap-input100">
						<span class="btn-show"> <i class="fa fa-user"
							aria-hidden="true"></i>
						</span> <input class="input100 text-white" type="text" name="username"value="${sessionScope.user_temp}">
						<span class="focus-input100" data-placeholder="Your's username"></span>
					</div>

					<div class="wrap-input100">
						<span class="btn-show"> <i class="fa fa-envelope-o"
							aria-hidden="true"></i>
						</span> <input class="input100 text-white" type="text" name="email" value="${sessionScope.email_temp}">
						<span class="focus-input100" data-placeholder="Your's email"></span>
					</div>
					<div class="alert alert-danger align-items-center bg-white text-danger m-0" role="alert" ${messageU == null && messageE == null?'hidden':''} style="font-size: 13px;">
					 	<div>${messageU}</div>
					 	<div>${messageE}</div>
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
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">Submit</button>
						</div>
					</div>
				</form>
				<div class="mt-1">
					<a class="txt2 text-danger" href="login"> <i class="fa fa-undo"
						aria-hidden="true"></i> Về trang login
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<%@ include file="/WEB-INF/common/account/foot.jsp"%>
</body>
</html>