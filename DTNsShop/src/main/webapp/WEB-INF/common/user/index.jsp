<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Meta Tag -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="copyright" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title Tag  -->
    <title>DTNsShop | Trang chủ</title>
    <%@ include file="/WEB-INF/common/user/head.jsp" %>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="banner"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	 <%@ include file="/WEB-INF/common/user/foot.jsp" %>
</body>
</html>