<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<div class="m-5"></div>
<!-- Breadcrumbs -->
<div class="breadcrumbs mt-3 ml-2 mb-3">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<ul class="bread-list">
						<li><a href="/DTNsShop/index.html">Trang chủ<i
								class="ti-arrow-right"></i></a></li>
						<li class="active"><a href="#">Chi tiết sản phẩm</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->
<div class="container">
	<div class="row">
		<div class="card col-12">
			<!--  <div class="card-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
        </div> -->
			<div class="card-body">
				<div class="row no-gutters">
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<!-- Product Slider -->
						<div class="product-gallery">
							<div class="quickview-slider-active">
								<div class="single-slider">
									<img
										src="<c:url value='/uploads/product/${products.images}'/>"
										alt="#">
								</div>
								
								<c:forEach var="item" items="${subImage}">
									<div class="single-slider" ${subImage==null?'hidden':''}>
										<img
											src="<c:url value='/uploads/productImg/${item.images}'/>"
											alt="#">				
									</div>
								</c:forEach>
								<div class="single-slider">
									<img
										src="<c:url value='/uploads/product/${products.images}'/>"
										alt="#">
								</div>
							</div>
						</div>
						<div class="row">
							<img src="<c:url value='/uploads/product/${products.images}'/>"alt="#" class="col-3 img-fluid">
							<c:forEach var="item" items="${subImage}">
									<img
										src="<c:url value='/uploads/productImg/${item.images}'/>" class="col-3 img-fluid"
										alt="#">
								</c:forEach>
						</div>
						<!-- End Product slider -->
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="quickview-content">
							<h2>${products.name}</h2>
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
							<h3><fmt:formatNumber>${products.price}</fmt:formatNumber> VND</h3>
							<em class="text-danger">Còn ${products.amount} sản phẩm</em>
							<div class="quickview-peragraph">
								<p>Mô tả: ${products.review}</p>
							</div>
							<div class="size" style="margin-bottom:200px">
								<div class="row">
									<div class="col-lg-6 col-12" ${subImage!=null?'':'hidden'}>
										<h5 class="title">Màu sắc</h5>
										<select id="color1" name="color" >
		                                    <c:forEach var="item" items="${subImage}">
		                                    	<option value="${item.id}">${item.colors.name}</option>
		                                    </c:forEach>
                                		</select>
									</div>
									<div class="col-lg-6 col-12">
										<!-- <h5 class="title">Danh mục</h5>
										<select>
											<option selected="selected">s</option>
											<option>m</option>
											<option>l</option>
											<option>xl</option>
										</select> -->
									</div>
								</div>
							</div>
							<div class="quantity mt-3 mb-3">
								<!-- Input Order -->
								<div class="input-group">
									<div class="button minus">
										<button type="button" class="btn btn-primary btn-number"
											disabled="disabled" data-type="minus" data-field="qty">
											<i class="ti-minus"></i>
										</button>
									</div>
									<input type="text" name="qty" class="input-number"
										data-min="1" data-max="1000" value="1">
									<div class="button plus">
										<button type="button" class="btn btn-primary btn-number"
											data-type="plus" data-field="qty">
											<i class="ti-plus"></i>
										</button>
									</div>
								</div>
								<!--/ End Input Order -->
							</div>
							<form class="add-to-cart" action="" method="post">
								<a href="/DTNsShop/carts.html/add/${products.id}" class="btn" data-bs-toggle="tooltip" data-bs-placement="top" title="Thêm vào giỏ hàng!">Add to cart</a> 
								<button formaction="/DTNsShop/product-favorite.html/${check!=null?'unlike':'like'}/${products.id}" class="btn min ${check!=null?'bg-danger':''}" data-bs-toggle="tooltip" data-bs-placement="top" title="${check!=null?'Unlike':'Like'}!">
									<i class="ti-heart mr-2"></i>${like}</button>

								<a href="#"
									class="btn min"><i class="fa fa-compress"></i></a>
							</form>
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
<!-- Start Most Popular -->
	<div class="product-area most-popular section mb-0">
        <div class="container">
            <div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>Các sản phẩm tương tự</h2>
					</div>
				</div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="owl-carousel popular-slider">
						<c:forEach var="item" items="${items}" varStatus="i12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-img">
							<a href="/DTNsShop/products-detail.html/${item.id}"> <img class="default-img"
								src="<c:url value='/uploads/product/${item.images}'/>"
								alt="#"> <img class="hover-img"
								src="<c:url value='/uploads/product/${item.images}'/>"
								alt="#"> <!-- <span class="out-of-stock">Hot</span> -->
							</a>
							<div class="button-head">
								<div class="product-action">
									<a data-toggle="modal" data-target="#modalitem${i12.count}"
										title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
											Shop</span></a> <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add
											to Wishlist</span></a> <a title="Compare" href="#"><i
										class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
								</div>
								<div class="product-action-2">
									<a title="Add to cart" href="/DTNsShop/carts.html/add/${item.id}">Thêm vào giỏ hàng</a>
								</div>
							</div>
						</div>
						<div class="product-content">
							<h3>
								<a href="/DTNsShop/products-detail.html/${item.id}">${item.name}</a>
							</h3>
							<div class="product-price">
								<!-- <span class="old">$60.00</span> -->
								<span><fmt:formatNumber>${item.price}</fmt:formatNumber> VND</span>
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
						<form action="" method="get" target="_blank"
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
