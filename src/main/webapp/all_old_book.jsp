<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách văn học</title>
<%@include file="all_component/allCss.jsp"%>
<link rel="stylesheet" href="all_component/css/ViewBook.css">
</head>
<body style="background-color: #f4f2f0">
	<%@include file="all_component/Navbar.jsp"%>
	
	<div class="grid" style="background-color: #ffffff; height: 30px">
		<p style="padding: 3px 18px; font-size: 1.6rem"><a href="index.jsp" class="path">Trang chủ </a> > 
		<a href="all_old_book.jsp" class="path"> Sách Cũ </a>	
		</p>
	</div>

	<div class="grid">
		<img src="img/banner/sach-van-hoc-27082018.jpg" style="width: 100%">
		<h1 style="margin-top: 2%">Sách Cũ</h1>
		<div class="container-fluid">
			<div class="row">		
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllOldBooks();
			for (BookDtls b: list) 
			{%>
				<div class="col-md-3 book__product" style="margin-top: 5%">
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
								<a href="cart?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>">
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
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>