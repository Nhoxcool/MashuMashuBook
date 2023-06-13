<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/852351e3ff.js" crossorigin="anonymous"></script>
<%@include file="all_component/allCss.jsp"%>
<link rel="stylesheet" href="all_component/css/Setting.css?version=1">
	<%@include file="all_component/Navbar.jsp"%>
</head>
<body style="background-color: rgb(189,228,251)">
	<c:if test="${empty user}">
		<c:redirect url="login.jsp"/>
	</c:if>
	<div class="container" style="margin-top: 5%">
		<div class="row">
			<div class="col-md-4 mt-3">
				<a href="sell_book.jsp" class="option">
					<div class="card" style="height: 200px; padding-top: 40px">
						<div class="card-body text-center" class="option__img">
							<i class="fa-solid fa-book icon"></i>
							<p class="btn_text">Bán sách cũ</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="old_book.jsp" class="option">
					<div class="card" style="height: 200px; padding-top: 40px">
						<div class="card-body text-center" class="option__img">
							<i class="fa-solid fa-boxes-packing icon"></i>
							<p class="btn_text">Sách cũ của bạn</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="Edit_profile.jsp" class="option">
					<div class="card" style="height: 200px; padding-top: 40px ">
						<div class="card-body text-center" class="option__img">
							<i class="fa-solid fa-lock icon"></i>
							<p class="btn_text">Đăng nhập và bảo mật</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="user_address.jsp" class="option">
					<div class="card" style="height: 200px; padding-top: 40px">
						<div class="card-body text-center" class="option__img">
							<i class="fa-solid fa-location-dot icon"></i>
							<p class="btn_text">Địa chỉ của bạn</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="order.jsp" class="option">
					<div class="card" style="height: 200px; padding-top: 40px">
						<div class="card-body text-center" class="option__img">
							<i class="fa-solid fa-box icon"></i>
							<p class="btn_text">Đơn đặt hàng của bạn</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="#" class="option">
					<div class="card" style="height: 200px; padding-top: 40px">
						<div class="card-body text-center" class="option__img">
							<i class="fa-solid fa-handshake-angle icon"></i>
							<p class="btn_text">Trung tâm trợ giúp</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>