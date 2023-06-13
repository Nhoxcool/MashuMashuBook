<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt hàng thành công</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: rgb(189,228,251)">
<%@include file="all_component/Navbar.jsp"%>
	<div class="container text-center" style="margin-top: 5%; background: white; height: 500px">
		<i class="fa-solid fa-circle-check fa-8x" style="color: green; margin-top: 8%"></i>
		<p style="font-size: 3.0rem">Cảm Ơn Bạn</p>
		<p style="font-size: 3.0rem">Đơn đặt hàng của bạn đã thành công</p>
		<p style="font-size: 3.0rem">Trong Vòng từ 2-3 ngày sẽ được gửi đến địa chỉ của bạn</p>
		<a href="index.jsp" style="text-decoration: none;"><button class="HomeButton">Trang Chủ</button></a>
		<a href="order.jsp"  style="text-decoration: none;"><button class="CheckOrderButton">Xem đơn đặt hàng của bạn</button></a>
	</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>