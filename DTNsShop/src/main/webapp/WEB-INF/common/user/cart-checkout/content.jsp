<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<!-- Breadcrumbs -->
<div class="breadcrumbs mt-3 ml-2 mb-3">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<ul class="bread-list">
						<li><a href="/DTNsShop/index.html">Trang chủ<i
								class="ti-arrow-right"></i></a></li>
						<li class="active"><a href="#">Trang thanh toán</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->

<!-- Start Checkout -->
<section class="shop checkout section">
	<form method="post" action="" class="container">
		<div class="row">
			<div class="col-lg-8 col-12">
				<div class="checkout-form">
					<h2>Thanh toán đơn hàng của bạn ở đây</h2>
					<p>Nhanh tay đặt hàng để nhận được nhiều ưu đãi hấp dẫn !</p>
					<!-- Form -->
					<div class="form">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label>Họ tên của bạn<span>*</span></label> <input type="text"
										name="name" disabled="disabled" value="${user.fullname}">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label>Email<span>*</span></label> <input type="email"
										name="name" disabled="disabled" value="${user.email}">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label>Số điện thoại<span>*</span></label> <input type="text"
										name="email" disabled="disabled" value="${user.phonenumber}">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label>Địa chỉ giao hàng<span>*</span></label> <input type="text"
										name="address" placeholder="Nhập địa chỉ giao hàng của bạn...">
								</div>
								<div class="text-danger">${message}</div>
							</div>
						</div>
					</div>
					<!--/ End Form -->
				</div>
			</div>
			<div class="col-lg-4 col-12">
				<div class="order-details">
					<!-- Order Widget -->
					<div class="single-widget">
						<h2>TỔNG ĐƠN HÀNG</h2>
						<div class="content">
							<ul>
								<c:forEach var="item" items="${cartItems}">
									<li class="text-danger">
										(+) 
										${item.qty} ${item.name} (<fmt:formatNumber>${item.price}</fmt:formatNumber> VND).
										<%-- <img alt="icon" src="/uploads/product/${item.img}" class="img-fluid" width="64px"> --%>
									</li>
								</c:forEach>
								<li>Thành tiền: <span><fmt:formatNumber>${total}</fmt:formatNumber> VND</span></li>
								<li>(+) Phí ship: <span>Free</span></li>
								<li class="last">Tổng: <span><fmt:formatNumber>${total}</fmt:formatNumber> VND</span></li>
							</ul>
						</div>
					</div>
					<!--/ End Order Widget -->
					<!-- Order Widget -->
					<div class="single-widget">
						<h2>Thanh toán với</h2>
						<div class="content">
							<div class="checkbox">
								<label class="checkbox-inline" for="1"><input
									name="updates" id="1" type="checkbox"> Check Payments</label> <label
									class="checkbox-inline" for="2"><input name="news"
									id="2" type="checkbox"> Cash On Delivery</label> <label
									class="checkbox-inline" for="3"><input name="news"
									id="3" type="checkbox"> PayPal</label>
							</div>
						</div>
					</div>
					<!--/ End Order Widget -->
					<!-- Payment Method Widget -->
					<div class="single-widget payement">
						<div class="content">
							<img
								src="<c:url value='/templates/user/images/payment-method.png'/>"
								alt="#">
						</div>
					</div>
					<!--/ End Payment Method Widget -->
					<!-- Button Widget -->
					<div class="single-widget get-button">
						<div class="content">
							<div class="button">
								<button formaction="#" class="btn">Đặt hàng ngay</button>
							</div>
						</div>
					</div>
					<!--/ End Button Widget -->
				</div>
			</div>
		</div>
	</form>
</section>
<!--/ End Checkout -->
<!-- Start Shop Services Area -->
  <section class="shop-services section home">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-6 col-12">
          <!-- Start Single Service -->
          <div class="single-service">
            <i class="ti-rocket"></i>
            <h4>MIỄN PHÍ VẬN CHUYỂN</h4>
            <p>Với các đơn hàng từ 100K</p>
          </div>
          <!-- End Single Service -->
        </div>
        <div class="col-lg-3 col-md-6 col-12">
          <!-- Start Single Service -->
          <div class="single-service">
            <i class="ti-reload"></i>
            <h4>TRẢ HÀNG MIỄN PHÍ</h4>
            <p>Trong vòng 30 ngày trở lại</p>
          </div>
          <!-- End Single Service -->
        </div>
        <div class="col-lg-3 col-md-6 col-12">
          <!-- Start Single Service -->
          <div class="single-service">
            <i class="ti-lock"></i>
            <h4>THANH TOÁN AN TOÀN</h4>
            <p>Thanh toán an toàn 100%</p>
          </div>
          <!-- End Single Service -->
        </div>
        <div class="col-lg-3 col-md-6 col-12">
          <!-- Start Single Service -->
          <div class="single-service">
            <i class="ti-tag"></i>
            <h4>GIÁ TỐT NHẤT</h4>
            <p>Giá đảm bảo MẮC :))</p>
          </div>
          <!-- End Single Service -->
        </div>
      </div>
    </div>
  </section>
  <!-- End Shop Services Area -->
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