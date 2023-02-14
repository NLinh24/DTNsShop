<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<!-- Preloader -->
<div class="preloader">
	<div class="preloader-inner">
		<div class="preloader-icon">
			<span></span> <span></span>
		</div>
	</div>
</div>
<!-- End Preloader -->
<!-- Header -->
<header class="header shop">
	<!-- Topbar -->
	<div class="topbar">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-12 col-12">
					<!-- Top Left -->
					<div class="top-left">
						<ul class="list-main mt-2">
							<li><i class="ti-headphone-alt"></i> +0944694449</li>
							<li><i class="ti-email"></i> volenhatlinh2k2@gmail.com</li>
						</ul>
					</div>
					<!--/ End Top Left -->
				</div>
				<div class="col-lg-8 col-md-12 col-12">
					<!-- Top Right -->
					<div class="right-content">
						<ul class="list-main">
                <!-- <i class="fa fa-language text-danger" aria-hidden="true"></i> -->
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="/templates/user/img/<s:message code="lo.mn.imgl"/>" alt="logo" class="img-fluid mr-1" width="20px"><s:message code="lo.mn.lang"></s:message> </a>
                  <div class="dropdown-menu dtn-acc1" aria-labelledby="navbarDropdown1">
                     <a class="dropdown-item" href="?lang=vi"><img src="<c:url value='/templates/user/img/vietnam.png'/>" alt="logo" class="img-fluid mr-1" width="20px">Tiếng Việt</a>
                 	 <a class="dropdown-item" href="?lang=en" class="ml-2"><img src="<c:url value='/templates/user/img/english.jpg'/>" alt="logo" class="img-fluid mr-1" width="20px">English</a>
                  </div>
                </li>
                <li ${sessionScope.user.admins?'':'hidden'}>
                  <a href="/DTNsShop/admin"><i class="fa fa-user-secret" aria-hidden="true"></i><s:message code="lo.mn.admin"></s:message></a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img class="img-fluid rounded-circle" style="border: 2px solid black" width="24px" src="<c:url value='/uploads/user/${user.photo != null?user.photo:"default.jpg"}'/>">
                   		<em ${sessionScope.user != null?'hidden':''} ><s:message code="lo.mn.acc"></s:message> </em> ${sessionScope.user.username} 
                   </a>
                  <div class="dropdown-menu dtn-acc1" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="register" ${sessionScope.user == null?'':'hidden'}><i class="fa fa-user-plus" aria-hidden="true"></i><s:message code="lo.mn.register"></s:message></a>
                    <a class="dropdown-item" href="login" ${sessionScope.user == null?'':'hidden'}><i class="fa fa-sign-in" aria-hidden="true"></i><s:message code="lo.mn.login"></s:message></a>
                    <a class="dropdown-item" href="updateProfile" ${sessionScope.user == null?'hidden':''}><i class="fa fa-pencil-square-o" aria-hidden="true"></i><s:message code="lo.mn.upprofile"></s:message></a>
                    
                    <a class="dropdown-item" href="forgotPass" ${sessionScope.user == null?'':'hidden'}><i class="fa fa-unlock" aria-hidden="true"></i><s:message code="lo.mn.forgotpass"></s:message></a>
                    <a class="dropdown-item" href="changePass" ${sessionScope.user == null?'hidden':''}><i class="fa fa-unlock" aria-hidden="true"></i><s:message code="lo.mn.changpass"></s:message></a>
                    <div class="dropdown-divider" ${sessionScope.user == null?'hidden':''}></div>
                    <a class="dropdown-item" href="logout" ${sessionScope.user == null?'hidden':''}><i class="fa fa-sign-out" aria-hidden="true"></i><s:message code="lo.mn.logout"></s:message></a>
                  </div>
                </li>
              </ul>
					</div>
					<!-- End Top Right -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Topbar -->
	<div class="middle-inner">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-3 col-12">
            <!-- Logo -->
            <div class="logo">
              <a href="index.html">
                <img class="img-fluid" width="200px" src="<c:url value='/templates/user/img/logo2.jpg'/>" alt="DTNsShop">
              </a>
            </div>
            <!--/ End Logo -->
            <!-- Search Form -->
            <div class="search-top">
              <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
              <!-- Search Form -->
              <div class="search-top">
                <form class="search-form">
                  <input type="text" placeholder='<s:message code="lo.mn.search"></s:message>' name="search">
                  <!-- Search here... -->
                  <button value="search" type="submit"><i class="ti-search"></i></button>
                </form>
              </div>
              <!--/ End Search Form -->
            </div>
            <!--/ End Search Form -->
            <div class="mobile-nav"></div>
          </div>
          <div class="col-lg-6 col-md-6 col-12">
            <div class="search-bar-top">
              <div class="search-bar">
                <select>
                  <option selected="selected"><s:message code="lo.mn.cate"></s:message></option>
                  <!-- All Category -->
                 <c:forEach var="item2" items="${categories}">
                 	 <option value="${item2.id}">${item2.name}</option>
                 </c:forEach>
                </select>
                <form method="post">
                  <input name="keywords" value="${keywords}" placeholder="<s:message code="lo.mn.search"></s:message>" />
                  <!-- Search Products Here..... -->
                  <button class="btnn" formaction="/DTNsShop/products.html" ><i class="ti-search"></i></button>
                </form>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-3 col-12">
            <div class="right-bar">
              <!-- Search Form -->
						<div class="sinlge-bar">
							<a href="product-favorite.html" class="single-icon" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mặt hàng yêu thích">
								<i class="fa fa-heart-o" aria-hidden="true"></i>
								<span class="total-count">${favCount!=null?favCount:'0'}</span>
							</a>
						</div>
						<div class="sinlge-bar">
							<a href="/DTNsShop/products-order.html" class="single-icon" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Đơn hàng của bạn">
								<i class="fa fa-car" aria-hidden="true"></i>
								<span class="total-count">${ordersCount!=null?ordersCount:'0'}</span>
							</a>
						</div>
              <div class="sinlge-bar shopping">
							<a href="carts.html" class="single-icon"><i
								class="fa fa-shopping-cart" aria-hidden="true"></i><span
								class="total-count">${NoOfItems != null?NoOfItems:'0'}</span></a>
							<div class="shopping-item">
								<div class="dropdown-cart-header">
									<span>${NoOfItems != null?NoOfItems:'0'} Sản phẩm</span> <a href="/DTNsShop/carts.html">Giỏ hàng</a>
								</div>
								<p ${NoOfItems==0?'':'hidden'}>Chưa có sản phẩm</p>
								<ul class="shopping-list" >
									<c:forEach	var="cartitem" items="${cartItems}">
										<li>
										<a href="/DTNsShop/carts.html/remove/${cartitem.idItem}" class="remove" title="Remove this item">
										<i class="fa fa-remove"></i></a> 
												<a class="cart-img" href="/DTNsShop/products-detail.html/${cartitem.idProduct}"><img
												src="<c:url value='/uploads/product/${cartitem.img}'/>" alt="#"></a>
											<h4>
												<a href="/DTNsShop/products-detail.html/${cartitem.idProduct}">${cartitem.name}</a>
											</h4>
											<p class="quantity">
												 <span class="amount">
												 	<fmt:formatNumber>${cartitem.price}</fmt:formatNumber> VND
												 </span>
											</p>
											</li>
									</c:forEach>
								</ul>
								<div class="bottom" ${NoOfItems==0?'hidden':''}>
									<!--  <div class="total">
				                      <span>Total</span>
				                      <span class="total-amount">$134.00</span>
				                    </div> -->
									<a href="/DTNsShop/checkout.html" class="btn animate">Thanh Toán</a>
								</div>
							</div>
							<!--/ End Shopping Item -->
						</div>
            </div>
          </div>
        </div>
      </div>
    </div>
	<!-- Header Inner -->
	<div class="header-inner">
		<div class="container">
			<div class="cat-nav-head">
				<div class="row">
					<div class="col-12">
						<div class="menu-area">
							<!-- Main Menu -->
							<nav class="navbar navbar-expand-lg">
								<div class="navbar-collapse">
									<div class="nav-inner">
										 <ul class="nav main-menu menu navbar-nav">
					                        <li><a href="/DTNsShop/index.html"><s:message code="home.title"></s:message> </a></li>
					                        <li><a href="/DTNsShop/products.html"><s:message code="home.product"></s:message> </a></li>
					                        <!-- <li><a href="#">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
					                          <ul class="dropdown">
					                            <li><a href="shop-grid.html">Shop Grid</a></li>
					                            <li><a href="cart.html">Cart</a></li>
					                            <li><a href="checkout.html">Checkout</a></li>
					                          </ul>
					                        </li> -->
					                        <li class="active"><a href="/DTNsShop/about.html"><s:message code="home.about"></s:message> </a></li>
					                        <li><a href="/DTNsShop/contact.html"><s:message code="home.contact"></s:message> </a></li>
					                      </ul>
									</div>
								</div>
							</nav>
							<!--/ End Main Menu -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ End Header Inner -->
</header>
<!--/ End Header -->