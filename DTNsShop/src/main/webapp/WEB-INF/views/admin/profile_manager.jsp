<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>DTNsShop Admin | Profile Manager</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<%@ include file="/WEB-INF/common/admin/head.jsp"%>
</head>
<body>
	<div class="page">
		<!-- Main Navbar-->
		<%@ include file="/WEB-INF/common/admin/header.jsp"%>
		<div class="page-content d-flex align-items-stretch">
			<%@ include file="/WEB-INF/common/admin/slidebarProfile.jsp"%>
			<div class="content-inner w-100">
				<%@ include file="/WEB-INF/common/admin/profile-manager/content.jsp"%>
				<%@ include file="/WEB-INF/common/admin/footer.jsp"%>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/common/admin/foot.jsp"%>
</body>

</html>