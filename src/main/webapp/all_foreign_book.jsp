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
<title>Sách Nước Ngoài</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f4f2f0">
	<%@include file="all_component/Navbar.jsp"%>
	
	<div class="grid">
		<img src="img/banner/sach-van-hoc-27082018.jpg" style="width: 100%">
		<h1>Sách Nước Ngoài</h1>
		<div class="container-fluid">
			<div class="row">		
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllForeignBook();
			for (BookDtls b: list) 
			{%>
				<div class="col-md-3" style="margin-top: 5%">
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
									<button class="Addtocart__btn">Thêm vào giỏ hàng</button>
								</a> 
							<%
							} else {
							%> 
								<a href="cart?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>">
									<button class="Addtocart__btn">Thêm vào giỏ hàng</button>
								</a> 
							<% 
							}
							%>	
								<a href="view_books.jsp?bid=<%=b.getBookID() %>">
									<button class="Detail__btn">Xem chi tiết</button>
								</a>
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