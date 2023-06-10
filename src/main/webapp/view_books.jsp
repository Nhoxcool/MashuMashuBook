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
<title></title>
<link rel="stylesheet" href="all_component/css/ViewBook.css">
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f4f2f0"	>
	<%@include file="all_component/Navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>
	
	<div class="grid" style="background-color: #ffffff; height: 30px">
		<p style="padding: 3px 18px; font-size: 1.6rem"><a href="index.jsp" class="path">Trang chủ </a> > 
		<%
		if (b.getBookCategory().equals("Sách giáo khoa"))
		{%>
			<a href="all_SGK_book.jsp" class="path"> Sách giáo khoa </a> >
		
		<% 	
		}else if (b.getBookCategory().equals("Sách văn học")){	
		%>
			<a href="all_literary_book.jsp" class="path"> Sách văn học </a> >
		<% 	
		}else if (b.getBookCategory().equals("Cũ")){	
		%>
			<a href="all_literary_book.jsp" class="path"> Sách Cũ </a> >
		<% 
		}
		%>
			<a href="view_books.jsp?bid=<%=b.getBookID() %>"  class="path"><%=b.getBookName() %></a>
		</p>
	</div>
	<div class="grid" style="margin-top: 3%; display: flex; background-color: #ffffff; " >
		<div class="row" style="width: 100%; padding: 50px 50px">
			<div class ="Product-img col-6">
				<img src="book/<%=b.getPhotoName() %>" style="width: 80%; height: 400px;">
			</div>
			<div class="Product_detail col-6">
				<%
				if (b.getBookCategory().equals("Cũ")) {
				%>
				<p style="font-size: 2.4rem"><%=b.getBookName() %>(Cũ)
				<p>
				<%
				}else {
				%>
				<p style="font-size: 2.4rem"><%=b.getBookName() %>
				<p>
				<%
				}
				%> 				
				<p class="Author"> Tác giả: <%=b.getAuthor() %></p>
				<%
				if (b.getBookCategory().equals("Cũ"))
				{%>
				<p class="Author"> Người bán: <%=b.getEmail() %></p>
				<% 	
				}%>
				<p class="Category"> Thể loại: <%=b.getBookCategory() %></p>
				<p class="Price"> Giá: <span style="color: #c92127"><%=b.getPrice() %>đ</span></p>
				<p class="Ship"> Chính sách giao hàng: <span style="color: #0099FF">free ship</span> </p>
				<p class="Return" >Đổi trả trong vòng: <span style="color: #0099FF">30 ngày </span></p>	
				<%
				User us = (User)session.getAttribute("user");
				%>
				<%
				if (us == null) {
				%>
				<a href="login.jsp">
					<button class="Addtocart__btn">Thêm vào giỏ hàng</button>
				</a>
				<%
				} else {
				%>
				<a href="cart?bid=<%=b.getBookID()%>&&uid=<%=us.getId()%>">
					<button class="Addtocart__btn">Thêm vào giỏ hàng</button>
				</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	
	<div class="grid" style="margin-top: 5%; background-color: #ffffff">
		<div style="padding: 10px 10px">
			<h2>Thông tin sản phẩm</h2>
			<p class="book_detail">
				<%=b.getBookDetail() %>
			</p>
		</div>
	</div>
	
	
	<%@include file="all_component/footer.jsp"%>
</body>
</html>