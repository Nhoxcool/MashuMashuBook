<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MashuMashuBook: Index</title>
<%@include file="allCss.jsp"%>
<link rel="stylesheet" href="css/Base.css">
<link rel="stylesheet" href="css/Main1.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>		
	<header class="header">
		<div class="grid">
			<nav class="header__navbar">
				<ul class="header__navbar-list">
					<li
						class="header__navbar-item header__navbar-item-has-qr header__navbar-item__Separate">
						Tải ứng dụng <!-- Header QR code -->
						<div class="header__qr">
							<img
								src="img/qrcode_60004582_089069e238c6b4934a77b910d1695c04 (1).png"
								alt="QR code" class="header__qr-img">
							<div class="header__qr-apps">
								<a href="" class="header__qr-dowload-link"> <img
									src="img/googleplay.png" alt="Google Play"
									class="header__qr-dowload-img">
								</a> <a href="" class="header__qr-dowload-link"> <img
									src="img/appstore.png" alt="App Store"
									class="header__qr-dowload-img">
								</a>
							</div>
						</div>
					</li>
					<li class="header__navbar-item"><span
						class="header__navbar-title--no-pointer">Kết nối</span> <a href=""
						class="header__navabar-icon-link"> <i
							class="header__navbar-icon fa-brands fa-facebook"></i>
					</a> <a href="" class="header__navabar-icon-link"> <i
							class="header__navbar-icon fa-brands fa-instagram"></i>
					</a></li>
				</ul>
				<ul class="header__navbar-list">
					<li class="header__navbar-item"><a href=""
						class="header__navbar-link"> <i
							class="header__navbar-icon fa-solid fa-bell"></i> Liên hệ với
							chúng tôi
					</a></li>
					<li class="header__navbar-item">
					<a href="setting.jsp"class="header__navbar-link"> 
					<i class="header__navbar-icon fa-regular fa-circle-question"></i>
							Cài Đặt
					</a>
					</li>
					<c:if test = "${not empty user }">
					<a href=""> 
					<li class="header__navbar-item header__navbar-item__Strong header__navbar-item__Separate">${user.name}</li>
					</a>
					<a href="logout">
					<li class="header__navbar-item header__navbar-item__Strong ">Logout</li>
					</a>
					</c:if>
					
					<c:if test = "${empty user }">
					<a href="register.jsp"> 
					<li class="header__navbar-item header__navbar-item__Strong header__navbar-item__Separate">Đăng
						ký</li>
					</a>
					<a href="login.jsp">
					<li class="header__navbar-item header__navbar-item__Strong ">Đăng
						nhập</li>
					</a>
					</c:if>
				</ul>
			</nav>

			<!-- Header with Search -->
			<div class="header-with-search">
				<div class="header__logo">
					<a href="index.jsp">
						<img class="header__logo-img" src="img/logo-removebg-preview.png"
						alt="">
					</a>	
				</div>

				<div class="header__menu">
					<i class="fa-solid fa-bars"></i>
					<div class="header__dropdown-menu">
						<div class="header__dropdown-menu-directory">
							<ul class="main-directory">
								<li class="main-directory-item-title"><h3>Danh mục sản
										phẩm</h3></li>
								<a href="all_recent_book.jsp" style="text-decoration: none; color:#333">
									<li class="main-directory-item">Sách hiện có</li>
								</a>
								<a href="all_SGK_book.jsp" style="text-decoration: none; color:#333">
									<li class="main-directory-item">Sách giáo khoa</li>
								</a>
								<a href="all_literary_book.jsp" style="text-decoration: none; color:#333">
									<li class="main-directory-item">Sách văn học</li>
								</a>
								<a style="text-decoration: none; color:#333">
									<li class="main-directory-item">Sách kinh tế</li>
								</a>
								<a style="text-decoration: none; color:#333">
									<li class="main-directory-item">Sách kỹ năng</li>
								</a>
								<a style="text-decoration: none; color:#333">
									<li class="main-directory-item">Sách Cũ</li>
								</a>
							</ul>
						</div>
					</div>
				</div>
				<div class="header__search">
					<form action="search.jsp" method="post" class="header__search">
					<input type="text" id="menu_search"class="header__search-input" name="search" 
						placeholder="Nhập để tìm kiếm sản phẩm">
					<button class="header__search-btn" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
					</form>
				</div>
				
				<c:if test = "${not empty user }">
					<a href="checkout.jsp">
						<div class="header__cart">
							<i class="header__cart-icon fa-solid fa-cart-shopping"></i>
						</div>
					</a>
				</c:if>
			</div>

		</div>
	</header>
</body>
</html>