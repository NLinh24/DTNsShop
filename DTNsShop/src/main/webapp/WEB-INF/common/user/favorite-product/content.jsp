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
						<li class="active"><a href="#">Mặt hàng yêu thích của bạn</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->
<div class="container mt-3 mb-3">
	<!-- Shopping Summery -->
	<table class="table table-hover shopping-summery">
		<thead>
			<tr class="main-hading">
				<th class="text-center">HÌNH ẢNH</th>
				<th>TÊN SẢN PHẨM</th>
				<th class="text-center">NGÀY THÍCH</th>
				<th class="text-center">XEM SẢN PHẨM</th>
				<th class="text-center">BỎ THÍCH</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${items}" varStatus="i">
			<tr class="text-center">
				<td>
					<a href="/DTNsShop/products-detail.html/${item.product.id}">
						<img alt="hinhanh" class="fluid" src="<c:url value='/uploads/product/${item.product.images}'/>">
					</a>
				</td>
				<td>
					<a class="text-dark" href="/DTNsShop/products-detail.html/${item.product.id}">
						${item.product.name}
					</a>
				</td>
				<td>
					<fmt:formatDate value="${item.likedate}" pattern="dd-MM-yyyy"/>
				</td>
				<td>
					<a href="/DTNsShop/products-detail.html/${item.product.id}" class="text-primary">Chi tiết sản phẩm</a>
				</td>
				<td>
					<button style="background: none;outline: none;border: none;" data-bs-toggle="modal" data-bs-target="#exampleModal${i.count}" class="text-danger">Bỏ thích</button>
				</td>
				<td>
					<!-- Modal Delete -->
                    <div class="modal fade" id="exampleModal${i.count}" tabindex="-1"
                        aria-labelledby="exampleModalLabel${i.count}" aria-hidden="true">
                        <div class="modal-dialog" style="width: 600px;margin: auto;">
                            <div class="modal-content">
                            	<div class="bg-danger text-left p-2"><h6 class="text-white">Thông báo!</h6> </div>
                                <div class="modal-body mt-4 text-center" style="height: 150px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="crimson"
                                        class="bi bi-pen-fill" viewBox="0 0 20 20">
                                        <path
                                            d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                        <path
                                            d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                    </svg>
                                    <h6 class="text-gray">Bạn chắc chắn muốn bỏ thích ${item.product.name}
                                    	này ?
                                    </h6>
                                </div>
                                <form class="modal-footer" method="post">
                                    <button class="btn btn-danger d-flex" formaction="/DTNsShop/product-favorite.html/unlike/${item.product.id}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                            fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
                                            <path
                                                d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                            <path
                                                d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                                        </svg>
                                        Yes
                                    </button>
                                    <button type="button" class="btn btn-info d-flex" data-bs-dismiss="modal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                            fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 20 20">
                                            <path
                                                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
                                        </svg>
                                        No
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="text-center" ${favCount!=0?'hidden':''}>
		<img class="img-fluid mb-5" src="/templates/user/img/cart.jpg"
			width="300px">
		<h5>Bạn chưa có sản phẩm yêu thích nào ! :))</h5>
		<a class="text-danger" href="/DTNsShop/products.html">Tìm sản phẩm yêu thích ngay...</a>
	</div>
	<div class="text-right text-white mt-2">
		<a href="/DTNsShop/index.html" class="btn btn-primary">Trở lại trang chủ</a>
		<a href="/DTNsShop/products.html" class="btn btn-primary">Tiếp tục mua hàng</a>
	</div>
</div>
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