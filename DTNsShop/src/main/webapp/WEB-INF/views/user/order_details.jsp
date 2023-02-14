<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DTNsShop | Đơn hàng DH00${orders.id} |Thông tin chi tiết đơn hàng </title>
     <link rel="icon" href="<c:url value='/templates/user/img/logo1.png'/>" type="image/x-icon">
      <!--DTN Style  -->
  	<link rel="stylesheet" href="<c:url value='/templates/user/dtnStyle.css'/>">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</head>
<body style="background:url(https://img2.goodfon.com/wallpaper/nbig/a/4c/material-tekstura-geometriya-4593.jpg);background-size: cover;">
    <section class="h-100 gradient-custom">
        <div class="container mt-2 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-10 col-xl-8">
                    <div class="card" style="border-radius: 10px;border-top: 10px solid rgb(236, 57, 57);
                    border-bottom: 5px solid rgb(236, 57, 57);border-left: 10px solid black;border-right: 5px solid black;">
                        <div class="card-header px-4 py-5 mb-0" style="background: white;">
                            <h5 class="mb-0">Cảm ơn bạn đã mua hàng , <span
                                    class="text-black-50">${user.username}</span> !</h5>
                        </div>
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <p class="lead fw-normal mb-0" style="color: #a80808;">Mã DH: DH00${orders.id}</p>
                            </div>
                            <div class="card shadow-0 border mb-4">
                                <div class="card-body">
                                <c:forEach var="item" items="${orderd}">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="/uploads/product/${item.product.images}"
                                                class="img-fluid" alt="Phone" width="72px">
                                        </div>
                                        <div
                                            class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0">${item.product.name}</p>
                                        </div>
                                        <div
                                            class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">${item.product.category.name}</p>
                                        </div>
                                        <div
                                            class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">${item.quantity}</p>
                                        </div>
                                        <div
                                            class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small"><fmt:formatNumber>${item.price}</fmt:formatNumber> VND</p>
                                        </div>
                                        <div
                                            class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small"><fmt:formatNumber>${item.price*item.quantity}</fmt:formatNumber> VND</p>
                                        </div>
                                    </div>
                                    <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                    </c:forEach>
                                </div>
                                
                            </div>

                            <div class="d-flex justify-content-between pt-2">
                                <p class="fw-bold mb-0">Chi tiết đơn hàng:</p>
                                <p class="text-muted mb-0"><span class="fw-bold me-4">Tổng:</span> <fmt:formatNumber>${ammount}</fmt:formatNumber> VND</p>
                            </div>

                            <div class="d-flex justify-content-between pt-2">
                                <h6 class="text-muted mb-0 d-flex justify-content-between">Họ tên người nhận : <p class="ms-2 text-danger">${user.fullname}.</p></h6>
                                <p class="text-muted mb-0"><span class="fw-bold me-4">(+) Phí ship:</span> 0 VND</p>
                            </div>

                            <div class="d-flex justify-content-between pt-2">
                            	<h6 class="text-muted mb-0 d-flex justify-content-between">Số điện thoại :<p class="ms-2 text-danger"> ${user.phonenumber}.</p></h6>
                                <p class="text-muted mb-0"><span class="fw-bold me-4">(-) Giảm giá:</span> 0 VND</p>
                                
                            </div>

                            <div class="d-flex justify-content-between pt-2">
                            	<h6 class="text-muted mb-0 d-flex justify-content-between">Email :<p class="ms-2 text-danger"> ${user.email}.</p></h6>
                            </div>

                            <div class="d-flex justify-content-between pt-2">
                            	<h6 class="text-muted mb-0 d-flex justify-content-between">Địa chỉ :<p class="ms-2 text-danger">${orders.address}</p></h6>
                            </div>

                            <div class="d-flex justify-content-between">
                                <h6 class="text-muted mb-0 d-flex justify-content-between">Ngày đặt hàng : <p class="ms-2 text-danger"><fmt:formatDate pattern="dd-MM-yyyy" value="${orders.createdate}"/></p> </h6>
                            </div>
                             <div class="d-flex justify-content-between">
                                <h6 class="text-dark d-flex justify-content-between mb-0">Trạng thái :<p class="ms-2 text-primary">${orders.status?'Đã giao':'Đang chờ giao hàng.'}</p></h6>
                            </div>

                        </div>
                        <div class="card-footer border-0 mb-2"
                            style="border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;background: #ffffff;">
                            <hr class="" style="background-color: #e0e0e0; opacity: 1;">
                            <h5 class="d-flex align-items-center justify-content-end text-danger mb-0">Tổng tiền:
                                <span class="h5 mb-0 ms-2"><fmt:formatNumber>${ammount}</fmt:formatNumber> VND</span>
                            </h5>
                            <div class="justify-content-start">
                                <a href="${urisu!=null?urisu:'/DTNsShop/products.html'}" class="btn btn-danger">Tiếp tục mua hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>