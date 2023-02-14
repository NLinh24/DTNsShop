<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Breadcrumbs -->
		<div class="breadcrumbs mt-3 ml-2">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="bread-inner">
							<ul class="bread-list">
								<li><a href="/DTNsShop/index.html">Trang chủ<i class="ti-arrow-right"></i></a></li>
								<li class="active"><a href="#">Sản phẩm</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
		
		<!-- Product Style -->
		<section class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<div class="shop-sidebar">
								<!-- Single Widget -->
								<div class="single-widget category">
									<h3 class="title">Danh Mục</h3>
									<ul class="categor-list">
										<c:forEach var="item1" items="${categories}">
											<li><a href="?catego=${item1.id}">${item1.name}</a></li>
										</c:forEach>
									</ul>
								</div>
								<!--/ End Single Widget -->
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<!-- Shop Top -->
								<div class="shop-top">
									<div class="shop-shorter">
										<div class="single-shorter">
											<label>Hiển thị :</label>
											<select name="forma3" onchange="location = this.value;">
												<option ${show==9?'selected="selected"':''} value="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=${number}&show=9">09</option>
												<option ${show==12?'selected="selected"':''} value="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=${number}&show=12">12</option>
												<option ${show==15?'selected="selected"':''} value="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=${number}&show=15">15</option>
												<option ${show==30?'selected="selected"':''} value="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=${number}&show=30">30</option>
											</select>
										</div>
										<div class="single-shorter">
											<label>Sắp xếp :</label>
											<select name="forma" onchange="location = this.value;">
												 <option ${field2=='name'?'selected':''} value="/DTNsShop/products.html/sort?field=name&sort=${sort}&p=${number}&show=${show}">Tên sản phẩm</option>
												 <option ${field2=='amount'?'selected':''} value="/DTNsShop/products.html/sort?field=amount&sort=${sort}&p=${number}&show=${show}">Số lượng</option>
												 <option ${field2=='price'?'selected':''} value="/DTNsShop/products.html/sort?field=price&sort=${sort}&p=${number}&show=${show}">Đơn giá</option>
											</select>
										</div>
										<div class="single-shorter">
											<label>Thứ tự:</label>
											<select name="forma2" onchange="location = this.value;">
												 <option ${sort==0?'selected':''} value="/DTNsShop/products.html/sort?field=${field2}&sort=0&p=${number}&show=${show}">Tăng dần</option>
												 <option ${sort==1?'selected="selected"':''} value="/DTNsShop/products.html/sort?field=${field2}&sort=1&p=${number}&show=${show}">Giảm dần</option>
											</select>
										</div>
									</div>
									<ul class="view-mode">
										<li class="active"><a href="#"><i class="fa fa-th-large"></i></a></li>
										<li><a href="#"><i class="fa fa-th-list"></i></a></li>
									</ul>
								</div>
								<!--/ End Shop Top -->
							</div>
						</div>
						<div class="row">
							<div class="col-12 text-center" ${check?'':'hidden'}>
								<img class="img-fluid mb-5" src="/uploads/product/default.jpg"
									width="400px">
								<h5>Không tìm thấy sản phẩm phù hợp !</h5>
								<!-- <a class="text-danger" href="/DTNsShop/products.html">Mua hàng...</a> -->
							</div>
						<c:forEach var="item" items="${product.content}" varStatus="i">
							<div class="col-lg-4 col-md-6 col-12">
								<!-- Start Single Product -->
								<div class="single-product">
									<div class="product-img">
										<a href="/DTNsShop/products-detail.html/${item.id}">
											<img class="default-img" src="<c:url value='/uploads/product/${item.images}'/>" alt="#">
											<img class="hover-img" src="<c:url value='/uploads/product/${item.images}'/>" alt="#">
											<!-- <span class="out-of-stock">Yêu thích</span> -->
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#modalProduct${i.count}" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="/DTNsShop/carts.html/add/${item.id}">Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="/DTNsShop/products-detail.html">${item.name}</a></h3>
										<div class="product-price">
											<!-- <span class="old">$60.00</span> -->
											<span><fmt:formatNumber>${item.price}</fmt:formatNumber> VND</span>
										</div>
									</div>
								</div>
								<!-- End Single Product -->
							</div>
								<!-- Modal -->
			<div class="modal fade" id="modalProduct${i.count}" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
						</div>
						<div class="modal-body">
					          <div class="row no-gutters">
					            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
					              <!-- Product Slider -->
					              <div class="product-gallery">
					                <div class="quickview-slider-active">
					                  <div class="single-slider">
					                    <img src="<c:url value='/uploads/product/${item.images}'/>" alt="#">
					                  </div>
					                  <div class="single-slider">
					                    <img src="<c:url value='/uploads/product/${item.images}'/>" alt="#">
					                  </div>
					                  <div class="single-slider">
					                    <img src="<c:url value='/uploads/product/${item.images}'/>" alt="#">
					                  </div>
					                  <div class="single-slider">
					                    <img src="<c:url value='/uploads/product/${item.images}'/>" alt="#">
					                  </div>
					                </div>
					              </div>
					              <!-- End Product slider -->
					            </div>
					            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
					              <div class="quickview-content">
					                <h2>${item.name}</h2>
					                <div class="quickview-ratting-review">
					                  <div class="quickview-ratting-wrap">
					                    <div class="quickview-ratting">
					                      <i class="yellow fa fa-star"></i>
					                      <i class="yellow fa fa-star"></i>
					                      <i class="yellow fa fa-star"></i>
					                      <i class="yellow fa fa-star"></i>
					                      <i class="fa fa-star"></i>
					                    </div>
					                    <a href="#"> (1 customer review)</a>
					                  </div>
					                  <div class="quickview-stock">
					                    <span><i class="fa fa-check-circle-o"></i> in stock</span>
					                  </div>
					                </div>
					                <h3><fmt:formatNumber>${item.price}</fmt:formatNumber> VND</h3>
					                <div class="quickview-peragraph">
					                  <p>${item.review}</p>
					                </div>
					                <!-- <div class="size">
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
					                </div> -->
					                <div class="quantity mt-3 mb-3">
					                  <!-- Input Order -->
					                  <div class="input-group">
					                    <div class="button minus">
					                      <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
					                        <i class="ti-minus"></i>
					                      </button>
					                    </div>
					                    <input type="text" name="quant[1]" class="input-number" data-min="1" data-max="1000" value="1">
					                    <div class="button plus">
					                      <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
					                        <i class="ti-plus"></i>
					                      </button>
					                    </div>
					                  </div>
					                  <!--/ End Input Order -->
					                </div>
					                <div class="add-to-cart">
					                  <a href="#" class="btn">Add to cart</a>
					                  <a href="#" class="btn min"><i class="ti-heart"></i></a>
					                  <a href="#" class="btn min"><i class="fa fa-compress"></i></a>
					                </div>
					                <div class="default-social">
					                  <h4 class="share-now">Share:</h4>
					                  <ul>
					                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
					                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
					                    <li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
					                    <li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
					                  </ul>
					                </div>
					              </div>
					            </div>
					          </div>
					        </div>
					</div>
				</div>
			</div>
			<!-- Modal end -->
							</c:forEach>
							</div>
							<div class="row" ${check?'hidden':''}>
								<div class="col-lg-2 col-md-2 col-12"></div>
								<div class="col-lg-8 col-md-8 col-12 mt-5">
									<div class="text-white">
										<a class="btn btn-dark ${product.number-1 < 0?' disabled':''}"
							                href="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=0&show=${show}">First</a>
							                
							                <a class="btn btn-dark  ${product.number-1 < 0?'disabled':''} "
							                    href="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=${product.number-1 < 0?'0':product.number-1}&show=${show}">Previous</a>
							               
							                <a class="btn btn-dark  ${product.number+1 > product.totalPages - 1 ?'disabled':''}"
							                    href="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=${product.number+1 > product.totalPages - 1 ? product.totalPages - 1: product.number+1}&show=${show}">Next</a>
							               
							                <a class="btn btn-dark ${product.number+1 > product.totalPages - 1 ?'disabled':''}"
							                    href="/DTNsShop/products.html/sort?field=${field2}&sort=${sort}&p=${product.totalPages-1}&show=${show}">Last</a>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12"></div>
							</div>
						</div>
					</div>
				</div>
		</section>
		<!--/ End Product Style 1  -->	

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
		