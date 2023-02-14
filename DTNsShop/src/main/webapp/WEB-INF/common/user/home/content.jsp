<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Start Most Popular -->
<div class="product-area most-popular section mb-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>Sản phẩm nổi bật</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="owl-carousel popular-slider">
				<c:forEach var="top12" items="${top12.content}" varStatus="i12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-img">
							<a href="/DTNsShop/products-detail.html/${top12.id}"> <img class="default-img"
								src="<c:url value='/uploads/product/${top12.images}'/>"
								alt="#"> <img class="hover-img"
								src="<c:url value='/uploads/product/${top12.images}'/>"
								alt="#"> <!-- <span class="out-of-stock">Hot</span> -->
							</a>
							<div class="button-head">
								<div class="product-action">
									<a data-toggle="modal" data-target="#modalTop12${i12.count}"
										title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
											Shop</span></a> <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add
											to Wishlist</span></a> <a title="Compare" href="#"><i
										class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
								</div>
								<div class="product-action-2">
									<a title="Add to cart" href="/DTNsShop/carts.html/add/${top12.id}">Thêm vào giỏ hàng</a>
								</div>
							</div>
						</div>
						<div class="product-content">
							<h3>
								<a href="/DTNsShop/products-detail.html/${top12.id}">${top12.name}</a>
							</h3>
							<div class="product-price">
								<!-- <span class="old">$60.00</span> -->
								<span><fmt:formatNumber>${top12.price}</fmt:formatNumber> VND</span>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- End Single Product -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Most Popular Area -->
<!-- Start Product Area -->
<div class="product-area section" id="SanPham">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h2>Sản phẩm mới nhất</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="product-info">
					<div class="nav-main">
						<!-- Tab Nav -->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
								<c:forEach var="cate" items="${categories}">
								<li class="nav-item">
										<a class="nav-link ${field2 == cate.id?'active':''}"  href="?field=${cate.id}">
											${cate.name}
										</a>
								</li>
								</c:forEach>
						</ul>
						<!--/ End Tab Nav -->
					</div>
					
					<div class="tab-content" id="myTabContent">
						<!-- Start Single Tab -->
						<div class="tab-pane fade show active" >
							<div class="tab-single">
								<div class="row">
									<c:forEach var="item1" items="${product1.content}">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
										<div class="single-product">
											<div class="product-img">
												<a href="/DTNsShop/products-detail.html/${item1.id}"> <img class="default-img"
													src="<c:url value='/uploads/product/${item1.images}'/>"
													alt="#"> <img class="hover-img"
													src="<c:url value='/uploads/product/${item1.images}'/>"
													alt="#">
												</a>
												<div class="button-head">
													<div class="product-action">
														<a data-toggle="modal" data-target="#exampleModal"
															title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																Shop</span></a> <a title="Wishlist" href="#"><i
															class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
															title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																to Compare</span></a>
													</div>
													<div class="product-action-2">
														<a title="Add to cart" href="/DTNsShop/carts.html/add/${item1.id}">Thêm vào giỏ hàng</a>
													</div>
												</div>
											</div>
											<div class="product-content">
												<h3>
													<a href="/DTNsShop/products-detail.html/${item1.id}">${item1.name}</a>
												</h3>
												<div class="product-price">
													<!-- <span class="old">$60.00</span> -->
													<span><fmt:formatNumber>${item1.price}</fmt:formatNumber> VND</span>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!--/ End Single Tab -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Product Area -->
<!-- Start Midium Banner  -->
<section class="midium-banner">
	<div class="container">
		<div class="row">
			<!-- Single Banner  -->
			<div class="col-lg-6 col-md-6 col-12">
				<div class="single-banner">
					<img src="<c:url value='/templates/user/img-product/4.jpg'/>"
						alt="#" class="img-fluid">
					<div class="content">
						<h5 class="text-white bg-dark p-3">
							Sổ vở cao cấp <br>bọc da Cute cat superise 13x18
						</h5>
						<a href="#" class="btn">Mua Ngay</a>
					</div>
				</div>
			</div>
			<!-- /End Single Banner  -->
			<!-- Single Banner  -->
			<div class="col-lg-6 col-md-6 col-12">
				<div class="single-banner">
					<img src="<c:url value='/templates/user/img-product/5.jpg'/>"
						alt="#" class="img-fluid">
					<div class="content">
						<h5 class="text-white bg-dark p-3">
							Sổ vở cao cấp <br>bọc da Cute cat superise 13x18
						</h5>
						<a href="#" class="btn">Mua Ngay</a>
					</div>
				</div>
			</div>
			<!-- /End Single Banner  -->
		</div>
	</div>
