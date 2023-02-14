<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lab4 - Bài 5</title>
</head>
<body>
	<table border="1" style="width:100%">
		<tr>
			<td>No.</td>
			<td>Name</td>
			<td>Quanlity</td>
			<td>Price</td>
			<td></td>
		</tr>
		<c:set var="no" value="1"></c:set>
		<c:forEach var="item" items="${cartItems}">
			<form action="/DTNsShop/carts.html/update/${item.idItem}" method="post">
				<tr>
					<td>${no}</td>
					<td>${item.name}</td>
					<td><input type="hidden" name="id" value="${item.idItem}">
						<input type="number" value="${item.qty}" name="qty"
						onblur="this.form.submit()" min="1" max="100"></td>
					<td>${item.price}</td>
					<td><a href="/DTNsShop/carts.html/remove/${item.idItem}">Remove</a>
						<button>Update</button>
					</td>
				</tr>
			</form>
			<c:set var="no" value="${no + 1}"></c:set>
		</c:forEach>
	</table>
	<h3>Tổng tiền: <fmt:formatNumber type="number" maxFractionDigits="2" value="${total}" /> || Số lượng sản phẩm: ${NoOfItems}</h3>
	<a href="/DTNsShop/carts.html/clear">Clear Cart</a>
	<a href="/DTNsShop/carts.html">Add more</a>
</body>
</html>