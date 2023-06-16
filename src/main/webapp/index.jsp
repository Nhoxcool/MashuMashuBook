<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.*"%>
<%@page import="com.DB.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<%@include file="all_component/allCss.jsp"%>
<style>
</style>
</head>
<body style="background-color: #f4f2f0; z-index: 1">
	<div id="top">
	</div>
	<%@include file="all_component/Navbar.jsp"%>
		<c:if test= "${not empty addCart }">
	
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
				showToast();
				function showToast(content)
				{
				    $('#toast').addClass("display");
				    $('#toast').html(content);
				    setTimeout(()=>{
				        $("#toast").removeClass("display");
				    },2000)
				}	
		</script>
		
		<c:remove var="addCart" scope="session"/>
	</c:if>
	<div class="grid">
		<div class="advertise__container">
			<div class="advertise__container-Slider">
				<div id="carouselExampleFade" class="carousel slide carousel-fade">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="img/HoaCu_840x320_T523.jpg" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/TuSachThieuNhi_T423_Banner_Slide_840x320_1.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/Slide_V1_840x320.jpg" class="d-block w-100"
								alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"	
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="advertise-img-container">
				<div class="advertise-img">
					<a> <img src="img/banner/PoticoT5_FAHASA 392x156 .png" alt=""
						class="advertise-img-1">
					</a>
				</div>
				<div class="advertise-img">
					<a> <img src="img/banner/Gift_subbanner_392x156.jpg" alt=""
						class="advertise-img-2">
					</a>
				</div>
			</div>
		</div>
		<div class="advertise-img-container-2">
			<img src="img/banner/banner1.png" alt="" class="advertise-img-3">
			<img src="img/banner/banner-2.png" alt="" class="advertise-img-3">
			<img src="img/banner/banner3.png" alt="" class="advertise-img-3">
			<img src="img/banner/banner-4.png" alt="" class="advertise-img-3">
		</div>
	</div>
	<!-- 	San pham -->
	<div class="grid" style="margin-top: 3%">
		<div class="container">
			<div class="title">
				<h2 class="title__text">Sách Đang Bán</h2>
			</div>
			<div class="row">
				<% 
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list2 = dao2.getRecentBooks();
				for(BookDtls b: list2) {
				%>
				<div class="col-md-3 book__product">
					<div class="card crd-ho">
						<div class="card-body">
						<a href="view_books.jsp?bid=<%=b.getBookID() %>" style="text-decoration: none; color: #333;">
							<div class="text-center">
								<img src="book/<%=b.getPhotoName() %>" alt="" style="width: 80%; height: 50%" class="img-thumblin">
							</div>
							<p style="font-size: 1.6rem"><%=b.getBookName() %>
							<p>
							<p style="font-size: 1.6rem"><%=b.getAuthor() %>
							<p>
							<p style="font-size: 1.6rem; color: #c92127"><%=b.getPrice() %>đ</p>
							<div class="text-center">
							<%
							if (us == null) {
							%>	
								<a href="login.jsp">
									<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
								</a> 
							<%
							} else {
							%> 
								<%
								if (!us.getName().equals("Admin")) {
								%>	
									<a href="homebookcart?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								} else {
								%>
									<a href="">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								}
								%> 
							<% 
							}
							%>	

							</div>
							</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-center mt1">
				<a href="all_recent_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>
		</div>
	</div>

	<!-- End Recent Book	 -->

	<div class="grid" style="margin-top: 3%">
		<div class="container">
			<div class="title">
				<h2 class="title__text">Sách Giáo Khoa</h2>
			</div>
			<div class="row">
				<% 
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getSGKBook();
				for(BookDtls b: list) {
				%>
				<div class="col-md-3 book__product">
					<div class="card crd-ho">
						<div class="card-body">
						<a href="view_books.jsp?bid=<%=b.getBookID() %>" style="text-decoration: none; color: #333;">
							<div class="text-center">
								<img src="book/<%=b.getPhotoName() %>" alt=""
									style="width: 80%; height: 50%" class="img-thumblin">
							</div>
							<div>
								<p style="font-size: 1.6rem"><%=b.getBookName() %>
								</p>
								<p style="font-size: 1.6rem"><%=b.getAuthor() %>
								</p>
								<p style="font-size: 1.6rem; color: #c92127"><%=b.getPrice() %>đ</p>
							</div>
							<div class="text-center">
								<%
								if (us == null) {
								%>	
									<a href="login.jsp">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								} else {
								%> 
									<%
									if (!us.getName().equals("Admin")) {
									%>	
										<a href="homebookcart?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>">
											<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
										</a> 
									<%
									} else {
									%>
										<a href="">
											<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
										</a> 
									<%
									}
									%> 
								<% 
								}
								%>	
							</div>
							</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-center mt1">
				<a href="all_SGK_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>
		</div>
	</div>
	<!-- End of Sách giáo khoa -->
	
	<!-- Sách văn học -->
		<div class="grid" style="margin-top: 3%">
		<div class="container">
			<div class="title">
				<h2 class="title__text">Sách Văn học</h2>
			</div>
			<div class="row">
				<% 
				BookDAOImpl dao4 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list4 = dao4.getliteraryBooks();
				for(BookDtls b: list4) {
				%>
				<div class="col-md-3 book__product">
					<div class="card crd-ho">
						<div class="card-body">
						<a href="view_books.jsp?bid=<%=b.getBookID() %>" style="text-decoration: none; color: #333;">
							<div class="text-center">
								<img src="book/<%=b.getPhotoName() %>" alt=""
									style="width: 80%; height: 50%" class="img-thumblin">
							</div>
							<p style="font-size: 1.6rem"><%=b.getBookName() %>
							<p>
							<p style="font-size: 1.6rem"><%=b.getAuthor() %>
							<p>
							<p style="font-size: 1.6rem; color: #c92127"><%=b.getPrice() %>đ</p>
							<div class="text-center">
							<%
							if (us == null) {
							%>	
								<a href="login.jsp">
									<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
								</a> 
							<%
							} else {
							%> 
								<%
								if (!us.getName().equals("Admin")) {
								%>	
									<a href="homebookcart?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								} else {
								%>
									<a href="">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								}
								%> 
							<% 
							}
							%>	
							</div>
						</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-center mt1">
				<a href="all_literary_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>
		</div>
	</div>
	
	
	
		<!-- Sách nước ngoài -->
		<div class="grid" style="margin-top: 3%">
		<div class="container">
			<div class="title">
				<h2 class="title__text">Sách Nước Ngoài</h2>
			</div>
			<div class="row">
				<% 
				BookDAOImpl dao5 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list5 = dao5.getForeignBook();
				for(BookDtls b: list5) {
				%>
				<div class="col-md-3 book__product">
					<div class="card crd-ho">
						<div class="card-body">
						<a href="view_books.jsp?bid=<%=b.getBookID() %>" style="text-decoration: none; color: #333;">
							<div class="text-center">
								<img src="book/<%=b.getPhotoName() %>" alt=""
									style="width: 80%; height: 50%" class="img-thumblin">
							</div>
							<p style="font-size: 1.6rem"><%=b.getBookName() %>
							<p>
							<p style="font-size: 1.6rem"><%=b.getAuthor() %>
							<p>
							<p style="font-size: 1.6rem; color: #c92127"><%=b.getPrice() %>đ</p>
							<div class="text-center">
							<%
							if (us == null) {
							%>	
								<a href="login.jsp">
									<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
								</a> 
							<%
							} else {
							%> 
								<%
								if (!us.getName().equals("Admin")) {
								%>	
									<a href="homebookcart?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								} else {
								%>
									<a href="">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								}
								%> 
							<% 
							}
							%>	
							</div>
						</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-center mt1">
				<a href="all_foreign_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>
		</div>
	</div>
	
	
	<!-- Sách cũ -->
	<div class="grid" style="margin-top: 3%">
		<div class="container">
			<div class="title">
				<h2 class="title__text">Sách Cũ</h2>
			</div>
			<div class="row">
				<% 
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list3 = dao3.getOldBooks();
				for(BookDtls b: list3) {
				%>
				<div class="col-md-3 book__product">
					<div class="card crd-ho">
						<div class="card-body">
						<a href="view_books.jsp?bid=<%=b.getBookID() %>" style="text-decoration: none; color: #333;">
							<div class="text-center">
								<img src="book/<%=b.getPhotoName() %>" alt=""
									style="width: 80%; height: 50%" class="img-thumblin">
							</div>
							<p style="font-size: 1.6rem"><%=b.getBookName() %> (<%=b.getBookCategory() %>)
							<p>
							<p style="font-size: 1.6rem"><%=b.getAuthor() %>
							<p>
							<p style="font-size: 1.6rem; color: #c92127"><%=b.getPrice() %>đ</p>
							<div class="text-center">
							<%
							if (us == null) {
							%>	
								<a href="login.jsp">
									<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
								</a> 
							<%
							} else {
							%> 
								<a href="homebookcart?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>">
									<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
								</a> 
							<% 
							}
							%>	
								
							</div>
							</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-center mt1">
				<a href="all_old_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>
		</div>
	</div>
	
	<a href="#top">
	<div class="back_top_top" style="position: fixed; top:90%; right:5%;">
		<img src="img/banner/7988932-removebg-preview.png" style="width: 50px; height: 50px">
	</div>
	</a>

	<%@include file="all_component/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>