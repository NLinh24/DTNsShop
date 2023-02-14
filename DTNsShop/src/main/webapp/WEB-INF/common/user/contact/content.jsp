<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Breadcrumbs -->
	<div class="breadcrumbs mt-3">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="/DTNsShop/index.html">Trang chủ<i class="ti-arrow-right"></i></a></li>
								<li class="active"><a href="#">Liên hệ - Góp ý</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
  
	<!-- Start Contact -->
	<section id="contact-us" class="contact-us section">
		<div class="container">
				<div class="contact-head">
					<div class="row">
						<div class="col-lg-8 col-12">
							<div class="form-main">
								<div class="title">
									<h4> Liên hệ </h4>
									<h3> Viết tin nhắn cho chúng tôi </h3>
								</div>
								<form class="form" method="post" action="">
									<div class="row">
										<div class="col-lg-6 col-12">
											<div class="form-group">
												<label>Your Name<span>*</span></label>
												<input name="name" type="text" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-12">
											<div class="form-group">
												<label>Your Subjects<span>*</span></label>
												<input name="subject" type="text" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-12">
											<div class="form-group">
												<label>Your Email<span>*</span></label>
												<input name="email" type="email" placeholder="">
											</div>	
										</div>
										<div class="col-lg-6 col-12">
											<div class="form-group">
												<label>Your Phone<span>*</span></label>
												<input name="company_name" type="text" placeholder="">
											</div>	
										</div>
										<div class="col-12">
											<div class="form-group message">
												<label>your message<span>*</span></label>
												<textarea name="message" placeholder=""></textarea>
											</div>
										</div>
										<div class="col-12">
											<div class="form-group button">
												<button type="submit" class="btn ">Gửi</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-lg-4 col-12">
							<div class="single-head">
								<div class="single-info">
									<i class="fa fa-phone"></i>
									<h4 class="title">Liên hệ:</h4>
									<ul>
										<li>+123 444-444-4444</li>
										<li>+522 123-321-213</li>
									</ul>
								</div>
								<div class="single-info">
									<i class="fa fa-envelope-open"></i>
									<h4 class="title">Email:</h4>
									<ul>
										<li><a href="#">volenhatlinh2k2@gmail.com</a></li>
										<li><a href="#">dntsoftware@gmail.com</a></li>
									</ul>
								</div>
								<div class="single-info">
									<i class="fa fa-location-arrow"></i>
									<h4 class="title">Địa chỉ:</h4>
									<ul>
										<li>288 Nguyễn Văn Linh - An Khánh - Ninh Kiều - Cần Thơ.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!--/ End Contact -->
	
	<!-- Map Section -->
	<div class="map-section">
		<iframe width="100%" height="520" id="gmap-canvas"
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11112.461893018359!2d105.76373845744831!3d10.029351406478225!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a088476bafffdf%3A0x4da67960eb05332d!2zVHLGsOG7nW5nIENhbyDEkOG6s25nIFRo4buxYyBIw6BuaCBGUFQgUG9seXRlY2huaWMgQ-G6p24gVGjGoQ!5e0!3m2!1svi!2s!4v1642426185894!5m2!1svi!2s"
						frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
	</div>
	<!--/ End Map Section -->
	
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