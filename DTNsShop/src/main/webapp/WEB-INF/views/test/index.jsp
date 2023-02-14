<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lab4 - Bài 5</title>
</head>
<body>
	<ul>
		<c:forEach var="item" items="${items}">
			<li>${item.name} (${item.price}) :: [<a
				href="/DTNsShop/carts.html/add/${item.id}">Add To Cart</a>]
			</li>
		</c:forEach>
		<a href="/DTNsShop/carts.html/views">Cart List</a>
	</ul>
	
</body>
</html>