</section>
<!-- End Midium Banner -->

<!-- Start Shop Home List  -->
<section class="shop-home-list section mt-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-12">
				<div class="row">
					<div class="col-12">
						<div class="shop-section-title">
							<h1>GIẢM GIÁ</h1>
						</div>
					</div>
				</div>
				<!-- Start Single List  -->
				<c:forEach var="item3" items="${product2.content}">
					<div class="single-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-12">
							<div class="list-image overlay">
								<img src="<c:url value='/uploads/product/${item3.images}'/>"
									alt="#"> <a href="/DTNsShop/products-detail.html/${item3.id}" class="buy"><i
									class="fa fa-shopping-bag"></i></a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 no-padding">
							<div class="content">
								<h4 class="title">
									<a href="/DTNsShop/products-detail.html/${item3.id}">${item3.name}</a>
								</h4>
								<p class="price with-discount">
									<fmt:formatNumber>${item3.price}</fmt:formatNumber> VND
								</p>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- End Single List  -->
			</div>
			<div class="col-lg-4 col-md-6 col-12">
				<div class="row">
					<div class="col-12">
						<div class="shop-section-title">
							<h1>TỐT NHẤT</h1>
						</div>
					</div>
				</div>
				<!-- Start Single List  -->
				<c:forEach var="item4" items="${product3.content}">
					<div class="single-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-12">
							<div class="list-image overlay">
								<img src="<c:url value='/uploads/product/${item4.images}'/>"
									alt="#"> <a href="/DTNsShop/products-detail.html/${item4.id}" class="buy"><i
									class="fa fa-shopping-bag"></i></a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 no-padding">
							<div class="content">
								<h4 class="title">
									<a href="/DTNsShop/products-detail.html/${item4.id}">${item4.name}</a>
								</h4>
								<p class="price with-discount">
									<fmt:formatNumber>${item4.price}</fmt:formatNumber> VND
								</p>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- End Single List  -->
			</div>
			<div class="col-lg-4 col-md-6 col-12">
				<div class="row">
					<div class="col-12">
						<div class="shop-section-title">
							<h1>NHIỀU LƯỢT MUA</h1>
						</div>
					</div>
				</div>
				<!-- Start Single List  -->
				<c:forEach var="item5" items="${product4.content}">
					<div class="single-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-12">
							<div class="list-image overlay">
								<img src="<c:url value='/uploads/product/${item5.images}'/>"
									alt="#"> <a href="/DTNsShop/products-detail.html/${item5.id}" class="buy"><i
									class="fa fa-shopping-bag"></i></a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 no-padding">
							<div class="content">
								<h4 class="title">
									<a href="/DTNsShop/products-detail.html/${item5.id}">${item5.name}</a>
								</h4>
								<p class="price with-discount">
									<fmt:formatNumber>${item5.price}</fmt:formatNumber> VND
								</p>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- End Single List  -->
			</div>
		</div>
	</div>
