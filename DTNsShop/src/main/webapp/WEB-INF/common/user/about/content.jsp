<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="m-5"></div>
<!-- Breadcrumbs -->
<div class="breadcrumbs mt-3">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<ul class="bread-list">
						<li><a href="/DTNsShop/index.html">Trang chủ<i
								class="ti-arrow-right"></i></a></li>
						<li class="active"><a href="#">Giới thiệu</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->
<!-- Page Content -->
<div class="container mt-4">
<!-- 	<div class="row bg-primary p-2 text-white">
		<h5>GIỚI THIỆU</h5>
	</div> -->
	<div class="row mt-2 mb-2">
		<div class="col-2"></div>
		<div class="col-8 card bg-danger">
			<div class="card-body text-white">
				DTNsShop là trang web bán hàng miễn phí! Tối ưu hiệu quả, tối đa lợi nhuận, quản lý lên đơn nhanh chóng. Giao diện thân thiện- Đơn giản- Dễ sử dụng.
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	<div class="row bg-danger p-2 text-white">
		<h5>NHÓM DTN</h5>
	</div>
	<div class="row mt-3">
		<!-- Team Member 1 -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-0 shadow">
				<img src="<c:url value='/templates/user/img/dat.jpg'/>"
					class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h6 class="card-title mb-0">Huỳnh Văn Đạt</h6>
					<div class="card-text text-danger">Trưởng Nhóm</div>
				</div>
			</div>
		</div>
		<!-- Team Member 2 -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-0 shadow">
				<img src="<c:url value='/templates/user/img/thuc.jpg'/>"
					class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h6 class="card-title mb-0">Nguyễn Đoàn Chí Thức</h6>
					<div class="card-text text-black-50">Thành viên</div>
				</div>
			</div>
		</div>
		<!-- Team Member 3 -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-0 shadow">
				<img src="<c:url value='/templates/user/img/loc.jpg'/>"
					class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h6 class="card-title mb-0">Trương Tấn Lộc</h6>
					<div class="card-text text-black-50">Thành viên</div>
				</div>
			</div>
		</div>
		<!-- Team Member 4 -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-0 shadow">
				<img src="<c:url value='/templates/user/img/me.jpg'/>"
					class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h6 class="card-title mb-0">Võ Lê Nhật Linh</h6>
					<div class="card-text text-black-50">Thành viên</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->

</div>
<!-- /.container -->
<!-- Start Shop Newsletter  -->
  <section class="shop-newsletter section">
    <div class="container">
      <div class="inner-top">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 col-12">
            <!-- Start Newsletter Inner -->
            <div class="inner">
              <h4>TẠO TÀI KHOẢN</h4>
              <p> Đăng ký tài khoản mới để nhận <span>10%</span>khuyến mãi cho các đơn hàng của bạn</p>
              <form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
                <input name="EMAIL" placeholder="Nhập địa chỉ email của bạn" type="email">
                <button class="btn">Đăng ký</button>
              </form>
            </div>
            <!-- End Newsletter Inner -->
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Shop Newsletter -->