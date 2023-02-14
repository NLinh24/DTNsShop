<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!-- Breadcrumbs -->
<div class="breadcrumbs mt-3 ml-2 mb-3">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<ul class="bread-list">
						<li><a href="/DTNsShop/index.html">Trang chủ<i
								class="ti-arrow-right"></i></a></li>
						<li class="active"><a href="#">Giỏ hàng</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->

<!-- Shopping Cart -->
<div class="shopping-cart section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Shopping Summery -->
				<table class="table shopping-summery">
					<thead>
						<tr class="main-hading">
						    <th>STT</th>
							<th>SẢN PHẨM</th>
							<th>TÊN</th>
							<th class="text-center">ĐƠN GIÁ</th>
							<th class="text-center">SỐ LƯỢNG</th>
							<th class="text-center">TỔNG TIỀN</th>
							<th class="text-center">
								<a href="/DTNsShop/carts.html/clear"><i class="ti-trash remove-icon"></i></a>							
							</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="no" value="1"></c:set>
					<c:forEach var="item" items="${cartItems}">
						<form action="/DTNsShop/carts.html/update/${item.idItem}" method="post">
								<tr>
									<td>${no}</td>
									<td>
										<a href="/DTNsShop/products-detail.html/${item.idProduct}">
											<img alt="hinhanh" class="fluid" src="<c:url value='/uploads/product/${item.img}'/>">
										</a>
									</td>
									<td>
									<a href="/DTNsShop/products-detail.html/${item.idProduct}">
										${item.name}
									</a>
									</td>
									<td>
										<fmt:formatNumber>${item.price}</fmt:formatNumber> VND
									</td>
									<td>
										<input type="hidden" name="id" value="${item.idItem}">
										<input type="number" value="${item.qty}" name="qty"
										onblur="this.form.submit()" min="1" max="100"></td>
									<td><fmt:formatNumber>${item.price*item.qty}</fmt:formatNumber> VND</td>
									<td>
										<a href="/DTNsShop/carts.html/remove/${item.idItem}"><i class="ti-trash remove-icon"></i></a>
									</td>
								</tr>
							</form>
						<c:set var="no" value="${no + 1}"></c:set>
						</c:forEach>
					</tbody>
				</table>
				<!--/ End Shopping Summery -->
			</div>
		</div>
		<div class="row m-0 text-center bg-white" ${NoOfItems!=0?'hidden':''}>
					<div class="col-4"></div>
					<img class="col-4 img-fluid mb-5" src="/templates/user/img/cart.jpg"
						width="300px">
					<div class="col-4"></div>
					<div class="col-4"></div>
					<h5 class="col-4">Giỏ hàng trống ! :))</h5>
					<div class="col-4"></div>
					<div class="col-4"></div>
					<a class="col-4 text-danger" href="/DTNsShop/products.html">Mua hàng</a>
					<div class="col-4"></div>
		</div>
		<div class="row">
			<div class="col-12">
				<!-- Total Amount -->
				<div class="total-amount">
					<div class="row">
						<div class="col-lg-8 col-md-5 col-12">
							<div class="left">
								<div class="coupon">
									<form action="#" target="_blank">
										<input name="Coupon" placeholder="Mã giảm giá">
										<button class="btn">Áp dụng</button>
									</form>
								</div>
								<div class="checkbox">
									<label class="checkbox-inline" for="2"><input
										name="news" id="2" type="checkbox"> Phí ship (+10.000VND)</label>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-7 col-12">
							<div class="right">
								<ul ${NoOfItems!=0?'':'hidden'}>
									<li>Tổng đơn hàng:<span><fmt:formatNumber>${total}</fmt:formatNumber> VND</span></li>
									<li>Phí ship:<span>Free</span></li>
									<li>Giảm giá: <span>0 VND</span></li>
									<li class="last">Thành tiền: <span><fmt:formatNumber>${total}</fmt:formatNumber> VND</span></li>
								</ul>
								<div class="button5">
									<a href="/DTNsShop/checkout.html" class="btn" ${NoOfItems!=0?'':'hidden'}>Thanh toán</a> <a href="/DTNsShop/products.html" class="btn">Tiếp tục mua hàng</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/ End Total Amount -->
			</div>
		</div>
	</div>
</div>
<!--/ End Shopping Cart -->

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



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
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
									<img src="images/modal1.jpg" alt="#">
								</div>
								<div class="single-slider">
									<img src="images/modal2.jpg" alt="#">
								</div>
								<div class="single-slider">
									<img src="images/modal3.jpg" alt="#">
								</div>
								<div class="single-slider">
									<img src="images/modal4.jpg" alt="#">
								</div>
							</div>
						</div>
						<!-- End Product slider -->
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="quickview-content">
							<h2>Flared Shift Dress</h2>
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
							<h3>$29.00</h3>
							<div class="quickview-peragraph">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Mollitia iste laborum ad impedit pariatur esse optio tempora
									sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p>
							</div>
							<div class="size">
								<div class="row">
									<div class="col-lg-6 col-12">
										<h5 class="title">Size</h5>
										<select>
											<option selected="selected">s</option>
											<option>m</option>
											<option>l</option>
											<option>xl</option>
										</select>
									</div>
									<div class="col-lg-6 col-12">
										<h5 class="title">Color</h5>
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
</div>
<!-- Modal end -->