</section>
<!-- End Shop Home List  -->
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
						<p>
							Đăng ký tài khoản mới để nhận <span>10%</span>khuyến mãi cho các
							đơn hàng của bạn
						</p>
						<form action="/DTNsShop/regiter" method="post" target="_blank"
							class="newsletter-inner">
							<input name="EMAIL" placeholder="Nhập địa chỉ email của bạn"
								type="email">
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
<!-- Modal -->
<%-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span class="ti-close" aria-hidden="true"></span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row no-gutters">
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<!-- Product Slider -->
						<div class="product-gallery">
							<div class="quickview-slider-active">
								<div class="single-slider">
									<img
										src="<c:url value='/templates/user/img-product/pr11.jpg'/>"
										alt="#">
								</div>
								<div class="single-slider">
									<img
										src="<c:url value='/templates/user/img-product/pr22.jpg'/>"
										alt="#">
								</div>
								<div class="single-slider">
									<img
										src="<c:url value='/templates/user/img-product/pr33.jpg'/>"
										alt="#">
								</div>
								<div class="single-slider">
									<img
										src="<c:url value='/templates/user/img-product/pr55.jpg'/>"
										alt="#">
								</div>
							</div>
						</div>
						<!-- End Product slider -->
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="quickview-content">
							<h2>Bút màu nước Cute penguin ice cream set24 - Mix</h2>
							<div class="quickview-ratting-review">
								<div class="quickview-ratting-wrap">
									<div class="quickview-ratting">
										<i class="yellow fa fa-star"></i> <i class="yellow fa fa-star"></i>
										<i class="yellow fa fa-star"></i> <i class="yellow fa fa-star"></i>
										<i class="fa fa-star"></i>
									</div>
									<a href="#"> (1 customer review)</a>
								</div>
								<div class="quickview-stock">
									<span><i class="fa fa-check-circle-o"></i> in stock</span>
								</div>
							</div>
							<h3>179,000 VND</h3>
							<div class="quickview-peragraph">
								<p>˙ɯɐnbɯnu ɯnsdı oɯǝu ınb sonb uı ɯɐu ıʇıuǝlǝp ɯǝʇnɐ ɯɐlln
									ʇuıs ɐɹodɯǝʇ oıʇdo ǝssǝ ɹnʇɐıɹɐd ʇıpǝdɯı pɐ ɯnɹoqɐl ǝʇsı
									ɐıʇılloɯ ˙ʇılǝ ƃuıɔısıdıpɐ ɹnʇǝʇɔǝsuoɔ 'ʇǝɯɐ ʇıs ɹolop ɯnsdı
									ɯǝɹol</p>
							</div>
							<div class="size">
								<div class="row">
									<div class="col-lg-6 col-12">
										<h5 class="title">Danh mục</h5>
										<select>
											<option selected="selected">s</option>
											<option>m</option>
											<option>l</option>
											<option>xl</option>
										</select>
									</div>
									<div class="col-lg-6 col-12">
										<h5 class="title">Màu sắc</h5>
										<select>
											<option selected="selected">orange</option>
											<option>purple</option>
											<option>black</option>
											<option>pink</option>
										</select>
									</div>
								</div>
							</div>
							<div class="quantity">
								<!-- Input Order -->
								<div class="input-group">
									<div class="button minus">
										<button type="button" class="btn btn-primary btn-number"
											disabled="disabled" data-type="minus" data-field="quant[1]">
											<i class="ti-minus"></i>
										</button>
									</div>
									<input type="text" name="quant[1]" class="input-number"
										data-min="1" data-max="1000" value="1">
									<div class="button plus">
										<button type="button" class="btn btn-primary btn-number"
											data-type="plus" data-field="quant[1]">
											<i class="ti-plus"></i>
										</button>
									</div>
								</div>
								<!--/ End Input Order -->
							</div>
							<div class="add-to-cart">
								<a href="#" class="btn">Add to cart</a> <a href="#"
									class="btn min"><i class="ti-heart"></i></a> <a href="#"
									class="btn min"><i class="fa fa-compress"></i></a>
							</div>
							<div class="default-social">
								<h4 class="share-now">Share:</h4>
								<ul>
									<li><a class="facebook" href="#"><i
											class="fa fa-facebook"></i></a></li>
									<li><a class="twitter" href="#"><i
											class="fa fa-twitter"></i></a></li>
									<li><a class="youtube" href="#"><i
											class="fa fa-pinterest-p"></i></a></li>
									<li><a class="dribbble" href="#"><i
											class="fa fa-google-plus"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> --%>
<!-- Modal end -->